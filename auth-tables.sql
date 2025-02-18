DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id           SERIAL PRIMARY KEY,
    email        VARCHAR(255)                        NOT NULL,
    password     CHAR(25)                            NOT NULL,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    access_token CHAR(25)  DEFAULT NULL
);