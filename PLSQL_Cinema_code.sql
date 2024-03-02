-- Exercitiile 4 si 5:

-- Secventa pentru Tabela CINEMA
CREATE SEQUENCE cinema_seq	
START WITH     1
INCREMENT BY   1
NOCACHE
NOCYCLE;

-- Tabela CINEMA
CREATE TABLE CINEMA
        ( id_cinema NUMBER(5) CONSTRAINT PKEY_CINEMA PRIMARY KEY,
          nume_cinema VARCHAR(20) CONSTRAINT nume_cinema NOT NULL UNIQUE,
          adresa VARCHAR(50) CONSTRAINT adresa_cinema NOT NULL,
          oras VARCHAR(20) CONSTRAINT oras_cinema NOT NULL
         );

-- Tabela SALA
CREATE TABLE SALA
        ( id_sala NUMBER(5) CONSTRAINT PKEY_SALA PRIMARY KEY,
          id_cinema NUMBER(5), CONSTRAINT fk_sala FOREIGN KEY(id_cinema) REFERENCES CINEMA(id_cinema),
          nume VARCHAR(50) CONSTRAINT numar_sala NOT NULL,
          capacitate NUMBER(10) CONSTRAINT capacitate_sala NOT NULL
         );

-- Tabela FILM
CREATE TABLE FILM
        ( id_film NUMBER(5) CONSTRAINT PKEY_FILM PRIMARY KEY,
          titlu_film VARCHAR(50) CONSTRAINT titlu_film NOT NULL,
          durata NUMBER(10) CONSTRAINT durata_film NOT NULL,
          gen VARCHAR(20) CONSTRAINT gen_film NOT NULL,
          descriere VARCHAR(100) CONSTRAINT descriere_film NULL
         );
         
-- Tabela PROIECTIE
CREATE TABLE PROIECTIE
        ( id_proiectie NUMBER(5) CONSTRAINT PKEY_PROIECTIE PRIMARY KEY,
          id_film NUMBER(5), CONSTRAINT fk_proiectie_film FOREIGN KEY(id_film) REFERENCES FILM(id_film),
          id_sala NUMBER(5), CONSTRAINT fk_proiectie_sala FOREIGN KEY(id_sala) REFERENCES SALA(id_sala),
          ora VARCHAR(10) CONSTRAINT ora_proiectie NOT NULL
         );
         
-- TABELA PRODUS
CREATE TABLE PRODUS
        ( id_produs NUMBER(5) CONSTRAINT PKEY_PRODUS PRIMARY KEY,
          nume_produs VARCHAR(30) CONSTRAINT nume_produs NOT NULL,
          pret NUMBER(10) CONSTRAINT pret_produs NOT NULL,
          stoc NUMBER(10) CONSTRAINT stoc_produs NOT NULL
         );

-- Tabela CLIENT
CREATE TABLE CLIENT
        ( id_client NUMBER(5) CONSTRAINT PKEY_CLIENT PRIMARY KEY,
          nume_client VARCHAR(20) CONSTRAINT nume_client NOT NULL,
          prenume_client VARCHAR(20) CONSTRAINT prenume_client NOT NULL,
          telefon VARCHAR(10) CONSTRAINT telefon_client UNIQUE NOT NULL,
          email VARCHAR(30) CONSTRAINT email_client UNIQUE NOT NULL 
         );
         
-- Tabela ANGAJAT
CREATE TABLE ANGAJAT
        ( id_angajat NUMBER(5) CONSTRAINT PKEY_ANGAJAT PRIMARY KEY,
          nume_angajat VARCHAR(20) CONSTRAINT nume_angajat NOT NULL,
          prenume_angajat VARCHAR(20) CONSTRAINT prenume_angajat NOT NULL,
          functie VARCHAR(20) CONSTRAINT functie_angajat NOT NULL,
          salariu NUMBER(10) CONSTRAINT salariu_angajat NOT NULL
         );

-- Tabela COMANDA
CREATE TABLE COMANDA
        ( id_comanda NUMBER(5) CONSTRAINT PKEY_COMANDA PRIMARY KEY,
          id_client NUMBER(5), CONSTRAINT fk_comanda_client FOREIGN KEY(id_client) REFERENCES CLIENT(id_client),
          id_angajat NUMBER(5), CONSTRAINT fk_comanda_angajat FOREIGN KEY(id_angajat) REFERENCES ANGAJAT(id_angajat),
          total NUMBER(10) DEFAULT 0 CONSTRAINT total_comanda NOT NULL,
          metoda_plata VARCHAR(10) DEFAULT 'cash' CONSTRAINT metoda_plata_comanda CHECK(metoda_plata IN ('cash', 'card')) NOT NULL,
          data DATE CONSTRAINT data_comanda NOT NULL
         );

-- Tabela BILET
CREATE TABLE BILET
        ( id_bilet NUMBER(5) CONSTRAINT PKEY_BILET PRIMARY KEY,
          id_proiectie NUMBER(5), CONSTRAINT fk_bilet_proiectie FOREIGN KEY(id_proiectie) REFERENCES PROIECTIE(id_proiectie),
          id_comanda NUMBER(5), CONSTRAINT fk_bilet_comanda FOREIGN KEY(id_comanda) REFERENCES COMANDA(id_comanda),
          rand VARCHAR(2) CONSTRAINT rand_bilet NOT NULL,
          loc NUMBER(10) CONSTRAINT loc_bilet NOT NULL
         );

-- Tabela DETALIU_COMANDA
CREATE TABLE DETALIU_COMANDA
        ( id_detaliu_comanda NUMBER(5) CONSTRAINT PKEY_DETALIU_COMANDA PRIMARY KEY,
          id_produs NUMBER(5), CONSTRAINT fk_detaliu_comanda_produs FOREIGN KEY(id_produs) REFERENCES PRODUS(id_produs),
          id_comanda NUMBER(5), CONSTRAINT fk_detaliu_comanda_comanda FOREIGN KEY(id_comanda) REFERENCES COMANDA(id_comanda),
          cantitate NUMBER(10) CONSTRAINT cantitate_comanda NOT NULL
         );
         
-- Tabela ACTOR
CREATE TABLE ACTOR
        ( id_actor NUMBER(5) CONSTRAINT PKEY_ACTOR PRIMARY KEY,
          nume_actor VARCHAR(20) CONSTRAINT nume_actor NOT NULL,
          prenume_actor VARCHAR(20) CONSTRAINT prenume_actor NOT NULL,
          nationalitate VARCHAR(20) CONSTRAINT nationalitate NOT NULL
        );
        
-- Tabela FILM_ACTOR
CREATE TABLE FILM_ACTOR
        ( id_film_actor NUMBER(5) CONSTRAINT PKEY_FILM_ACTOR PRIMARY KEY,
          id_actor NUMBER(5), CONSTRAINT fk_film_actor_actor FOREIGN KEY(id_actor) REFERENCES ACTOR(id_actor),
          id_film NUMBER(5), CONSTRAINT fk_film_actor_film FOREIGN KEY(id_film) REFERENCES FILM(id_film)
         );
          
-- INSERT
-- Tabela CINEMA
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

-- Tabela SALA
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

-- Tabela FILM
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

-- Tabela PROIECTIE
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

-- Tabela PRODUS
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

-- Tabela CLIENT
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

-- Tabela ANGAJAT
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
INSERT INTO ANGAJAT
VALUES (cinema_seq.nextval, 'Dogareci', 'Alexandra', 'curatenie', 1500);

-- Tabela COMANDA
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

-- Tabela BILET
INSERT INTO BILET
VALUES (cinema_seq.nextval, 20, 51, 'E', 5);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 20, 51, 'E', 6);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 21, 52, 'C', 10);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 21, 52, 'C', 11);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 22, 53, 'D', 4);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 22, 53, 'E', 1);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 23, 54, 'C', 5);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 24, 55, 'A', 2);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 25, 56, 'C', 5);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 26, 57, 'A', 3);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 27, 58, 'B', 4);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 28, 59, 'A', 5);
INSERT INTO BILET
VALUES (cinema_seq.nextval, 29, 60, 'D', 3);

-- Tabela DETALIU_COMANDA
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'popcorn'), 51, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'suc'), 53, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'apa'), 53, 3);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'alune'), 54, 1);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'nachos'), 54, 1);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'alune'), 54, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'popcorn'), 55, 4);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'alune'), 56, 1);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'nachos'), 57, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'suc'), 58, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'nachos'), 58, 1);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'popcorn'), 59, 1);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'apa'), 60, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'popcorn'), 60, 1);

-- Tabela ACTOR
INSERT INTO ACTOR
VALUES (cinema_seq.nextval, 'Murray', 'Bill', 'american');
INSERT INTO ACTOR
VALUES (cinema_seq.nextval, 'Swayze', 'Patrick', 'american');
INSERT INTO ACTOR
VALUES (cinema_seq.nextval, 'Williams', 'Robin', 'american');
INSERT INTO ACTOR
VALUES (cinema_seq.nextval, 'Schwarzenegger', 'Arnold', 'austrian');
INSERT INTO ACTOR
VALUES (cinema_seq.nextval, 'Duvall', 'Shelley', 'american');
INSERT INTO ACTOR
VALUES (cinema_seq.nextval, 'Hawke', 'Ethan', 'american');
INSERT INTO ACTOR
VALUES (cinema_seq.nextval, 'Grey', 'Jennifer', 'american');
INSERT INTO ACTOR
VALUES (cinema_seq.nextval, 'Nicholson', 'Jack', 'american');
INSERT INTO ACTOR
VALUES (cinema_seq.nextval, 'Hamilton', 'Linda', 'american');

-- Tabela FILM_ACTOR
INSERT INTO FILM_ACTOR
VALUES (cinema_seq.nextval, (SELECT id_actor FROM ACTOR WHERE nume_actor = 'Swayze'), (SELECT id_film FROM FILM WHERE titlu_film = 'Dirty Dancing') );
INSERT INTO FILM_ACTOR
VALUES (cinema_seq.nextval, (SELECT id_actor FROM ACTOR WHERE nume_actor = 'Grey'), (SELECT id_film FROM FILM WHERE titlu_film = 'Dirty Dancing') );
INSERT INTO FILM_ACTOR
VALUES (cinema_seq.nextval, (SELECT id_actor FROM ACTOR WHERE nume_actor = 'Schwarzenegger'), (SELECT id_film FROM FILM WHERE titlu_film = 'The Terminator') );
INSERT INTO FILM_ACTOR
VALUES (cinema_seq.nextval, (SELECT id_actor FROM ACTOR WHERE nume_actor = 'Hamilton'), (SELECT id_film FROM FILM WHERE titlu_film = 'The Terminator') );
INSERT INTO FILM_ACTOR
VALUES (cinema_seq.nextval, (SELECT id_actor FROM ACTOR WHERE nume_actor = 'Nicholson'), (SELECT id_film FROM FILM WHERE titlu_film = 'The Shining') );
INSERT INTO FILM_ACTOR
VALUES (cinema_seq.nextval, (SELECT id_actor FROM ACTOR WHERE nume_actor = 'Duvall'), (SELECT id_film FROM FILM WHERE titlu_film = 'The Shining') );
INSERT INTO FILM_ACTOR
VALUES (cinema_seq.nextval, (SELECT id_actor FROM ACTOR WHERE nume_actor = 'Murray'), (SELECT id_film FROM FILM WHERE titlu_film = 'GhostBusters') );
INSERT INTO FILM_ACTOR
VALUES (cinema_seq.nextval, (SELECT id_actor FROM ACTOR WHERE nume_actor = 'Williams'), (SELECT id_film FROM FILM WHERE titlu_film = 'Dead Poets Society') );
INSERT INTO FILM_ACTOR
VALUES (cinema_seq.nextval, (SELECT id_actor FROM ACTOR WHERE nume_actor = 'Hawke'), (SELECT id_film FROM FILM WHERE titlu_film = 'Dead Poets Society') );
INSERT INTO FILM_ACTOR
VALUES (cinema_seq.nextval, (SELECT id_actor FROM ACTOR WHERE nume_actor = 'Hawke'), (SELECT id_film FROM FILM WHERE titlu_film = 'The Breakfast Club') );
INSERT INTO FILM_ACTOR
VALUES (cinema_seq.nextval, (SELECT id_actor FROM ACTOR WHERE nume_actor = 'Murray'), (SELECT id_film FROM FILM WHERE titlu_film = 'Back to the Future') );

-- Pentru tabela COMANDA, calcularea pretului total al comenzilor.
UPDATE COMANDA c
SET c.total = (
    SELECT NVL(SUM(p.pret * dc.cantitate), 0) as total
    FROM DETALIU_COMANDA dc
    JOIN PRODUS p ON dc.id_produs = p.id_produs
    WHERE dc.id_comanda = c.id_comanda
);




-- Exercitiul 6.
-- Formulati în limbaj natural o problema pe care sa o rezolvati folosind un subprogram stocat independent care sa utilizeze toate cele 3 tipuri de colectii studiate.
-- vector VARRAYS, tablou imbricat, tablou indexat INDEX-BY TABLES.
-- Enunt:
-- Definiti un subprogram stocat independent care primeste numele si prenumele unui client si dupa ce verfica existenta acestuia, calculeaza suma totala pe care a cheltuit-o la cinema si determina metoda de plata preferata.
-- tablou indexat (VARCHAR2) - memoreaza numele clientilor
-- tablou imbricat de tip NUMBER - in care memorez pretul comenzilor care sunt ale accelui client (in functie de id-ul clientului gasit)
-- vector de tip VARCHAR2 in care memorez metoda de plata

CREATE OR REPLACE PROCEDURE Gestionare_Client(
    var_nume_trimis IN VARCHAR2,
    var_prenume_trimis IN VARCHAR2
) IS
    TYPE tablou_indexat IS TABLE OF VARCHAR2(200) INDEX BY PLS_INTEGER;
    TYPE tablou_imbricat IS TABLE OF NUMBER;
    TYPE vector IS VARRAY(50) OF VARCHAR2(200);

    tablou_clienti_existenti tablou_indexat;
    tablou_preturi_comenzi tablou_imbricat := tablou_imbricat();
    vector_metode_plata vector := vector();
    
    var_exista_client BOOLEAN;
    var_suma_totala NUMBER := 0;
    var_metoda_plata_preferata VARCHAR2(10);
    
    v_index PLS_INTEGER := 1;
    v_prenume_db VARCHAR2(50);
    v_id_client CLIENT.id_client%TYPE;

    v_nr_plati_card NUMBER := 0;
    v_nr_plati_cash NUMBER := 0;

BEGIN
    SELECT nume_client
    BULK COLLECT INTO tablou_clienti_existenti
    FROM CLIENT;

    var_exista_client := FALSE;

    FOR i IN tablou_clienti_existenti.FIRST..tablou_clienti_existenti.LAST LOOP
        IF tablou_clienti_existenti(i) = var_nume_trimis THEN
            var_exista_client := TRUE;

            SELECT prenume_client INTO v_prenume_db
            FROM CLIENT
            WHERE nume_client = var_nume_trimis;

            IF v_prenume_db <> var_prenume_trimis THEN
                var_exista_client := FALSE;
            END IF;
        END IF;
    END LOOP;

    IF var_exista_client = FALSE THEN
        DBMS_OUTPUT.PUT_LINE('Clientul nu exista.');
    ELSE
        SELECT id_client INTO v_id_client
        FROM CLIENT
        WHERE nume_client = var_nume_trimis AND prenume_client = var_prenume_trimis;

        SELECT total
        BULK COLLECT INTO tablou_preturi_comenzi
        FROM COMANDA
        WHERE id_client = v_id_client;
        
        FOR i IN tablou_preturi_comenzi.FIRST..tablou_preturi_comenzi.LAST LOOP
            var_suma_totala := var_suma_totala + tablou_preturi_comenzi(i);
        END LOOP;
        
        SELECT metoda_plata
        BULK COLLECT INTO vector_metode_plata
        FROM COMANDA
        WHERE id_client = v_id_client;
        
        FOR i IN vector_metode_plata.FIRST..vector_metode_plata.LAST LOOP
            IF vector_metode_plata(i) = 'card' THEN
                v_nr_plati_card := v_nr_plati_card + 1;
            END IF;
            IF vector_metode_plata(i) = 'cash' THEN
                v_nr_plati_cash := v_nr_plati_cash + 1;
            END IF;
        END LOOP;

        IF v_nr_plati_card > v_nr_plati_cash THEN
            var_metoda_plata_preferata := 'Card';
        END IF;
        
        IF v_nr_plati_cash > v_nr_plati_card THEN
            var_metoda_plata_preferata := 'Cash';
        END IF;
        
        IF v_nr_plati_cash = v_nr_plati_card THEN
            var_metoda_plata_preferata := 'Card/Cash';
        END IF;

        DBMS_OUTPUT.PUT_LINE('Suma totala a comenzilor: ' || var_suma_totala);
        DBMS_OUTPUT.PUT_LINE('Metoda de plata preferata: ' || var_metoda_plata_preferata);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'A aparut o eroare!');
        
END Gestionare_Client;
/

-- Apelarea procedurii:
-- cazul in care clientul exista:
EXECUTE Gestionare_Client('Stan', 'Bianca');
-- cazul in care clientul nu exista:
EXECUTE Gestionare_Client('Stan', 'Ana');

-- Pentru exercitiul 6 am adaugat:
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, metoda_plata, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0719472600'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Vasile'), 'cash', TO_DATE('12-05-2023', 'DD-MM-YYYY'));
INSERT INTO COMANDA(id_comanda, id_client, id_angajat, metoda_plata, data)
VALUES (cinema_seq.nextval, (SELECT id_client FROM CLIENT WHERE telefon = '0719472600'), (SELECT id_angajat FROM ANGAJAT WHERE nume_angajat = 'Popescu'), 'card', TO_DATE('12-06-2023', 'DD-MM-YYYY'));

INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'popcorn'), 112, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'suc'), 112, 2);
INSERT INTO DETALIU_COMANDA
VALUES (cinema_seq.nextval, (SELECT id_produs FROM PRODUS WHERE nume_produs = 'apa'), 113, 4);





-- Exercitiul 7.
-- Formulati in limbaj natural o problema pe care sa o rezolvati folosind un subprogram stocat independent care sa utilizeze 2 tipuri diferite de cursoare studiate, unul dintre acestea fiind cursor parametrizat, dependent de celalalt cursor. 
-- Apelati subprogramul.
-- Enunt:
-- Se afiseze pentru fiecare cinema o lista numerotata cu toate salile care apartin acestuia si capacitatea acestora.
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE Afisare_Sali IS
    CURSOR CursorCinematografe IS
        SELECT id_cinema as id_cinematograf, nume_cinema as nume_cinematograf
        FROM CINEMA;
        
    CURSOR CursorSali (v_id_cinematograf CINEMA.id_cinema%type) IS
        SELECT nume as nume_sala, capacitate as capacitate_sala
        FROM SALA
        WHERE id_cinema = v_id_cinematograf;

    var_nume_sala SALA.nume%type;
    var_capacitate_sala SALA.capacitate%type;
    var_numar_sala NUMBER := 1;
    var_numar_cinematograf NUMBER := 1;
BEGIN
    FOR i IN CursorCinematografe LOOP
        DBMS_OUTPUT.PUT_LINE('---------------------------------------');
        DBMS_OUTPUT.PUT_LINE(var_numar_cinematograf || '. Cinema: ' || i.nume_cinematograf);
        OPEN CursorSali(i.id_cinematograf);
        LOOP
            FETCH CursorSali INTO var_nume_sala, var_capacitate_sala;
            EXIT WHEN CursorSali%notfound;
            DBMS_OUTPUT.PUT_LINE('   ' || var_numar_sala || '. Sala: ' || var_nume_sala || ' -> capacitate = ' || var_capacitate_sala || ';');
            var_numar_sala := var_numar_sala + 1;
        END LOOP;
        var_numar_sala := 1; 
        var_numar_cinematograf := var_numar_cinematograf + 1;
        CLOSE CursorSali;
    END LOOP;
END Afisare_Sali;
/

-- Apelarea subprogramului (SQL*PLUS).
EXECUTE Afisare_Sali;

-- Apelarea subprogramului (PLSQL).
BEGIN
    Afisare_Sali;
END;
/




-- Exericitul 8.
-- Formulati in limbaj natural o problema pe care sa o rezolvati folosind un subprogram stocat independent de tip functie care sa utilizeze intr-o singura comanda SQL 3 dintre tabelele definite. Definiti minim 2 exceptii proprii. 
-- Apelati subprogramul astfel incat sa evidentiati toate cazurile definite si tratate.
-- Enunt: Definiti un subprogram prin care sa obtineti numele actorilor care joaca intr-un film al carui titlu este introdus.
-- Cele trei tabele definite folosite in subprogram: ACTOR, FILM_ACTOR, FILM.
-- Cele doua exceptii: 
    -- Titlul filmului introdus nu are niciun actor in baza de date.
    -- Titlul filmului introdus nu corespunde cu titlul niciunui film din baza de date.
    
CREATE OR REPLACE FUNCTION Actori_din_Film
    (v_titlu_film FILM.titlu_film%TYPE DEFAULT 'GhostBusters') 
RETURN VARCHAR2 IS
    v_rezultat VARCHAR2(100);
    v_cursor SYS_REFCURSOR; -- referinta catre cursor
    v_prenume_actor ACTOR.prenume_actor%TYPE;
    v_nume_actor ACTOR.nume_actor%TYPE;
    
     v_film_count NUMBER;
     v_actor_count NUMBER;
    
    titlul_filmului_nu_exista exception;
    titlul_filmului_nu_are_actori_introdusi exception;
BEGIN
    SELECT COUNT(*)
    INTO v_film_count
    FROM FILM
    WHERE titlu_film = v_titlu_film;

    IF v_film_count = 0 THEN
       RAISE titlul_filmului_nu_exista;
    END IF;

    OPEN v_cursor FOR
        SELECT a.prenume_actor, a.nume_actor
        FROM ACTOR a
        JOIN FILM_ACTOR fa ON a.id_actor = fa.id_actor
        JOIN FILM f ON fa.id_film = f.id_film
        WHERE f.titlu_film = v_titlu_film;

    SELECT COUNT(*)
    INTO v_actor_count
    FROM ACTOR a
    JOIN FILM_ACTOR fa ON a.id_actor = fa.id_actor
    JOIN FILM f ON fa.id_film = f.id_film
    WHERE f.titlu_film = v_titlu_film;

    IF v_actor_count = 0 THEN
        CLOSE v_cursor;
        RAISE titlul_filmului_nu_are_actori_introdusi;
    END IF;
    
    v_rezultat := '';
    
    LOOP
        FETCH v_cursor INTO v_prenume_actor, v_nume_actor;
        EXIT WHEN v_cursor%NOTFOUND;

        v_rezultat := v_rezultat || v_nume_actor || ' ' || v_prenume_actor || ', ';
    END LOOP;

    CLOSE v_cursor;
    
    v_rezultat := RTRIM(v_rezultat, ', ');

    RETURN v_rezultat;
EXCEPTION
    WHEN titlul_filmului_nu_are_actori_introdusi THEN
        DBMS_OUTPUT.PUT_LINE('Titlul filmului introdus nu are niciun actor in baza de date.');
        RETURN 'exceptie';
    WHEN titlul_filmului_nu_exista THEN
        DBMS_OUTPUT.PUT_LINE('Titlul filmului introdus nu corespunde cu titlul niciunui film din baza de date.');
        RETURN 'exceptie';
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Alta eroare' || SQLERRM);
        RETURN 'exceptie';
END Actori_din_Film;
/

-- Am inserat o noua linie in tabela FILM pentru a putea verifica a doua exceptie
INSERT INTO FILM
VALUES (cinema_seq_5.nextval, 'E.T.', 142, 'Sci-Fi', '');

-- Apelarea functiei pentru a evidentia toate cazurile.
-- cazul in care filmul introdus nu are niciun actor in baza de date.
DECLARE
    v_result VARCHAR2(100);
BEGIN
    v_result := Actori_din_Film('E.T.');
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
END;
/

-- cazul in care filmul nu exista in baza de date:
DECLARE
    v_result VARCHAR2(100);
BEGIN
    v_result := Actori_din_Film('OverBoard');
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
END;
/

-- cazul in care afiseaza corect:
DECLARE
    v_result VARCHAR2(100);
BEGIN
    v_result := Actori_din_Film('The Terminator');
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
END;
/




-- Exercitiul 9.
-- Formulati în limbaj natural o problema pe care s? o rezolvati folosind un subprogram stocat independent de tip procedura care sa utilizeze intr-o singura comanda SQL 5 dintre tabelele definite. Tratati toate excep?iile care pot aparea, incluzand exceptiile NO_DATA_FOUND si TOO_MANY_ROWS. 
-- Apelati subprogramul astfel incat sa evidentiati toate cazurile tratate.
-- Enunt: Definiti un subprogram stocat independent de tip procedura care sa obtina detaliile despre comanda plasata de un anumit client, identificat prin numele sau.
-- Detaliile Comenzii -> id-ul comenzii, numele angajatului care s-a ocupat de comanda, pretul total, metoda de plata, numarul de produse si produsele.
-- Cele cinci tabele definite folosite în subprogram: CLIENT, COMAND?, ANGAJAT, DETALIU_COMAND?, PRODUS.
-- Exceptiile tratate:
    -- Clientul nu a plasat o comanda.
    -- Nu exista client cu numele introdus (NO_DATA_FOOUND).
    -- Exista mai multi clienti cu numele introdus (TOO_MANY_ROWS).

CREATE OR REPLACE PROCEDURE Detalii_Comanda
    ( p_nume IN CLIENT.nume_client%TYPE,
      p_id_comanda OUT COMANDA.id_comanda%TYPE,
      p_nume_angajat OUT ANGAJAT.nume_angajat%TYPE,
      p_total OUT COMANDA.total%TYPE,
      p_metoda_plata OUT COMANDA.metoda_plata%TYPE,
      p_nr_produse OUT NUMBER,
      p_produse OUT VARCHAR2 ) IS
      
      CLIENT_NOT_PLACED_ORDER EXCEPTION;
BEGIN
    p_id_comanda := NULL;
    p_nume_angajat := NULL;
    p_total := NULL;
    p_metoda_plata := NULL;
    p_nr_produse := NULL;
    p_produse := NULL;

    SELECT dc.id_comanda, a.nume_angajat, c.total, c.metoda_plata, 
           NVL(SUM(dc.cantitate), 0) AS "Nr. produse",
           NVL(LISTAGG(DISTINCT p.nume_produs, ', ') WITHIN GROUP (ORDER BY p.nume_produs), 'No products') AS "Numele produselor"
    INTO p_id_comanda, p_nume_angajat, p_total, p_metoda_plata, p_nr_produse, p_produse
    FROM CLIENT cl
    LEFT JOIN COMANDA c ON cl.id_client = c.id_client
    LEFT JOIN ANGAJAT a ON c.id_angajat = a.id_angajat
    LEFT JOIN DETALIU_COMANDA dc ON dc.id_comanda = c.id_comanda
    LEFT JOIN PRODUS p ON p.id_produs = dc.id_produs
    WHERE cl.nume_client = p_nume
    GROUP BY cl.nume_client, dc.id_comanda, a.nume_angajat, c.total, c.metoda_plata;
    
    IF p_total = 0 AND p_id_comanda is NULL THEN
        RAISE CLIENT_NOT_PLACED_ORDER;
    END IF;
EXCEPTION
    WHEN CLIENT_NOT_PLACED_ORDER THEN
        DBMS_OUTPUT.PUT_LINE('Clientul nu a plasat o comanda!');
        RAISE_APPLICATION_ERROR(-20000, 'Clientul nu a plasat o comanda!');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista acest client!');
        RAISE_APPLICATION_ERROR(-20001, 'Nu exista acest client!');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Exista mai multi clienti cu acest nume!');
        RAISE_APPLICATION_ERROR(-20002, 'Exista mai multi clienti cu acest nume!');    
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('A aparut o eroare!');
        RAISE_APPLICATION_ERROR(-20003, 'A aparut o eroare!');
END Detalii_Comanda;
/

-- Apelarea procedurii.
-- Cazul in care afiseaza corect.
DECLARE
    v_id_comanda COMANDA.id_comanda%TYPE;
    v_nume_angajat ANGAJAT.nume_angajat%TYPE;
    v_total COMANDA.total%TYPE;
    v_metoda_plata COMANDA.metoda_plata%TYPE;
    v_nr_produse NUMBER;
    v_produse VARCHAR2(4000); 
    v_nume_client CLIENT.nume_client%TYPE := 'Paun'; 
BEGIN
    Detalii_Comanda(v_nume_client, v_id_comanda, v_nume_angajat, v_total, v_metoda_plata, v_nr_produse, v_produse);

    DBMS_OUTPUT.PUT_LINE('ID Comanda: ' || v_id_comanda);
    DBMS_OUTPUT.PUT_LINE('Nume angajat: ' || v_nume_angajat);
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Metoda de plata: ' || v_metoda_plata);
    DBMS_OUTPUT.PUT_LINE('Nr. produse comandate: ' || v_nr_produse);
    DBMS_OUTPUT.PUT_LINE('Produse: ' || v_produse);
END;
/

-- Cazul in care nu exista client cu numele introdus (NO_DATA_FOOUND).
DECLARE
    v_id_comanda COMANDA.id_comanda%TYPE;
    v_nume_angajat ANGAJAT.nume_angajat%TYPE;
    v_total COMANDA.total%TYPE;
    v_metoda_plata COMANDA.metoda_plata%TYPE;
    v_nr_produse NUMBER;
    v_produse VARCHAR2(4000); 
    v_nume_client CLIENT.nume_client%TYPE := 'Potlog'; 
BEGIN
    Detalii_Comanda(v_nume_client, v_id_comanda, v_nume_angajat, v_total, v_metoda_plata, v_nr_produse, v_produse);

    DBMS_OUTPUT.PUT_LINE('ID Comanda: ' || v_id_comanda);
    DBMS_OUTPUT.PUT_LINE('Nume angajat: ' || v_nume_angajat);
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Metoda de plata: ' || v_metoda_plata);
    DBMS_OUTPUT.PUT_LINE('Nr. produse comandate: ' || v_nr_produse);
    DBMS_OUTPUT.PUT_LINE('Produse: ' || v_produse);
END;
/

-- Cazul in care clientul nu a plasat o comanda.
DECLARE
    v_id_comanda COMANDA.id_comanda%TYPE;
    v_nume_angajat ANGAJAT.nume_angajat%TYPE;
    v_total COMANDA.total%TYPE;
    v_metoda_plata COMANDA.metoda_plata%TYPE;
    v_nr_produse NUMBER;
    v_produse VARCHAR2(4000); 
    v_nume_client CLIENT.nume_client%TYPE := 'Dumitrescu'; 
BEGIN
    Detalii_Comanda(v_nume_client, v_id_comanda, v_nume_angajat, v_total, v_metoda_plata, v_nr_produse, v_produse);

    DBMS_OUTPUT.PUT_LINE('ID Comanda: ' || v_id_comanda);
    DBMS_OUTPUT.PUT_LINE('Nume angajat: ' || v_nume_angajat);
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Metoda de plata: ' || v_metoda_plata);
    DBMS_OUTPUT.PUT_LINE('Nr. produse comandate: ' || v_nr_produse);
    DBMS_OUTPUT.PUT_LINE('Produse: ' || v_produse);
END;
/

-- Cazul exista mai multi clienti cu numele introdus (TOO_MANY_ROWS).
-- Pentru verificare am mai adaugat un client.
INSERT INTO CLIENT
VALUES (cinema_seq_5.nextval, 'Pestritu', 'Raluca', '0723400678', 'rralucapestrita@gmail.com');

DECLARE
    v_id_comanda COMANDA.id_comanda%TYPE;
    v_nume_angajat ANGAJAT.nume_angajat%TYPE;
    v_total COMANDA.total%TYPE;
    v_metoda_plata COMANDA.metoda_plata%TYPE;
    v_nr_produse NUMBER;
    v_produse VARCHAR2(4000); 
    v_nume_client CLIENT.nume_client%TYPE := 'Pestritu'; 
BEGIN
    Detalii_Comanda(v_nume_client, v_id_comanda, v_nume_angajat, v_total, v_metoda_plata, v_nr_produse, v_produse);

    DBMS_OUTPUT.PUT_LINE('ID Comanda: ' || v_id_comanda);
    DBMS_OUTPUT.PUT_LINE('Nume angajat: ' || v_nume_angajat);
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Metoda de plata: ' || v_metoda_plata);
    DBMS_OUTPUT.PUT_LINE('Nr. produse comandate: ' || v_nr_produse);
    DBMS_OUTPUT.PUT_LINE('Produse: ' || v_produse);
END;
/


    
-- Exercitiul 10. 
-- Definiti un trigger de tip LMD la nivel de comand?.
-- Definiti un trigger care si permita lucrul asupra tabelului PROIECTIE (INSERT, UPDATE, DELETE) în intervalul orar 10:00 - 20:00, de luni pâna vineri.
CREATE OR REPLACE TRIGGER trig_ex10
    BEFORE INSERT OR DELETE OR UPDATE on PROIECTIE
BEGIN
    IF (TO_CHAR(SYSDATE, 'D') IN (7, 1)) -- sambata si duminica
        OR (TO_CHAR(SYSDATE, 'HH24') NOT BETWEEN 10 AND 20) -- in afara intervalului orar 10:00 - 20:00
    THEN
        IF INSERTING THEN
            RAISE_APPLICATION_ERROR(-20001, 'Inserarea in tabel este permisa doar in timpul programului de lucru!');
        ELSIF DELETING THEN
            RAISE_APPLICATION_ERROR(-20002, 'Stergerea din tabel este permisa doar in timpul programului de lucru!');
        ELSE
            RAISE_APPLICATION_ERROR(-20000, 'Actualizarile in tabel sunt permise doar in timpul programului de lucru!');
        END IF;
    END IF;
END;
/

-- Declansati trigger-ul.
-- INSERT
INSERT INTO PROIECTIE
VALUES (121, (SELECT id_film FROM FILM WHERE titlu_film = 'GhostBusters'), (SELECT id_sala FROM SALA WHERE nume = 'Epika'), '19:00');

-- UPDATE
UPDATE PROIECTIE
SET id_sala = 7
WHERE id_proiectie = 121;

-- DELETE
DELETE FROM PROIECTIE
WHERE id_proiectie = 121;

-- Selectare ora si ziua curenta (pentru verificare).
SELECT TO_CHAR(SYSDATE, 'HH24:MI') AS current_hour, TO_CHAR(SYSDATE, 'D') AS current_day
FROM dual;

-- Stergeti trigger-ul.
DROP TRIGGER trig_ex10;






-- Exercitiul 11.
-- Definiti un trigger de tip LMD la nivel de linie.
-- Definiti un declansator prin care sa nu se permita micsorarea preturilor produselor din tabelul PRODUS.
-- Varianta 1.
CREATE OR REPLACE TRIGGER trig1_ex11
    BEFORE UPDATE OF pret ON PRODUS
    FOR EACH ROW
BEGIN
    IF (:NEW.pret < :OLD.pret) THEN
        RAISE_APPLICATION_ERROR(-20002, 'Pretul produsului nu poate fi micsorat');
    END IF;
END;
/

-- Varianta 2.
CREATE OR REPLACE TRIGGER trig2_ex11
    BEFORE UPDATE OF pret ON PRODUS
    FOR EACH ROW
    WHEN (NEW.pret < OLD.pret)
BEGIN
    RAISE_APPLICATION_ERROR(-20002, 'Pretul produsului nu poate fi micsorat');
END;
/

-- Varianta 3.
CREATE OR REPLACE PROCEDURE proc_trig_ex11
IS
BEGIN
    RAISE_APPLICATION_ERROR (-20000, 'Pretul produsului nu poate fi micsorat');
END;
/
CREATE OR REPLACE TRIGGER trig3_ex11
    BEFORE UPDATE OF pret ON PRODUS
    FOR EACH ROW
    WHEN (NEW.pret < OLD.pret)
BEGIN
    proc_trig_ex11;
END;
/

-- Varianta 4.
CREATE OR REPLACE TRIGGER trig4_ex11
    BEFORE UPDATE OF pret ON PRODUS
    FOR EACH ROW
    WHEN (NEW.pret < OLD.pret)
    CALL proc_trig_ex11
/

-- Declansati trigger-ul.
UPDATE PRODUS
SET pret = pret - 2;

-- Stergerea trigger-elor.
DROP TRIGGER trig3_ex11;




-- Exercitiul 12.
-- Definiti un trigger de tip LDD.
CREATE TABLE EVENIMENTE_EFECTUATE
    ( baza_de_date VARCHAR2(50),
      nume_utilizator VARCHAR2(50),
      eveniment VARCHAR2(50),
      tip_obiect VARCHAR2(50),
      nume_obiect VARCHAR2(50),
      data DATE );
    
-- Definirea trigger-ului
CREATE OR REPLACE TRIGGER trig_ex12
    AFTER CREATE OR ALTER OR DROP ON SCHEMA
BEGIN
    INSERT INTO EVENIMENTE_EFECTUATE
    VALUES ( sys.database_name,
             sys.login_user,
             sys.sysevent, 
             sys.dictionary_obj_name, 
             sys.dictionary_obj_type, 
             sysdate );
END;
/

-- Declansarea trigger-ului:
CREATE TABLE TEST_TABEL(
    id_tabel NUMBER,
    nume_tabel VARCHAR2(50)
    );
    
ALTER TABLE TEST_TABEL
ADD (descriere varchar(50));
    
ALTER TABLE TEST_TABEL
DROP COLUMN descriere;

DROP TABLE TEST_TABEL;

-- Stergere trigger:
DROP TRIGGER eveniment;




-- Exercitiul 13.
CREATE OR REPLACE PACKAGE pachet AS
    procedure Gestionare_Client
        ( var_nume_trimis IN VARCHAR2,
          var_prenume_trimis IN VARCHAR2 );
     
    procedure Afisare_Sali;
     
    function Actori_din_Film
        ( v_titlu_film FILM.titlu_film%TYPE DEFAULT 'GhostBusters' ) 
    return VARCHAR2;
    
    procedure Detalii_Comanda
        ( p_nume IN CLIENT.nume_client%TYPE,
          p_id_comanda OUT COMANDA.id_comanda%TYPE,
          p_nume_angajat OUT ANGAJAT.nume_angajat%TYPE,
          p_total OUT COMANDA.total%TYPE,
          p_metoda_plata OUT COMANDA.metoda_plata%TYPE,
          p_nr_produse OUT NUMBER,
          p_produse OUT VARCHAR2 );

END pachet;
/

CREATE OR REPLACE PACKAGE BODY pachet AS
    PROCEDURE Gestionare_Client(
        var_nume_trimis IN VARCHAR2,
        var_prenume_trimis IN VARCHAR2
    ) IS
        TYPE tablou_indexat IS TABLE OF VARCHAR2(200) INDEX BY PLS_INTEGER;
        TYPE tablou_imbricat IS TABLE OF NUMBER;
        TYPE vector IS VARRAY(50) OF VARCHAR2(200);
    
        tablou_clienti_existenti tablou_indexat;
        tablou_preturi_comenzi tablou_imbricat := tablou_imbricat();
        vector_metode_plata vector := vector();
        
        var_exista_client BOOLEAN;
        var_suma_totala NUMBER := 0;
        var_metoda_plata_preferata VARCHAR2(10);
        
        v_index PLS_INTEGER := 1;
        v_prenume_db VARCHAR2(50);
        v_id_client CLIENT.id_client%TYPE;
    
        v_nr_plati_card NUMBER := 0;
        v_nr_plati_cash NUMBER := 0;
    
    BEGIN
        SELECT nume_client
        BULK COLLECT INTO tablou_clienti_existenti
        FROM CLIENT;
    
        var_exista_client := FALSE;
    
        FOR i IN tablou_clienti_existenti.FIRST..tablou_clienti_existenti.LAST LOOP
            IF tablou_clienti_existenti(i) = var_nume_trimis THEN
                var_exista_client := TRUE;
    
                SELECT prenume_client INTO v_prenume_db
                FROM CLIENT
                WHERE nume_client = var_nume_trimis;
    
                IF v_prenume_db <> var_prenume_trimis THEN
                    var_exista_client := FALSE;
                END IF;
            END IF;
        END LOOP;
    
        IF var_exista_client = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('Clientul nu exista.');
        ELSE
            SELECT id_client INTO v_id_client
            FROM CLIENT
            WHERE nume_client = var_nume_trimis AND prenume_client = var_prenume_trimis;
    
            SELECT total
            BULK COLLECT INTO tablou_preturi_comenzi
            FROM COMANDA
            WHERE id_client = v_id_client;
            
            FOR i IN tablou_preturi_comenzi.FIRST..tablou_preturi_comenzi.LAST LOOP
                var_suma_totala := var_suma_totala + tablou_preturi_comenzi(i);
            END LOOP;
            
            SELECT metoda_plata
            BULK COLLECT INTO vector_metode_plata
            FROM COMANDA
            WHERE id_client = v_id_client;
            
            FOR i IN vector_metode_plata.FIRST..vector_metode_plata.LAST LOOP
                IF vector_metode_plata(i) = 'card' THEN
                    v_nr_plati_card := v_nr_plati_card + 1;
                END IF;
                IF vector_metode_plata(i) = 'cash' THEN
                    v_nr_plati_cash := v_nr_plati_cash + 1;
                END IF;
            END LOOP;
    
            IF v_nr_plati_card > v_nr_plati_cash THEN
                var_metoda_plata_preferata := 'Card';
            END IF;
            
            IF v_nr_plati_cash > v_nr_plati_card THEN
                var_metoda_plata_preferata := 'Cash';
            END IF;
            
            IF v_nr_plati_cash = v_nr_plati_card THEN
                var_metoda_plata_preferata := 'Card/Cash';
            END IF;
    
            DBMS_OUTPUT.PUT_LINE('Suma totala a comenzilor: ' || var_suma_totala);
            DBMS_OUTPUT.PUT_LINE('Metoda de plata preferata: ' || var_metoda_plata_preferata);
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'A aparut o eroare!');
            
    END Gestionare_Client;
    
    PROCEDURE Afisare_Sali IS
        CURSOR CursorCinematografe IS
            SELECT id_cinema as id_cinematograf, nume_cinema as nume_cinematograf
            FROM CINEMA;
            
        CURSOR CursorSali (v_id_cinematograf CINEMA.id_cinema%type) IS
            SELECT nume as nume_sala, capacitate as capacitate_sala
            FROM SALA
            WHERE id_cinema = v_id_cinematograf;
    
        var_nume_sala SALA.nume%type;
        var_capacitate_sala SALA.capacitate%type;
        var_numar_sala NUMBER := 1;
        var_numar_cinematograf NUMBER := 1;
    BEGIN
        FOR i IN CursorCinematografe LOOP
            DBMS_OUTPUT.PUT_LINE('---------------------------------------');
            DBMS_OUTPUT.PUT_LINE(var_numar_cinematograf || '. Cinema: ' || i.nume_cinematograf);
            OPEN CursorSali(i.id_cinematograf);
            LOOP
                FETCH CursorSali INTO var_nume_sala, var_capacitate_sala;
                EXIT WHEN CursorSali%notfound;
                DBMS_OUTPUT.PUT_LINE('   ' || var_numar_sala || '. Sala: ' || var_nume_sala || ' -> capacitate = ' || var_capacitate_sala || ';');
                var_numar_sala := var_numar_sala + 1;
            END LOOP;
            var_numar_sala := 1; 
            var_numar_cinematograf := var_numar_cinematograf + 1;
            CLOSE CursorSali;
        END LOOP;
    END Afisare_Sali;
    
    FUNCTION Actori_din_Film
        (v_titlu_film FILM.titlu_film%TYPE DEFAULT 'GhostBusters') 
    RETURN VARCHAR2 IS
        v_rezultat VARCHAR2(100);
        v_cursor SYS_REFCURSOR;
        v_prenume_actor ACTOR.prenume_actor%TYPE;
        v_nume_actor ACTOR.nume_actor%TYPE;
        
         v_film_count NUMBER;
         v_actor_count NUMBER;
        
        titlul_filmului_nu_exista exception;
        titlul_filmului_nu_are_actori_introdusi exception;
    BEGIN
        SELECT COUNT(*)
        INTO v_film_count
        FROM FILM
        WHERE titlu_film = v_titlu_film;
    
        IF v_film_count = 0 THEN
           RAISE titlul_filmului_nu_exista;
        END IF;
    
        OPEN v_cursor FOR
            SELECT a.prenume_actor, a.nume_actor
            FROM ACTOR a
            JOIN FILM_ACTOR fa ON a.id_actor = fa.id_actor
            JOIN FILM f ON fa.id_film = f.id_film
            WHERE f.titlu_film = v_titlu_film;
    
        SELECT COUNT(*)
        INTO v_actor_count
        FROM ACTOR a
        JOIN FILM_ACTOR fa ON a.id_actor = fa.id_actor
        JOIN FILM f ON fa.id_film = f.id_film
        WHERE f.titlu_film = v_titlu_film;
    
        IF v_actor_count = 0 THEN
            CLOSE v_cursor;
            RAISE titlul_filmului_nu_are_actori_introdusi;
        END IF;
        
        v_rezultat := '';
        
        LOOP
            FETCH v_cursor INTO v_prenume_actor, v_nume_actor;
            EXIT WHEN v_cursor%NOTFOUND;
    
            v_rezultat := v_rezultat || v_nume_actor || ' ' || v_prenume_actor || ', ';
        END LOOP;
    
        CLOSE v_cursor;
        
        v_rezultat := RTRIM(v_rezultat, ', ');
    
        RETURN v_rezultat;
    EXCEPTION
        WHEN titlul_filmului_nu_are_actori_introdusi THEN
            DBMS_OUTPUT.PUT_LINE('Titlul filmului introdus nu are niciun actor in baza de date.');
            RETURN 'exceptie';
        WHEN titlul_filmului_nu_exista THEN
            DBMS_OUTPUT.PUT_LINE('Titlul filmului introdus nu corespunde cu titlul niciunui film din baza de date.');
            RETURN 'exceptie';
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Alta eroare' || SQLERRM);
            RETURN 'exceptie';
    END Actori_din_Film;
    
    PROCEDURE Detalii_Comanda
        ( p_nume IN CLIENT.nume_client%TYPE,
          p_id_comanda OUT COMANDA.id_comanda%TYPE,
          p_nume_angajat OUT ANGAJAT.nume_angajat%TYPE,
          p_total OUT COMANDA.total%TYPE,
          p_metoda_plata OUT COMANDA.metoda_plata%TYPE,
          p_nr_produse OUT NUMBER,
          p_produse OUT VARCHAR2 ) IS
          
          CLIENT_NOT_PLACED_ORDER EXCEPTION;
    BEGIN
        p_id_comanda := NULL;
        p_nume_angajat := NULL;
        p_total := NULL;
        p_metoda_plata := NULL;
        p_nr_produse := NULL;
        p_produse := NULL;
    
        SELECT dc.id_comanda, a.nume_angajat, c.total, c.metoda_plata, 
               NVL(SUM(dc.cantitate), 0) AS "Nr. produse",
               NVL(LISTAGG(DISTINCT p.nume_produs, ', ') WITHIN GROUP (ORDER BY p.nume_produs), 'No products') AS "Numele produselor"
        INTO p_id_comanda, p_nume_angajat, p_total, p_metoda_plata, p_nr_produse, p_produse
        FROM CLIENT cl
        LEFT JOIN COMANDA c ON cl.id_client = c.id_client
        LEFT JOIN ANGAJAT a ON c.id_angajat = a.id_angajat
        LEFT JOIN DETALIU_COMANDA dc ON dc.id_comanda = c.id_comanda
        LEFT JOIN PRODUS p ON p.id_produs = dc.id_produs
        WHERE cl.nume_client = p_nume
        GROUP BY cl.nume_client, dc.id_comanda, a.nume_angajat, c.total, c.metoda_plata;
        
        IF p_total = 0 AND p_id_comanda is NULL THEN
            RAISE CLIENT_NOT_PLACED_ORDER;
        END IF;
    EXCEPTION
        WHEN CLIENT_NOT_PLACED_ORDER THEN
            RAISE_APPLICATION_ERROR(-20003, 'Clientul nu a plasat o comanda!');
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Nu exista acest client!');
        WHEN TOO_MANY_ROWS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Exista mai multi clienti cu acest nume!');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Alta eroare!');
    END;
END pachet;
/

-- Apelare pachet:
DECLARE
    v_rezultat VARCHAR2(200);
    v_id_comanda COMANDA.id_comanda%TYPE;
    v_nume_angajat ANGAJAT.nume_angajat%TYPE;
    v_total COMANDA.total%TYPE;
    v_metoda_plata COMANDA.metoda_plata%TYPE;
    v_nr_produse NUMBER;
    v_produse VARCHAR2(4000); 

BEGIN
    DBMS_OUTPUT.PUT_LINE('Exercitiul 6');
    pachet.Gestionare_Client('Stan', 'Bianca');
    DBMS_OUTPUT.PUT_LINE(null);
    
    DBMS_OUTPUT.PUT_LINE('Exercitiul 7');
    pachet.Afisare_Sali;
    DBMS_OUTPUT.PUT_LINE(null);
    
    DBMS_OUTPUT.PUT_LINE('Exercitiul 8');
    v_rezultat := pachet.Actori_din_Film('The Terminator');
    DBMS_OUTPUT.PUT_LINE(v_rezultat);
    DBMS_OUTPUT.PUT_LINE(null);
    
    DBMS_OUTPUT.PUT_LINE('Exercitiul 9');
    pachet.Detalii_Comanda('Ionescu', v_id_comanda, v_nume_angajat, v_total, v_metoda_plata, v_nr_produse, v_produse);
    DBMS_OUTPUT.PUT_LINE('ID Comanda: ' || v_id_comanda);
    DBMS_OUTPUT.PUT_LINE('Nume Angajat: ' || v_nume_angajat);
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Metoda Plata: ' || v_metoda_plata);
    DBMS_OUTPUT.PUT_LINE('Nr. Produse: ' || v_nr_produse);
    DBMS_OUTPUT.PUT_LINE('Produse: ' || v_produse);
END;
/


