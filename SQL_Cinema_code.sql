-- Cerinta 11:
-- Crearea tabelelor in SQL si inserarea de date in acestea:

-- Secventa --
CREATE SEQUENCE cinema_seq
START WITH     1
INCREMENT BY   1
NOCACHE
NOCYCLE;

-- CINEMA --
CREATE TABLE CINEMA
        ( id_cinema NUMBER(5) CONSTRAINT PKEY_CINEMA PRIMARY KEY,
          nume_cinema VARCHAR(20) CONSTRAINT nume_cinema NOT NULL UNIQUE,
          adresa VARCHAR(50) CONSTRAINT adresa_cinema NOT NULL,
          oras VARCHAR(20) CONSTRAINT oras_cinema NOT NULL
         );

INSERT INTO CINEMA
VALUES (cinema_seq.nextval, 'Retroplex', 'Str. Victoriei nr. 15', 'Bucuresti');
INSERT INTO CINEMA
VALUES (cinema_seq.nextval, 'Starlight', 'Bd. Unirii nr. 20', 'Bucuresti');
INSERT INTO CINEMA
VALUES (cinema_seq.nextval, 'Pixelplex', 'Str. Palat nr. 5', 'Iasi');
INSERT INTO CINEMA
VALUES (cinema_seq.nextval, 'Cinematica', 'Str. Republicii nr. 10', 'Brasov');
INSERT INTO CINEMA
VALUES (cinema_seq.nextval, 'Flashback', 'Piata Unirii nr. 2', 'Cluj-Napoca');

SELECT *
FROM CINEMA;

-- SALA --
CREATE TABLE SALA
        ( id_sala NUMBER(5) CONSTRAINT PKEY_SALA PRIMARY KEY,
          id_cinema NUMBER(5), CONSTRAINT fk_sala FOREIGN KEY(id_cinema) REFERENCES CINEMA(id_cinema),
          nume VARCHAR(50) CONSTRAINT numar_sala NOT NULL,
          capacitate NUMBER(10) CONSTRAINT capacitate_sala NOT NULL
         );
         
INSERT INTO SALA
VALUES (cinema_seq.nextval, (SELECT id_cinema FROM CINEMA WHERE nume_cinema = 'Retroplex'), 'Ultra', 40);
INSERT INTO SALA
VALUES (cinema_seq.nextval, (SELECT id_cinema FROM CINEMA WHERE nume_cinema = 'Retroplex'), 'Galaxy', 30);
INSERT INTO SALA
VALUES (cinema_seq.nextval, (SELECT id_cinema FROM CINEMA WHERE nume_cinema = 'Starlight'), 'Epika', 25);
INSERT INTO SALA
VALUES (cinema_seq.nextval, (SELECT id_cinema FROM CINEMA WHERE nume_cinema = 'Starlight'), 'Infinity', 50);
INSERT INTO SALA
VALUES (cinema_seq.nextval, (SELECT id_cinema FROM CINEMA WHERE nume_cinema = 'Pixelplex'), 'Astral', 25);
INSERT INTO SALA
VALUES (cinema_seq.nextval, (SELECT id_cinema FROM CINEMA WHERE nume_cinema = 'Cinematica'), 'Orion', 15);
INSERT INTO SALA
VALUES (cinema_seq.nextval, (SELECT id_cinema FROM CINEMA WHERE nume_cinema = 'Flashback'), 'Mega', 30);

SELECT *
FROM SALA;

-- FILM --
CREATE TABLE FILM
        ( id_film NUMBER(5) CONSTRAINT PKEY_FILM PRIMARY KEY,
          titlu_film VARCHAR(50) CONSTRAINT titlu_film NOT NULL,
          durata NUMBER(10) CONSTRAINT durata_film NOT NULL,
          gen VARCHAR(20) CONSTRAINT gen_film NOT NULL,
          descriere VARCHAR(100) CONSTRAINT descriere_film NULL
         );

INSERT INTO FILM
VALUES (cinema_seq.nextval, 'Dirty Dancing', 100, 'Romance', 'The movie showcases a forbidden romance, set against the backdrop of a dance competition.');
INSERT INTO FILM
VALUES (cinema_seq.nextval, 'Back to the Future', 116, 'Sci-Fi', '');
INSERT INTO FILM
VALUES (cinema_seq.nextval, 'GhostBusters', 107, 'Comedy', 'The movie features a group of friends who start a ghost-catching business in New York City.');
INSERT INTO FILM
VALUES (cinema_seq.nextval, 'The Breakfast Club', 92, 'Drama', '');
INSERT INTO FILM
VALUES (cinema_seq.nextval, 'Dead Poets Society', 128, 'Drama', 'The movie explores themes of conformity, self-discovery, and the power of literature.');
INSERT INTO FILM
VALUES (cinema_seq.nextval, 'The Terminator', 108, 'Action', '');
INSERT INTO FILM
VALUES (cinema_seq.nextval, 'The Shining', 142, 'Horror', '');

SELECT *
FROM FILM;

-- ANGAJAT --
CREATE TABLE ANGAJAT
        ( id_angajat NUMBER(5) CONSTRAINT PKEY_ANGAJAT PRIMARY KEY,
          nume_angajat VARCHAR(20) CONSTRAINT nume_angajat NOT NULL,
          prenume_angajat VARCHAR(20) CONSTRAINT prenume_angajat NOT NULL,
          functie VARCHAR(20) CONSTRAINT functie_angajat NOT NULL,
          salariu NUMBER(10) CONSTRAINT salariu_angajat NOT NULL
         );
         
INSERT INTO ANGAJAT
VALUES (cinema_seq.nextval, 'Ionescu', 'Mihai', 'casier', 3000);
INSERT INTO ANGAJAT
VALUES (cinema_seq.nextval, 'Vasile', 'Iustina', 'casier', 3000);
INSERT INTO ANGAJAT
VALUES (cinema_seq.nextval, 'Popescu', 'Dragos', 'casier', 3000);
INSERT INTO ANGAJAT
VALUES (cinema_seq.nextval, 'Dascalu', 'Andrei', 'tehnician', 4000);
INSERT INTO ANGAJAT
VALUES (cinema_seq.nextval, 'Olteanu', 'Maria', 'curatenie', 1500);

SELECT *
FROM ANGAJAT;

-- CLIENT --
CREATE TABLE CLIENT
        ( id_client NUMBER(5) CONSTRAINT PKEY_CLIENT PRIMARY KEY,
          nume_client VARCHAR(20) CONSTRAINT nume_client NOT NULL,
          prenume_client VARCHAR(20) CONSTRAINT prenume_client NOT NULL,
          telefon VARCHAR(10) CONSTRAINT telefon_client UNIQUE NOT NULL,
          email VARCHAR(30) CONSTRAINT email_client UNIQUE NOT NULL 
         );
         
INSERT INTO CLIENT
VALUES (cinema_seq.nextval, 'Stan', 'Bianca', '0719472600', 'bianastan123@gmail.com');
INSERT INTO CLIENT
VALUES (cinema_seq.nextval, 'Dumitrescu', 'Eric', '0709012574', 'dumitrescueric@yahoo.com');
INSERT INTO CLIENT
VALUES (cinema_seq.nextval, 'Dobre', 'Stefan', '0799006584', 'stefan27@gmail.com');
INSERT INTO CLIENT
VALUES (cinema_seq.nextval, 'Paun', 'Raluca', '0771063900', 'ralucapaun@gmail.com');
INSERT INTO CLIENT
VALUES (cinema_seq.nextval, 'Munteanu', 'Laura', '0761352678', 'lalamunteanu@gmail.com');
INSERT INTO CLIENT
VALUES (cinema_seq.nextval, 'Popescu', 'Andrei', '0721123456', 'andrei.popescu@gmail.com');
INSERT INTO CLIENT
VALUES (cinema_seq.nextval, 'Ionescu', 'Maria', '0731987654', 'maria.ionescu@gmail.com');
INSERT INTO CLIENT
VALUES (cinema_seq.nextval, 'Stoica', 'Larisa', '0761890123', 'sstoica@gmail.com');
INSERT INTO CLIENT
VALUES (cinema_seq.nextval, 'Ciurnea', 'Ioan', '0761352875', 'ioan1234@yahoo.com');
INSERT INTO CLIENT
VALUES (cinema_seq.nextval, 'Pestritu', 'Monica', '0761000678', 'monicapestritu@gmail.com');
INSERT INTO CLIENT
VALUES (cinema_seq.nextval, 'Calinescu', 'Florin', '0763000779', 'fflorinn@yahoo.com');

SELECT *
FROM CLIENT;

-- PRODUS --
CREATE TABLE PRODUS
        ( id_produs NUMBER(5) CONSTRAINT PKEY_PRODUS PRIMARY KEY,
          nume_produs VARCHAR(30) CONSTRAINT nume_produs NOT NULL,
          pret NUMBER(10) CONSTRAINT pret_produs NOT NULL,
          stoc NUMBER(10) CONSTRAINT stoc_produs NOT NULL
         );
         
INSERT INTO PRODUS
VALUES (cinema_seq.nextval, 'popcorn', 20, 100);
INSERT INTO PRODUS
VALUES (cinema_seq.nextval, 'nachos', 25, 100);
INSERT INTO PRODUS
VALUES (cinema_seq.nextval, 'suc', 10, 150);
INSERT INTO PRODUS
VALUES (cinema_seq.nextval, 'apa', 5, 150);
INSERT INTO PRODUS
VALUES (cinema_seq.nextval, 'alune', 15, 100);

SELECT *
FROM PRODUS;

-- COMANDA --
CREATE TABLE COMANDA
        ( id_comanda NUMBER(5) CONSTRAINT PKEY_COMANDA PRIMARY KEY,
          id_client NUMBER(5), CONSTRAINT fk_comanda_client FOREIGN KEY(id_client) REFERENCES CLIENT(id_client),
          id_angajat NUMBER(5), CONSTRAINT fk_comanda_angajat FOREIGN KEY(id_angajat) REFERENCES ANGAJAT(id_angajat),
          total NUMBER(10) DEFAULT 0 CONSTRAINT total_comanda NOT NULL,
          metoda_plata VARCHAR(10) DEFAULT 'cash' CONSTRAINT metoda_plata_comanda CHECK(metoda_plata IN ('cash', 'card')) NOT NULL,
          data DATE CONSTRAINT data_comanda NOT NULL
         );
         
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, metoda_plata, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0719472600'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Popescu'), 'card', TO_DATE('12-04-2023', 'DD-MM-YYYY'));
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0709012574'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Vasile'), TO_DATE('15-04-2023', 'DD-MM-YYYY'));
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, metoda_plata, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0799006584'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Ionescu'), 'card', TO_DATE('23-04-2023', 'DD-MM-YYYY'));
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0771063900'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Vasile'), TO_DATE('10-05-2023', 'DD-MM-YYYY'));
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, metoda_plata, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0761352678'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Popescu'), 'card', TO_DATE('24-05-2023', 'DD-MM-YYYY'));
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, metoda_plata, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0721123456'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Ionescu'), 'card', TO_DATE('25-05-2023', 'DD-MM-YYYY'));
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0731987654'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Popescu'), TO_DATE('25-05-2023', 'DD-MM-YYYY'));
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0761890123'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Vasile'), TO_DATE('26-05-2023', 'DD-MM-YYYY'));
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, metoda_plata, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0761352875'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Ionescu'), 'card', TO_DATE('29-05-2023', 'DD-MM-YYYY'));
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, metoda_plata, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0761000678'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Vasile'), 'card', TO_DATE('01-06-2023', 'DD-MM-YYYY'));


SELECT *
FROM COMANDA;

-- PROIECTIE --
CREATE TABLE PROIECTIE
        ( id_proiectie NUMBER(5) CONSTRAINT PKEY_PROIECTIE PRIMARY KEY,
          id_film NUMBER(5), CONSTRAINT fk_proiectie_film FOREIGN KEY(id_film) REFERENCES FILM(id_film),
          id_sala NUMBER(5), CONSTRAINT fk_proiectie_sala FOREIGN KEY(id_sala) REFERENCES SALA(id_sala),
          ora VARCHAR(10) CONSTRAINT ora_proiectie NOT NULL
         );
         
INSERT INTO PROIECTIE
VALUES (cinema_seq.nextval, (SELECT id_film FROM FILM WHERE titlu_film = 'Dirty Dancing'), (SELECT id_sala FROM SALA WHERE nume = 'Ultra'), '10:00');
INSERT INTO PROIECTIE
VALUES (cinema_seq.nextval, (SELECT id_film FROM FILM WHERE titlu_film = 'Dead Poets Society'), (SELECT id_sala FROM SALA WHERE nume = 'Galaxy'), '15:00');
INSERT INTO PROIECTIE
VALUES (cinema_seq.nextval, (SELECT id_film FROM FILM WHERE titlu_film = 'The Breakfast Club'), (SELECT id_sala FROM SALA WHERE nume = 'Infinity'), '20:30');
INSERT INTO PROIECTIE
VALUES (cinema_seq.nextval, (SELECT id_film FROM FILM WHERE titlu_film = 'The Terminator'), (SELECT id_sala FROM SALA WHERE nume = 'Mega'), '17:30');
INSERT INTO PROIECTIE
VALUES (cinema_seq.nextval, (SELECT id_film FROM FILM WHERE titlu_film = 'Dead Poets Society'), (SELECT id_sala FROM SALA WHERE nume = 'Astral'), '18:00');
INSERT INTO PROIECTIE
VALUES (cinema_seq.nextval, (SELECT id_film FROM FILM WHERE titlu_film = 'GhostBusters'), (SELECT id_sala FROM SALA WHERE nume = 'Orion'), '18:00');
INSERT INTO PROIECTIE
VALUES (cinema_seq.nextval, (SELECT id_film FROM FILM WHERE titlu_film = 'Back to the Future'), (SELECT id_sala FROM SALA WHERE nume = 'Epika'), '12:30');
INSERT INTO PROIECTIE
VALUES (cinema_seq.nextval, (SELECT id_film FROM FILM WHERE titlu_film = 'The Shining'), (SELECT id_sala FROM SALA WHERE nume = 'Infinity'), '21:00');
INSERT INTO PROIECTIE
VALUES (cinema_seq.nextval, (SELECT id_film FROM FILM WHERE titlu_film = 'GhostBusters'), (SELECT id_sala FROM SALA WHERE nume = 'Ultra'), '12:00');
INSERT INTO PROIECTIE
VALUES (cinema_seq.nextval, (SELECT id_film FROM FILM WHERE titlu_film = 'Dirty Dancing'), (SELECT id_sala FROM SALA WHERE nume = 'Galaxy'), '11:30');

SELECT *
FROM PROIECTIE;

-- BILET --
CREATE TABLE BILET
        ( id_bilet NUMBER(5) CONSTRAINT PKEY_BILET PRIMARY KEY,
          id_proiectie NUMBER(5), CONSTRAINT fk_bilet_proiectie FOREIGN KEY(id_proiectie) REFERENCES PROIECTIE(id_proiectie),
          id_comanda NUMBER(5), CONSTRAINT fk_bilet_comanda FOREIGN KEY(id_comanda) REFERENCES COMANDA(id_comanda),
          rand VARCHAR(2) CONSTRAINT rand_bilet NOT NULL,
          loc NUMBER(10) CONSTRAINT loc_bilet NOT NULL
         );

INSERT INTO BILET
VALUES (cinema_seq.nextval, 55, 45, 'E', 5);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 55, 45, 'E', 6);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 57, 46, 'C', 10);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 57, 46, 'C', 11);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 64, 47, 'D', 4);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 64, 47, 'E', 1);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 56, 48, 'C', 5);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 58, 49, 'A', 2);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 60, 50, 'C', 5);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 61, 51, 'A', 3);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 62, 52, 'B', 4);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 63, 53, 'A', 5);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 58, 54, 'D', 3);

SELECT *
FROM BILET;

-- DETALIU COMANDA --
CREATE TABLE DETALIU_COMANDA
        ( id_detaliu_comanda NUMBER(5) CONSTRAINT PKEY_DETALIU_COMANDA PRIMARY KEY,
          id_produs NUMBER(5), CONSTRAINT fk_detaliu_comanda_produs FOREIGN KEY(id_produs) REFERENCES PRODUS(id_produs),
          id_comanda NUMBER(5), CONSTRAINT fk_detaliu_comanda_comanda FOREIGN KEY(id_comanda) REFERENCES COMANDA(id_comanda),
          cantitate NUMBER(10) CONSTRAINT cantitate_comanda NOT NULL
         );
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'popcorn'), 45, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'suc'), 45, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'apa'), 46, 3);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'alune'), 47, 1);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'nachos'), 47, 1);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'alune'), 48, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'popcorn'), 49, 4);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'alune'), 50, 1);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'nachos'), 51, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'suc'), 52, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'nachos'), 52, 1);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'popcorn'), 53, 1);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'apa'), 54, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'popcorn'), 54, 1);    
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'nachos'), 54, 1);       


SELECT *
FROM DETALIU_COMANDA;


-- Cerinta 12:
-- Ex 1:
-- Afiseaza titlul, genul, durata și descrierea (în cazul în care există o descriere disponibilă) filmelor si o coloană suplimentară numită "Comparatie" care să indice dacă durata fiecărui film este mai lungă, mai scurtă sau egală cu durata medie a filmelor din același gen.
-- Filmele sunt ordonate in functie de durata, in mod descrescator.

SELECT f.titlu_film AS "Titlu film",
    f.gen AS "Gen",
    f.durata AS "Durata",
    NVL(f.descriere, 'Filmul nu are o descriere.') AS "Descriere",
    lungime_medie.durata_medie,
    DECODE(SIGN(f.durata - lungime_medie.durata_medie), 
        1, 'Mai lung',
        0, 'Egal',
        -1, 'Mai scurt') AS "Comparatie"
FROM FILM f
JOIN (
    SELECT gen, AVG(durata) AS durata_medie
    FROM FILM
    GROUP BY gen
) lungime_medie ON f.gen = lungime_medie.gen
ORDER BY f.durata DESC;

-- Ex 2:
-- Afiseaza numele cinematografelor si numarul de proiectii ale filmelor in functie de ora (program matinal, program de zi si program de seara).

SELECT c.nume_cinema AS "Nume cinema",
       SUM (CASE WHEN p.ora < '12:00' THEN 1 ELSE 0 END ) AS "Program matinal",
       SUM (CASE WHEN p.ora >= '12:00' AND p.ora < '18:00' THEN 1 ELSE 0 END ) AS "Program de zi",
       SUM (CASE WHEN p.ora >= '18:00' THEN 1 ELSE 0 END ) AS "Program de zi"
FROM CINEMA c
JOIN SALA s ON s.id_cinema = c.id_cinema
JOIN PROIECTIE p ON p.id_sala = s.id_sala
GROUP BY c.nume_cinema;

-- Ex 3:
-- Afiseaza angajatii care au functia de casier, lucreaza la un cinema din Bucuresti si numarul de comenzi de care s-au ocupat in anul 2023.

SELECT a.nume_angajat AS "Nume", a.prenume_angajat AS "Prenume", 
(
    SELECT COUNT(*)
    FROM COMANDA cmd
    JOIN BILET b ON b.id_comanda = cmd.id_comanda
    JOIN PROIECTIE p ON b.id_proiectie = p.id_proiectie
    JOIN SALA s ON s.id_sala = p.id_sala
    JOIN CINEMA c ON c.id_cinema = s.id_cinema
    WHERE INITCAP(c.oras) = 'Bucuresti' AND TO_CHAR(cmd.data, 'YYYY') = 2023
        AND cmd.id_angajat = a.id_angajat
) AS Numarcomenzi
FROM ANGAJAT a
WHERE LOWER(a.functie) = 'casier'
ORDER BY NumarComenzi DESC;

-- Ex 4:
-- Afiseaza codul și numele angajaților care au procesat cel puțin o comandă cu mai mult de un produs.

SELECT id_angajat AS "Cod angajat", CONCAT(UPPER(nume_angajat), CONCAT(' ', prenume_angajat)) AS "Nume angajat"
FROM ANGAJAT 
WHERE id_angajat IN (
    SELECT DISTINCT c.id_angajat
    FROM COMANDA c
    JOIN DETALIU_COMANDA dc ON dc.id_comanda = c.id_comanda
    GROUP BY c.id_comanda, c.id_angajat
    HAVING COUNT(dc.id_produs) > 1 );

-- Ex 5:
-- Pentru fiecare produs care are pretul maxim sa se afiseze toate comenzile in care apare.

WITH PretMaxim AS (
    SELECT MAX(pret) AS pret_maxim
    FROM PRODUS
), ComenziCuPretMaxim AS (
    SELECT c.id_comanda, c.id_client, c.id_angajat, c.total, c.metoda_plata, c.data
    FROM COMANDA c
    JOIN DETALIU_COMANDA dc ON c.id_comanda = dc.id_comanda
    JOIN PRODUS p ON dc.id_produs = p.id_produs
    WHERE p.pret = (
        SELECT pret_maxim 
        FROM PretMaxim
    )
)
SELECT *
FROM ComenziCuPretMaxim;


-- CERINTA 13:
-- Ex 1 - UPDATE - Adauga pretului total pentru comenzi.

UPDATE COMANDA c
SET c.total = (
    SELECT SUM(p.pret * dc.cantitate) as total
    FROM DETALIU_COMANDA dc
    JOIN PRODUS p ON dc.id_produs = p.id_produs
    WHERE dc.id_comanda = c.id_comanda
);

-- Ex 2 - UPDATE - Creste salariul cu 100 pentru angajatii care au vandut mai mult de doua tipuri de produse diferite.

UPDATE ANGAJAT a
SET a.salariu = a.salariu + 100
WHERE a.id_angajat IN (
    SELECT DISTINCT c.id_angajat
    FROM COMANDA c
    JOIN DETALIU_COMANDA dc ON c.id_comanda = dc.id_comanda
    GROUP BY c.id_angajat, c.id_comanda
    HAVING COUNT(*) > 2 );

-- Ex 3 - DELETE - Sterge clientul care nu a plasat comenzi.

DELETE CLIENT c
WHERE NOT EXISTS ( 
    SELECT *
    FROM COMANDA cmd
    WHERE cmd.id_client = c.id_client );
