-- user table
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id            SERIAL PRIMARY KEY,
    email         VARCHAR(255)                        NOT NULL,
    password_hash CHAR(25)                            NOT NULL,
    role          INTEGER REFERENCES roles (id)       NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    access_token  CHAR(25)  DEFAULT NULL
);

INSERT INTO users (email, password_hash, role)
VALUES ('test@gmail.com', 'test', 2);

-- role table
DROP TABLE IF EXISTS roles;

CREATE TABLE roles
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO roles (name)
VALUES ('admin'),
       ('lecturer'),
       ('student');