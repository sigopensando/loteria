import mysql from "mysql2";
import dotenv from 'dotenv';
dotenv.config();

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    database: process.env.MYSQL_DATABASE,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD
}).promise()


export async function getAllCards() {
    const [cards] = await pool.query("select * from loteria_card");
    return cards;
}

export async function getCard(id) {
    const [card] = await pool.query("select * from loteria_card where id = ?", [id]);
    return card[0];
}

export async function getAllBoards() {
    const [boards] = await pool.query("select * from loteria_board");
    return boards;
}

export async function getBoardWithCards(id) {
    const [boards] = await pool.query("select * from loteria_board_card where board_id = ?", [id]);
    const cards = boards.map(({card_id}) => card_id);
    return {id, cards};
}

async function validateIfBoardExists(board) {
    const savedBoards = await getAllBoards();
    savedBoards.map(async ({id}) => {
        const boardWithCards = await getBoardWithCards(id);
        if (JSON.stringify(boardWithCards.cards) == JSON.stringify(Array.from(board.content)))
            throw new Error("The board already exists");
    })
}

async function createBoard(board) {
    if (board.content.size != 16) throw new Error("The board content must be form by 16 integer different values");
    validateIfBoardExists(board);
    const [result] = await pool.query("insert into loteria_board() values()");
    const boardId = result.insertId;
    board.content.forEach(async (card) => {
        await pool.query("insert into loteria_board_card(board_id, card_id) values(?, ?)", [boardId, card])
    })
    return boardId;
}

function getRandomSavedBoards(size, savedBoards) {
    const randomSavedBoards = new Set();
    while (randomSavedBoards.size < size) {
        const randomIndex = Math.floor(Math.random() * savedBoards.length);
        randomSavedBoards.add(savedBoards[randomIndex]);
    }
    return Array.from(randomSavedBoards);
}

export async function getOrCreateBoardsByNumber(numberOfBoardsRequested) {
    const savedBoards = await getAllBoards();
    if (numberOfBoardsRequested < savedBoards.length) return getRandomSavedBoards(numberOfBoardsRequested, savedBoards);
    let boardsGoal = savedBoards.length
    while (numberOfBoardsRequested > boardsGoal) {

        let content = new Set();
        while (content.size < 16) {
            const randomIndex = Math.floor(Math.random() * 54) + 1;
            content.add(randomIndex);
        }
        const board = {
            content
        }
        // todo handle improbable duplicated scenario
        await createBoard(board);
        boardsGoal++;

    }

    return await getAllBoards();
}