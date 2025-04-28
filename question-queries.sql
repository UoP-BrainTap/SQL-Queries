-- get questions owned by user
SELECT id, question, question_type
FROM questions
WHERE owner_id = 1
  AND deleted = FALSE;

-- get multiple choice options for question
SELECT id, option_text, is_correct
FROM multiple_choice_options
WHERE question_id = 1;

-- delete question
UPDATE questions
SET deleted = TRUE
WHERE id = 1;
