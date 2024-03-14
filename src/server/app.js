import express from 'express';
import {getAllBoards, getAllCards, getBoardWithCards, getCard, getOrCreateBoardsByNumber} from "./database.js";

const app = express();

app.get("/all-cards", async (req, res) => {
    const cards = await getAllCards();
    res.send(cards);
});

app.get("/card/:id", async (req, res) => {
    const card = await getCard(req.params.id);
    res.send(card);
});

app.get("/all-boards/", async (req, res) => {
    const boards = await getAllBoards();
    res.send(boards);
});

app.get("/get-or-create-boards-by-number/:size", async (req, res) => {
    const boards = await getOrCreateBoardsByNumber(req.params.size);
    res.send(boards);
});

app.get("/boards-template/:id", async (req, res) => {
    const boardWithCards = await getBoardWithCards(req.params.id);
    res.send(boardWithCards);
});

app.use((err, req, res, next) => {
    console.error(err.stack)
    res.status(500).send("Something broke!")
});

app.listen(3000, () => {
    console.log("Server running on port 3000!")
});