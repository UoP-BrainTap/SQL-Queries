DROP TABLE IF EXISTS questions, multiple_choice_options;
DROP TYPE IF EXISTS question_type;

CREATE TYPE question_type AS ENUM ('multiple_choice');

CREATE TABLE questions
(
    id            SERIAL PRIMARY KEY,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    owner_id      INT REFERENCES users (id),
    question_type question_type                       NOT NULL,
    question      TEXT                                NOT NULL,
    deleted       BOOLEAN   DEFAULT FALSE
);

CREATE TABLE multiple_choice_options
(
    id          SERIAL PRIMARY KEY,
    question_id INT REFERENCES questions (id),
    option_text TEXT NOT NULL,
    is_correct  BOOLEAN DEFAULT FALSE
);

-- example multi choice questions

INSERT INTO questions (owner_id, question_type, question)
VALUES (1, 'multiple_choice', 'What is 2 + 2?');

INSERT INTO multiple_choice_options (question_id, option_text, is_correct)
VALUES (1, '4', TRUE),
       (1, '3', FALSE),
       (1, '5', FALSE),
       (1, '6', FALSE);