CREATE DATABASE IF NOT EXISTS taskmanager;

USE taskmanager;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email_id VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(10) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
-- drop table users;
select * from users;

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    task_name VARCHAR(255) NOT NULL,
    task_description TEXT NOT NULL,
    user_id INT NOT NULL,
    status ENUM('Pending', 'Completed') DEFAULT 'Pending',
    done int default 0,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
select * from tasks;
-- drop table tasks;
