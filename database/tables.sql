DROP DATABASE IF EXISTS dashboardly;

CREATE DATABASE dashboardly;

USE dashboardly;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(60) NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO users (email, password) VALUES ('1@gmail.com', '1234');
INSERT INTO users (email, password) VALUES ('2@gmail.com', '1234');
INSERT INTO users (email, password) VALUES ('3@gmail.com', '1234');
INSERT INTO users (email, password) VALUES ('4@gmail.com', '1234');

CREATE TABLE sessions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  userId INT NOT NULL REFERENCES users (id) ON DELETE CASCADE,
  token VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO sessions (userId, token) VALUES (1, 1);
INSERT INTO sessions (userId, token) VALUES (2, 2);
INSERT INTO sessions (userId, token) VALUES (3, 3);

CREATE TABLE boards (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ownerId INT NOT NULL REFERENCES users (id) ON DELETE SET NULL,
  title VARCHAR(50) NOT NULL,
  description VARCHAR(100),
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO boards (ownerId, title, description) VALUES (1, 'board', 'this is a description');
INSERT INTO boards (ownerId, title, description) VALUES (2, 'board2', 'this is a description2');
INSERT INTO boards (ownerId, title, description) VALUES (2, 'board23', 'this is a description23');
INSERT INTO boards (ownerId, title, description) VALUES (4, 'board3', 'this is a description23');

CREATE TABLE bookmarks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  boardId INT NOT NULL REFERENCES boards (id) ON DELETE SET NULL,
  title VARCHAR(50) NOT NULL,
  url VARCHAR(1000) NOT NULL,
  description VARCHAR(100),
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO bookmarks (boardId, title, url) VALUES (1, 'bookmark1', 'www.url.com');
INSERT INTO bookmarks (boardId, title, url) VALUES (2, 'bookmark2', 'www.url2.com');
INSERT INTO bookmarks (boardId, title, url) VALUES (2, 'bookmark22', 'www.url22.com');
INSERT INTO bookmarks (boardId, title, url) VALUES (4, 'bookmark23', 'www.url3.com');
