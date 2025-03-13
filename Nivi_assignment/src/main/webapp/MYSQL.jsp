create database nivi_cab;

use nivi_cab;
CREATE TABLE Customer (
    username VARCHAR(255) NOT NULL PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    address TEXT NOT NULL,
    nic_number VARCHAR(20) NOT NULL,
    mail_id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

use nivi_cab;
select * from Customer;

use nivi_cab;
CREATE TABLE cab_booking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    to_location VARCHAR(255) NOT NULL,
    from_location VARCHAR(255) NOT NULL,
    km INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


use nivi_cab;
select * from cab_booking;

use nivi_cab;
CREATE TABLE admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Insert a sample admin user (change username and password as needed)
INSERT INTO admin (username, password) VALUES ('admin', 'admin12345');

use nivi_cab;
select * from admin;

use nivi_cab;
CREATE TABLE drivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

use nivi_cab;
select * from drivers;
