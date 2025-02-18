-- check if user exists
SELECT EXISTS(SELECT 1 FROM users WHERE email = 'test@gmail.com') AS exists;

-- check if user exists and password is correct
SELECT EXISTS(SELECT 1 FROM users WHERE email = 'test@gmail.com' AND password_hash = 'test') AS exists;

-- update new access token
UPDATE users
SET access_token = 'new_token'
WHERE email = 'test@gmail.com';

-- check access token exists and return user role and id
-- 0 rows = access token does not exist
SELECT id, role
FROM users
WHERE access_token = 'new_token';
