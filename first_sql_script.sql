-- ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
-- ALTER TABLE users DROP COLUMN is_active;
-- ALTER TABLE users MODIFY COLUMN name VARCHAR(150);
-- ALTER TABLE users MODIFY COLUMN email VARCHAR(100) FIRST;
-- ALTER TABLE users MODIFY COLUMN gender ENUM('Male', 'Female', 'Other') AFTER name;
-- INSERT INTO users VALUES
-- ('alice@example.com', 1, 'Alice', 'Female', '1995-05-14', DEFAULT);
-- INSERT INTO users (name, email, gender, date_of_birth) VALUES
-- ('Bob', 'bob@example.com', 'Male', '1990-11-23');
-- INSERT INTO users (name, email, gender, date_of_birth) VALUES
-- ('David', 'david@example.com', 'Male', '2000-08-09'),
-- ('Eva', 'eva@example.com', 'Female', '1993-12-30');
USE startersql;
select * from users; 


