-- PRELIMINARY, USE WITH CARE. Please check migrate.sql each time you update this tool

-- Table: Tracks
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

CREATE TABLE Tracks (id INTEGER PRIMARY KEY UNIQUE, name text, length real, startz real);

-- Hawkes Bay, New Zealand:100
INSERT INTO Tracks (id, name, length, startz) VALUES (100, 'Te Awanga Forward', 11507.4404296875, -4415.01025390625);
INSERT INTO Tracks (id, name, length, startz) VALUES (101, 'Waimarama Point Forward', 16057.8505859375, 2892.6748046875);
INSERT INTO Tracks (id, name, length, startz) VALUES (102, 'Ocean Beach', 11437.0703125, 1788.5035400390625);
INSERT INTO Tracks (id, name, length, startz) VALUES (103, 'Waimarama Point Reverse', 15844.529296875, 2074.9248046875);
INSERT INTO Tracks (id, name, length, startz) VALUES (104, 'Elsthorpe Sprint Forward', 7137.81005859375, 2893.062744140625);
INSERT INTO Tracks (id, name, length, startz) VALUES (105, 'Te Awanga Sprint Forward', 4799.84033203125, -4415.01025390625);
INSERT INTO Tracks (id, name, length, startz) VALUES (106, 'Ocean Beach Sprint Forward', 6624.0302734375, 1788.5035400390625);
INSERT INTO Tracks (id, name, length, startz) VALUES (107, 'Waimarama Sprint Forward', 8807.490234375, 2074.85498046875);
INSERT INTO Tracks (id, name, length, startz) VALUES (108, 'Waimarama Sprint Reverse', 8733.98046875, 5268.06494140625);
INSERT INTO Tracks (id, name, length, startz) VALUES (109, 'Ocean Beach Sprint Reverse', 6584.10009765625, -1950.1280517578125);
INSERT INTO Tracks (id, name, length, startz) VALUES (110, 'Te Awanga Sprint Reverse', 4688.52978515625, -2004.3233642578125);
INSERT INTO Tracks (id, name, length, startz) VALUES (111, 'Elsthorpe Sprint Reverse', 6643.490234375, 5161.2197265625);

-- Leczna County, Poland:400
INSERT INTO Tracks (id, name, length, startz) VALUES (400, 'Borysik', 9194.3203125, 7393.10205078125);
INSERT INTO Tracks (id, name, length, startz) VALUES (401, 'Zarobka', 16475.009765625, 4674.81787109375);
INSERT INTO Tracks (id, name, length, startz) VALUES (402, 'Zagorze', 16615.0, 1972.2744140625);
INSERT INTO Tracks (id, name, length, startz) VALUES (403, 'Kopina', 7840.1796875, 4674.8505859375);
INSERT INTO Tracks (id, name, length, startz) VALUES (404, 'Marynka', 9254.900390625, 1972.655029296875);
INSERT INTO Tracks (id, name, length, startz) VALUES (405, 'Czarny Las', 6622.080078125, 4644.47900390625);
INSERT INTO Tracks (id, name, length, startz) VALUES (406, 'Lejno', 6698.81005859375, -3314.945556640625);
INSERT INTO Tracks (id, name, length, startz) VALUES (407, 'Józefin', 8159.81982421875, 7583.14111328125);
INSERT INTO Tracks (id, name, length, startz) VALUES (408, 'Jagodno', 6655.5400390625, -402.5574951171875);
INSERT INTO Tracks (id, name, length, startz) VALUES (409, 'Zienki', 13180.3798828125, -3314.868408203125);
INSERT INTO Tracks (id, name, length, startz) VALUES (410, 'Jezioro Rotcze', 13295.6796875, 4644.48193359375);
INSERT INTO Tracks (id, name, length, startz) VALUES (411, 'Jezioro Lukie', 6437.80029296875, -396.3538513183594);

-- Ribadelles, Spain:500
INSERT INTO Tracks (id, name, length, startz) VALUES (500, 'Comienzo de Bellriu', 14348.3603515625, 190.2432861328125);
INSERT INTO Tracks (id, name, length, startz) VALUES (501, 'Descenso por carretera', 4562.80029296875, -2326.102783203125);
INSERT INTO Tracks (id, name, length, startz) VALUES (502, 'Vinedos Dardenya Inversa', 6194.7099609375, -2979.6708984375);
INSERT INTO Tracks (id, name, length, startz) VALUES (503, 'Vinedos Dardenya', 6547.39990234375, -2001.9224853515625);
INSERT INTO Tracks (id, name, length, startz) VALUES (504, 'Vinedos dentro del valle Parra', 6815.4501953125, -2404.659423828125);
INSERT INTO Tracks (id, name, length, startz) VALUES (505, 'Camino a Centenera', 10584.6796875, -2001.93310546875);
INSERT INTO Tracks (id, name, length, startz) VALUES (506, 'Ascenso bosque Montverd', 7297.27001953125, 2593.37646484375);
INSERT INTO Tracks (id, name, length, startz) VALUES (507, 'Final de Bellriu', 13164.330078125, -2404.716552734375);
INSERT INTO Tracks (id, name, length, startz) VALUES (508, 'Subida por carretera', 4380.740234375, -3003.61083984375);
INSERT INTO Tracks (id, name, length, startz) VALUES (509, 'Salida desde Montverd', 6143.5703125, 2607.35400390625);
INSERT INTO Tracks (id, name, length, startz) VALUES (510, 'Ascenso por valle el Gualet', 7005.68994140625, 190.19236755371094);
INSERT INTO Tracks (id, name, length, startz) VALUES (511, 'Centenera', 10568.4296875, -2326.286865234375);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

-- Table: Cars
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

CREATE TABLE cars (id INTEGER PRIMARY KEY UNIQUE, name text, maxrpm real, idlerpm real);

-- H1 FWD class
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (100, 'Mini Cooper S', 733.03826904296875, 83.77580261230469);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (101, 'DS Automobiles DS 21', 628.31854248046875, 104.71975708007812);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (102, 'Lancia Fulvia HF', 680.678466796875, 99.48377227783203);

-- H2 FWD class
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (200, 'Volkswagen Golf GTI 16V', 785.398193359375, 94.24777984619141);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (201, 'Peugeot 205 GTI', 733.03826904296875, 125.66371154785156);

-- H2 RWD class
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (300, 'Ford Escort Mk II', 994.8377075195312, 125.66371154785156);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (301, 'Renault Alpine A110 1600 S', 837.758056640625, 167.55160522460938);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (302, 'Fiat 131 Abarth Rally', 837.758056640625, 178.02359008789062);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (303, 'Opel Kadett C GT/E', 942.477783203125, 157.07963562011719);

-- H3 RWD class
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (400, 'BMW E30 Evo Rally', 932.005859375, 115.19173431396484);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (401, 'Opel Ascona 400', 785.398193359375, 136.13568115234375);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (402, 'Lancia Stratos', 890.1179809570312, 104.71975708007812);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (403, 'Renault 5 Turbo', 837.758056640625, 151.84365844726562);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (404, 'Datsun 240Z', 779.7432861328125, 80.42477416992188);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (405, 'Ford Sierra Cosworth RS500', 785.398193359375, 115.19173431396484);

-- Group B RWD
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (500, 'Lancia 037 Evo 2', 890.1179809570312, 125.66371154785156);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (501, 'Opel Manta 400', 816.81414794921875, 146.607666015625);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (502, 'BMW M1 Procar Rally', 968.6577758789062, 157.07963562011719);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (503, 'Porsche 911 SC RS', 837.758056640625, 136.13568115234375);

-- Group B 4WD
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (600, 'Audi Sport quattro S1 E2', 942.477783203125, 136.13568115234375);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (601, 'Peugeot 205 T16 Evo 2', 837.758056640625, 209.43951416015625);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (602, 'Lancia Delta S4', 890.1179809570312, 167.55160522460938);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (603, 'Ford RS200', 942.477783203125, 125.66371154785156);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (604, 'MG Metro 6R4', 994.8377075195312, 109.95574188232422);

-- R2
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (700, 'Ford Fiesta R2', 816.81414794921875, 157.07963562011719);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (701, 'Opel Adam R2', 905.825927734375, 178.02359008789062);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (702, 'Peugeot 208 R2', 890.1179809570312, 167.55160522460938);

-- Group A
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (800, 'Mitsubishi Lancer Evolution VI', 733.03826904296875, 146.607666015625);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (801, 'Subaru Impreza 1995', 733.03826904296875, 115.19173431396484);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (802, 'Lancia Delta HF Integrale', 785.398193359375, 104.71975708007812);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (803, 'Ford Escort RS Cosworth', 733.03826904296875, 146.607666015625);

-- F2 Kit Car
--'Seat Ibiza Kitcar', 942.478, 136.136);
--'Peugeot 306 Maxi', 1151.92, 146.607);

-- NR4/R4
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (900, 'Subaru Impreza WRX STI NR4', 837.758056640625, 178.02359008789062);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (901, 'Mitsubishi Lancer Evolution X', 785.398193359375, 178.02359008789062);

-- 4WD/2000cc
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1000, 'Citroen C4 Rally', 774.92620849609375, 188.49555969238281);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1001, 'Škoda Fabia Rally', 774.92620849609375, 178.02359008789062);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1002, 'Ford Focus RS Rally', 769.69024658203125, 186.92477416992188);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1003, 'Subaru Impreza 2008', 785.398193359375, 219.91148376464844);

-- R5
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1100, 'Ford Fiesta R5', 774.92620849609375, 188.49555969238281);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1101, 'Peugeot 208 T16 R5', 785.398193359375, 178.02359008789062);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1102, 'Mitsubishi Space Star R5', 837.758056640625, 219.91148376464844);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1103, 'Škoda Fabia R5', 774.92620849609375, 178.02359008789062);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1104, 'Volkswagen Polo GTI R5', 774.92620849609375, 178.02359008789062);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1105, 'Citroen C3 R5', 743.51031494140625, 185.87757873535156);

-- Rally GT 
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1200, 'Porsche 911 RGT Rally Spec', 942.477783203125, 188.4955596923828);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1201, 'BMW M2 Competition', 733.03826904296875, 146.607666015625);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1202, 'Chevrolet Camaro GT4.R', 759.21820068359375, 178.02359008789062);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1203, 'Aston Martin V8 Vantage GT4', 733.03826904296875, 104.71975708007812);
INSERT INTO cars (id, name, maxrpm, idlerpm) VALUES (1204, 'Ford Mustang GT4 Ford RS200', 863.9380493164062, 146.607666015625);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

-- Table: Controls
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

CREATE TABLE controls(id INTEGER PRIMARY KEY UNIQUE, handbrake integer, shifting text, manualclutch integer, forwardgears integer);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
