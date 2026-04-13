-- ==============================
-- DATABASE SETUP
-- ==============================
CREATE DATABASE ecolearn_db;
USE ecolearn_db;

-- ==============================
-- USERS TABLE
-- ==============================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uid VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    display_name VARCHAR(255),
    photo_url VARCHAR(500),
    points INT DEFAULT 0,
    level INT DEFAULT 1,
    streak INT DEFAULT 0,
    completed_challenges INT DEFAULT 0,
    badges INT DEFAULT 0,
    trees_planted INT DEFAULT 0,
    learning_time INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ==============================
-- ACTIVITIES TABLE
-- ==============================
CREATE TABLE activities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    type VARCHAR(100) NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    icon VARCHAR(100),
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- FIXED 🔥
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ==============================
-- BADGES TABLE
-- ==============================
CREATE TABLE badges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    icon VARCHAR(100),
    date DATE, -- FIXED 🔥
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ==============================
-- WEEKLY PROGRESS TABLE
-- ==============================
CREATE TABLE weekly_progress (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    monday INT DEFAULT 0,
    tuesday INT DEFAULT 0,
    wednesday INT DEFAULT 0,
    thursday INT DEFAULT 0,
    friday INT DEFAULT 0,
    saturday INT DEFAULT 0,
    sunday INT DEFAULT 0,
    week_start DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ==============================
-- NEW TABLES (SIZE + PROFESSIONAL 🔥)
-- ==============================

-- Challenges Table
CREATE TABLE challenges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    reward_points INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User Challenges Mapping
CREATE TABLE user_challenges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    challenge_id INT,
    status VARCHAR(50),
    completed_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);

-- Leaderboard Table
CREATE TABLE leaderboard (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_points INT,
    rank_position INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- ==============================
-- INDEXES (PERFORMANCE 🔥)
-- ==============================
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_activities_user ON activities(user_id);
CREATE INDEX idx_badges_user ON badges(user_id);

-- ==============================
-- SAMPLE DATA (IMPORTANT 💥)
-- ==============================

INSERT INTO users (uid, email, display_name, points, level)
VALUES
('u1', 'user1@gmail.com', 'Raghvendra', 120, 2),
('u2', 'user2@gmail.com', 'Amit', 300, 4),
('u3', 'user3@gmail.com', 'Rahul', 500, 5);

INSERT INTO activities (user_id, type, title, description)
VALUES
(1, 'challenge', 'Plant a Tree', 'Planted a neem tree'),
(2, 'learning', 'Watched eco video', 'Completed lesson'),
(3, 'challenge', 'Save Water', 'Reduced usage');

INSERT INTO badges (user_id, name, icon, date)
VALUES
(1, 'Eco Starter', 'leaf', '2024-01-01'),
(2, 'Green Hero', 'tree', '2024-01-02');

INSERT INTO challenges (title, description, reward_points)
VALUES
('Plant Trees', 'Plant 5 trees', 100),
('Save Water', 'Reduce water usage', 80);

INSERT INTO user_challenges (user_id, challenge_id, status)
VALUES
(1, 1, 'completed'),
(2, 2, 'pending');

INSERT INTO leaderboard (user_id, total_points, rank_position)
VALUES
(1, 120, 3),
(2, 300, 2),
(3, 500, 1);
CREATE TABLE activities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    type VARCHAR(100) NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    icon VARCHAR(100),
    time VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE badges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    icon VARCHAR(100),
    date VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE weekly_progress (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    monday INT DEFAULT 0,
    tuesday INT DEFAULT 0,
    wednesday INT DEFAULT 0,
    thursday INT DEFAULT 0,
    friday INT DEFAULT 0,
    saturday INT DEFAULT 0,
    sunday INT DEFAULT 0,
    week_start DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
