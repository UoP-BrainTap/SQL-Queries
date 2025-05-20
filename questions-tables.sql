CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    quiz_id INT,
    question_text TEXT NOT NULL,
    question_type VARCHAR(50) NOT NULL, --CHECK (question_type IN ('multiple_choice', 'text', 'drag_and_drop', 'dragging')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE quizzes (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE multiple_choice_options (
    id SERIAL PRIMARY KEY,
    question_id INT REFERENCES questions(id) ON DELETE CASCADE,
    option_text TEXT NOT NULL,
    is_correct BOOLEAN DEFAULT FALSE
);

CREATE TABLE student_responses
(
    id                 SERIAL PRIMARY KEY,
    user_id         INT REFERENCES users (id) ON DELETE CASCADE,
    question_id        INT REFERENCES questions (id) ON DELETE CASCADE,
    selected_option_id INT REFERENCES multiple_choice_options (id) ON DELETE SET NULL,
    response_text      TEXT, -- For text-based questions
    submitted_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

