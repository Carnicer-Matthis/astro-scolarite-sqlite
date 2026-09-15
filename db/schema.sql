CREATE TABLE formations(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    level TEXT NOT NULL,
    description TEXT NOT NULL DEFAULT ''
);

CREATE TABLE students(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_number TEXT NOT NULL UNIQUE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    birth_date TEXT NOT NULL
);

CREATE TABLE courses(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    semester INTEGER NOT NULL CHECK(semester BETWEEN 1 AND 10),
    formation_id INTEGER NOT NULL,
    FOREIGN KEY(formation_id) REFERENCES formations(id)
);

CREATE TABLE registrations(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    formation_id INTEGER NOT NULL,
    academic_year TEXT NOT NULL,
    UNIQUE(student_id,academic_year),
    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(formation_id) REFERENCES formations(id)
);

-- Question 2 : Création de la table teachers
CREATE TABLE IF NOT EXISTS teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT
);

INSERT INTO formations (code, name, level, description) 
VALUES ('MMI', 'BUT MMI', 'Bac+3', 'Métiers du Multimédia et de l''Internet');

INSERT INTO students (student_number, first_name, last_name, email, birth_date) 
VALUES ('S12345', 'Alice', 'Dupont', 'alice@example.com', '2005-05-15');

INSERT INTO teachers (first_name, last_name, specialty) 
VALUES 
('Jean', 'Martin', 'Développement Web'),
('Marie', 'Durand', 'Informatique'),
('Alan', 'Turing', 'Informatique');

INSERT INTO courses (code, name, semester, formation_id) 
VALUES ('DEV1', 'AstroJS et SSR', 3, 1);

INSERT INTO registrations (student_id, formation_id, academic_year) 
VALUES (1, 1, '2025-2026');