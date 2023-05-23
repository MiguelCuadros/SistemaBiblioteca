USE master;
DROP DATABASE IF EXISTS dbSistemaBiblioteca;
CREATE DATABASE dbSistemaBiblioteca;
USE dbSistemaBiblioteca;

-- tables
-- Table: author
CREATE TABLE author (
    identifier int  NOT NULL IDENTITY(1,1),
    names varchar(50)  NULL,
    last_name varchar(80)  NOT NULL,
    nacionality varchar(80)  NOT NULL,
    CONSTRAINT author_pk PRIMARY KEY  (identifier)
);

-- Table: book
CREATE TABLE book (
    identifier int  NOT NULL IDENTITY(1,1),
    title varchar(200)  NOT NULL,
    stock varchar(5)  NOT NULL,
    ISBN char(13)  NOT NULL,
    category_identifier int  NOT NULL,
    author_identifier int  NOT NULL,
    CONSTRAINT book_pk PRIMARY KEY  (identifier)
);

-- Table: category
CREATE TABLE category (
    identifier int  NOT NULL IDENTITY(1,1),
    names varchar(120)  NULL,
    descriptions text  NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY  (identifier)
);

-- Table: librarian
CREATE TABLE librarian (
    identifier int  NOT NULL IDENTITY(1,1),
    names varchar(50)  NOT NULL,
    last_name varchar(80)  NOT NULL,
    document_type char(3)  NOT NULL,
    document_number char(15)  NOT NULL,
    email varchar(160)  NOT NULL,
    cellphone char(9)  NOT NULL,
    CONSTRAINT librarian_pk PRIMARY KEY  (identifier)
);

-- Table: loan
CREATE TABLE loan (
    identifier int  NOT NULL IDENTITY(1,1),
    start_dates date  NOT NULL,
    return_date date  NOT NULL,
    user_identifier int  NOT NULL,
    librarian_identifier int  NOT NULL,
    CONSTRAINT loan_pk PRIMARY KEY  (identifier)
);

-- Table: loan_detail
CREATE TABLE loan_detail (
    identifier int  NOT NULL IDENTITY(1,1),
    amount int  NOT NULL,
    loan_identifier int  NOT NULL,
    book_identifier int  NOT NULL,
    CONSTRAINT loan_detail_pk PRIMARY KEY  (identifier)
);

-- Table: reservation
CREATE TABLE reservation (
    identifier int  NOT NULL IDENTITY(1,1),
    dates date  NOT NULL,
    states char(1)  NOT NULL,
    librarian_identifier int  NOT NULL,
    user_identifier int  NOT NULL,
    book_identifier int  NOT NULL,
    CONSTRAINT reservation_pk PRIMARY KEY  (identifier)
);

-- Table: reservation_detail
CREATE TABLE reservation_detail (
    identifier int  NOT NULL IDENTITY(1,1),
    amount int  NOT NULL,
    book_identifier int  NOT NULL,
    reservation_identifier int  NOT NULL,
    CONSTRAINT reservation_detail_pk PRIMARY KEY  (identifier)
);

-- Table: users
CREATE TABLE users (
    identifier int  NOT NULL IDENTITY(1,1),
    names varchar(120)  NULL,
    last_name varchar(160)  NULL,
    document_type char(3)  NOT NULL,
    document_number int  NOT NULL,
    email varchar(160)  NOT NULL,
    cellphone char(9)  NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY  (identifier)
);

-- foreign keys
-- Reference: book_author (table: book)
ALTER TABLE book ADD CONSTRAINT book_author
    FOREIGN KEY (author_identifier)
    REFERENCES author (identifier);

-- Reference: book_category (table: book)
ALTER TABLE book ADD CONSTRAINT book_category
    FOREIGN KEY (category_identifier)
    REFERENCES category (identifier);

-- Reference: loan_detail_book (table: loan_detail)
ALTER TABLE loan_detail ADD CONSTRAINT loan_detail_book
    FOREIGN KEY (book_identifier)
    REFERENCES book (identifier);

-- Reference: loan_detail_loan (table: loan_detail)
ALTER TABLE loan_detail ADD CONSTRAINT loan_detail_loan
    FOREIGN KEY (loan_identifier)
    REFERENCES loan (identifier);

-- Reference: loan_librarian (table: loan)
ALTER TABLE loan ADD CONSTRAINT loan_librarian
    FOREIGN KEY (librarian_identifier)
    REFERENCES librarian (identifier);

-- Reference: loan_user (table: loan)
ALTER TABLE loan ADD CONSTRAINT loan_user
    FOREIGN KEY (user_identifier)
    REFERENCES users (identifier);

-- Reference: reservation_detail_reservation (table: reservation_detail)
ALTER TABLE reservation_detail ADD CONSTRAINT reservation_detail_reservation
    FOREIGN KEY (reservation_identifier)
    REFERENCES reservation (identifier);

-- Reference: reserve_book (table: reservation)
ALTER TABLE reservation ADD CONSTRAINT reserve_book
    FOREIGN KEY (book_identifier)
    REFERENCES book (identifier);

-- Reference: reserve_librarian (table: reservation)
ALTER TABLE reservation ADD CONSTRAINT reserve_librarian
    FOREIGN KEY (librarian_identifier)
    REFERENCES librarian (identifier);

-- Reference: reserve_user (table: reservation)
ALTER TABLE reservation ADD CONSTRAINT reserve_user
    FOREIGN KEY (user_identifier)
    REFERENCES users (identifier);

-- Reference: resever_detail_book (table: reservation_detail)
ALTER TABLE reservation_detail ADD CONSTRAINT resever_detail_book
    FOREIGN KEY (book_identifier)
    REFERENCES book (identifier);

-- Restricciones o Validaciones
-- Maestro 1 (Users)
/* El tipo de documento puede ser solo DNI ó CNE, entonces eliminamos la columna*/
ALTER TABLE users
	DROP COLUMN document_type

/* Agregar restricción para tipo documento */
ALTER TABLE users
	ADD document_type char(3) NOT NULL
	CONSTRAINT document_type_users
	CHECK(document_type ='DNI' OR document_type ='CNE')

/* Eliminar columna número de documento */
ALTER TABLE users
	DROP COLUMN document_number

/* El número de documento sólo debe permitir dígitos de 0 - 9 */
ALTER TABLE users
	ADD document_number char(9) NOT NULL
	CONSTRAINT document_number_users
	CHECK (document_number like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][^A-Z]')

/* Eliminar columna email */
ALTER TABLE users
	DROP COLUMN email

/* Agregar columna email */
ALTER TABLE users
	ADD email varchar(80) NOT NULL
	CONSTRAINT email_users
	CHECK(email LIKE '%@%._%')

/* Eliminar columna celular */
ALTER TABLE users
	DROP COLUMN cellphone

/* Validar que el celular esté conformado por 9 números */
ALTER TABLE users
	ADD cellphone char(9) NOT NULL
	CONSTRAINT cellphone_users
	CHECK (cellphone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

























-- End File
-- REGISTROS DE PRUEBA
INSERT INTO users (names, last_name, document_type, document_number, email, cellphone) VALUES 
('Miguel', 'Cuadros', 'DNI', '70000001', 'mcuadros@vallegrande.edu.pe', '900000001'),
('Luis', 'Manzo', 'DNI', '70000002', 'lmanzo@vallegrande.edu.pe', '900000002'),
('Jesus', 'Canales', 'DNI', '70000003', 'jcanales@vallegrande.edu.pe', '900000003'),
('Omar', 'Lopez', 'DNI', '70000004', 'olopez@vallegrande.edu.pe', '900000004'),
('Ebert', 'Ocares', 'DNI', '70000005', 'eocares@vallegrande.edu.pe', '900000005'),
('Fatima', 'Matos', 'DNI', '70000006', 'fmatos@vallegrande.edu.pe', '900000006');

INSERT INTO librarian (names, last_name, document_type, document_number, email, cellphone) VALUES
('Bryan', 'Torres', 'DNI', '70000007', 'btorres@santarita.edu.pe', '900000007');

INSERT INTO category (names, descriptions) VALUES
('Zona A', 'Generalidades'),
('Zona B', 'Filosofía y psicología'),
('Zona C', 'Religión'),
('Zona D', 'Ciencias sociales'),
('Zona E', 'Lenguas'),
('Zona F', 'Matemáticas y ciencias naturales'),
('Zona G', 'Tecnología y ciencias aplicadas'),
('Zona H', 'Artes'),
('Zona I', 'Literatura'),
('Zona J', 'Historia y geografía');

INSERT INTO author (names, last_name, nacionality) VALUES
('Renato', 'Cisneros', 'Perú'),
('José', 'Mariátegui', 'Perú'),
('Julio', 'Ribeyro', 'Perú'),
('Mario', 'Llosa', 'Perú'),
('Cesar', 'Vallejo', 'Perú');

INSERT INTO book (title, stock, ISBN, category_identifier, author_identifier) VALUES
('La distancia que nos separa', '15', '9788408158172', '9', '1'),
('Siete Ensayos de Interpretación de la Realidad Peruana', '22', '9786124824791', '4', '2'),
('La palabra del mudo', '17', '9786124463150', '9', '3'),
('La ciudad y los perros', '12', '9786124262708', '10', '4'),
('Los heraldos negros', '29', '9786123050788 ', '10', '5');

SELECT * FROM users;
SELECT * FROM librarian;
SELECT * FROM book;
SELECT * FROM author;
SELECT * FROM category;