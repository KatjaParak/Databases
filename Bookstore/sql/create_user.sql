USE master;

CREATE LOGIN bookstore_user WITH PASSWORD = '123user_password';

USE Bookstore;

CREATE USER bookstore_user FOR LOGIN bookstore_user;

-- grant permissions to user 
GRANT SELECT ON SCHEMA::dbo TO bookstore_user;
GRANT EXECUTE ON SCHEMA::dbo TO bookstore_user;