create database loteria;
use loteria;

create table loteria_card
(
    id        integer primary key,
    name      varchar(255) not null,
    phrase    varchar(255) not null,
    createdAt timestamp    not null default current_timestamp
);

INSERT INTO loteria_card (id, name, phrase)
VALUES (1, 'El gallo', 'El que le cantó a San Pedro no le volverá a cantar'),
       (2, 'El diablito', 'Pórtate bien cuatito, si no te lleva el coloradito'),
       (3, 'La dama', 'Puliendo el paso, por toda la calle real'),
       (4, 'El catrín', 'Don Ferruco en la alameda, su bastón quería tirar'),
       (5, 'El paraguas', ' "Para el sol y para el agua"'),
       (6, 'La sirena', 'Con los cantos de sirena, no te vayas a marear'),
       (7, 'La escalera', 'Súbeme paso a pasito, no quieras pegar brinquitos'),
       (8, 'La botella', ' "La herramienta del borracho"'),
       (9, 'El barril', 'Tantobebió el albañil, que quedó como barril'),
       (10, 'El árbol', 'El que a buen árbol se arrima, buena sombra le cobija'),
       (11, 'El melón', 'Me lo das o me lo quitas'),
       (12, 'El valiente', 'Por qué le corres cobarde, trayendo tan buen puñal'),
       (13, 'El gorrito', 'Ponle su gorrito al nene, no se nos vaya a resfriar'),
       (14, 'La muerte', 'La muerte tilica y flaca'),
       (15, 'La pera', 'El que espera, desespera'),
       (16, 'La bandera', 'Verde blanco y colorado, la bandera del soldado'),
       (17, 'El bandolón', 'Tocando su bandolón, está el mariachi Simón'),
       (18, 'El violoncello', 'Creciendo se fue hasta el cielo, y como no fue violín, tuvo que ser violoncello'),
       (19, 'La garza', 'Al otro lado del río tengo mi banco de arena, donde se sienta mi chata pico de garza morena'),
       (20, 'El pájaro', 'Tu me traes a puros brincos, como pájaro en la rama'),
       (21, 'La mano', 'La mano de un criminal'),
       (22, 'La bota', 'Una bota igual que la otra'),
       (23, 'La luna', 'El farol de los enamorados'),
       (24, 'El cotorro', 'Cotorro cotorro saca la pata, y empiézame a platicar'),
       (25, 'El borracho', 'A qué borracho tan necio ya no lo puedo aguantar'),
       (26, 'El negrito', 'El que se comió el azúcar'),
       (27, 'El corazón', 'No me extrañes corazón, que regreso en el camión'),
       (28, 'La sandía', 'La barriga que Juan tenía, era empacho de sandía'),
       (29, 'El tambor', 'No te arrugues, cuero viejo, que te quiero pa'' tambor'),
       (30, 'El camarón', 'Camarón que se duerme, se lo lleva la corriente'),
       (31, 'Las jaras', 'Las jaras del indio Adán, donde pegan, dan'),
       (32, 'El músico', 'El músico trompas de hule, ya no me quiere tocar'),
       (33, 'La araña', 'Atarántamela a palos, no me la dejes llegar'),
       (34, 'El soldado', 'Uno, dos y tres, el soldado p''al cuartel'),
       (35, 'La estrella', 'La guía de los marineros'),
       (36, 'El cazo', 'El caso que te hago es poco'),
       (37, 'El mundo', 'Este mundo es una bola, y nosotros un bolón'),
       (38, 'El Apache', '¡Ah, Chihuahua! Cuánto apache con pantalón y huarache'),
       (39, 'El nopal', 'Al nopal lo van a ver, nomás cuando tiene tunas'),
       (40, 'El alacrán', 'El que con la cola pica, le dan una paliza'),
       (41, 'La rosa', 'Rosita, Rosaura, ven que te quiero ahora'),
       (42, 'La calavera', 'Al pasar por el panteón, me encontré un calaverón'),
       (43, 'La campana', 'Tú con la campana y yo con tu hermana'),
       (44, 'El cantarito', 'Tanto va el cántaro al agua, que se quiebra y te moja las enaguas'),
       (45, 'El venado', 'Saltando va buscando, pero no ve nada'),
       (46, 'El Sol', 'La cobija de los pobres'),
       (47, 'La coron', 'a El sombrero de los reyes'),
       (48, 'La chalupa', 'Rema que rema Lupita, sentada en su chalupita'),
       (49, 'El pino', 'Fresco y oloroso, en todo tiempo hermoso'),
       (50, 'El pescado', 'El que por la boca muere, aunque mudo fuere'),
       (51, 'La palma', 'Palmero, sube a la palma y bájame un coco real'),
       (52, 'La maceta', 'El que nace pa''maceta, no sale del corredor'),
       (53, 'El arpa', 'Arpa vieja de mi suegra, ya no sirves pa''tocar'),
       (54, 'La rana', 'Al ver a la verde rana, qué brinco pegó tu hermana');

create table loteria_board
(
    id        integer auto_increment key auto_increment,
    name      varchar(255),
    createdAt timestamp not null default current_timestamp
);

insert into loteria_board (name)
values ('Primer tablero'),
       ('Segundo tablero');

create table loteria_board_card
(
    board_id integer,
    card_id  integer,
    foreign key (board_id) references loteria_board (id),
    foreign key (card_id) references loteria_card (id),
    primary key (board_id, card_id)
);

insert into loteria_board_card (board_id, card_id)
values
    (1, 2),
    (1, 11),
    (1, 9),
    (1, 44),
    (1, 51),
    (1, 18),
    (1, 20),
    (1, 21),
    (1, 12),
    (1, 41),
    (1, 33),
    (1, 42),
    (1, 50),
    (1, 28),
    (1, 10),
    (1, 38),
    (2, 21),
    (2, 17),
    (2, 15),
    (2, 41),
    (2, 46),
    (2, 33),
    (2, 29),
    (2, 22),
    (2, 54),
    (2, 53),
    (2, 18),
    (2, 27),
    (2, 39),
    (2, 12),
    (2, 31),
    (2, 49);