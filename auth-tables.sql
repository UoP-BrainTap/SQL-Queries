-- role enum
DROP TYPE IF EXISTS roles;

CREATE TYPE roles AS ENUM ('admin', 'lecturer', 'student');

-- user table
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id            SERIAL PRIMARY KEY,
    email         VARCHAR(255) UNIQUE                 NOT NULL,
    password_hash TEXT                          NOT NULL,
    role          roles                               NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    access_token  CHAR(32)  DEFAULT NULL
);

INSERT INTO users (email, password_hash, role)
VALUES ('test@gmail.com', 'test', 'lecturer');