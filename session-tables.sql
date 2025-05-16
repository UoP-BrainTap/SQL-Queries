DROP TABLE IF EXISTS sessions, session_question, session_members, session_answers, session_multiple_choice_answers;

CREATE TABLE sessions
(
    id           SERIAL PRIMARY KEY,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    owner_id     INT REFERENCES users (id),
    session_code INT                                 NOT NULL,
    active       BOOLEAN   DEFAULT TRUE
);

CREATE TABLE session_question
(
    id          SERIAL PRIMARY KEY,
    session_id  INT REFERENCES sessions (id)  NOT NULL,
    question_id INT REFERENCES questions (id) NOT NULL
);

CREATE TABLE session_members
(
    id           SERIAL PRIMARY KEY,
    session_id   INT REFERENCES sessions (id) NOT NULL,
    user_id      INT REFERENCES users (id) DEFAULT NULL,
    anonymous_id UUID                      DEFAULT NULL
);

CREATE TABLE session_answers
(
    id                SERIAL PRIMARY KEY,
    session_id        INT REFERENCES sessions (id)         NOT NULL,
    session_member_id INT REFERENCES session_members (id)  NOT NULL,
    question_id       INT REFERENCES session_question (id) NOT NULL
);

CREATE TABLE session_multiple_choice_answers
(
    session_answer_id INT REFERENCES session_answers (id)         NOT NULL,
    option_id         INT REFERENCES multiple_choice_options (id) NOT NULL
);