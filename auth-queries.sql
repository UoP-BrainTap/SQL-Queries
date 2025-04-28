-- check if user exists
SELECT EXISTS(SELECT 1 FROM users WHERE email = 'test@gmail.com') AS exists;

-- check if user exists and if not create a new user
-- if 0 rows returned the user already exists, if an id is returned the user was created
WITH existing_user AS (
    SELECT id, email FROM users WHERE email = 'test@example.com'
)
INSERT INTO users (email, password_hash, role, access_token)
SELECT 'test@example.com', 'hash', 'lecturer', 'token'
WHERE NOT EXISTS (SELECT 1 FROM existing_user)
RETURNING id;

-- check if user exists and password is correct
SELECT EXISTS(SELECT 1 FROM users WHERE email = 'test@gmail.com' AND password_hash = 'test') AS exists;

-- get hashed password of user
SELECT password_hash
FROM users
WHERE email = 'test@gmail.com'
LIMIT 1;

-- update new access token
UPDATE users
SET access_token = 'new_token'
WHERE email = 'test@gmail.com';
`
-- check access token exists and return user role and id
-- 0 rows = access token does not exist
SELECT id, role
FROM users
WHERE access_token = 'new_token';
