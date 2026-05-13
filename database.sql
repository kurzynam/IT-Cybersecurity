-- Simple SQLite Database Example

-- USERS TABLE
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    nickname TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    email TEXT UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- POSTS TABLE
CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    content TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- COMMENTS TABLE
CREATE TABLE comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    comment TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- SAMPLE DATA

INSERT INTO users (fname, lname, nickname, password, email)
VALUES
('John', 'Doe', 'jdoe', 'pass123', 'john@example.com'),
('Anna', 'Smith', 'asmith', 'secret456', 'anna@example.com');

INSERT INTO posts (user_id, title, content)
VALUES
(1, 'First Post', 'Hello world!'),
(2, 'SQLite Example', 'This is a simple SQLite database.');

INSERT INTO comments (post_id, user_id, comment)
VALUES
(1, 2, 'Nice post!'),
(2, 1, 'Very useful example.');