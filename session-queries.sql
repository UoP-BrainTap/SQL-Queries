-- create session
UPDATE sessions
SET active = FALSE
WHERE session_code = 123456;

INSERT INTO sessions (owner_id, session_code)
VALUES (1, 123456)
RETURNING id;

-- new question
INSERT INTO session_question (session_id, question_id)
VALUES (1, 1);

-- NEW ANSWERE
INSERT INTO session_answers (session_id, session_member_id, question_id)
VALUES (1, 1, 1);

INSERT INTO session_multiple_choice_answers