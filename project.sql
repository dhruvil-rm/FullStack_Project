CREATE DATABASE store_ratings;
USE store_ratings;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  address VARCHAR(400),
  role ENUM('admin','user','owner') DEFAULT 'user'
);

CREATE TABLE stores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(400)
);

CREATE TABLE ratings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  store_id INT NOT NULL,
  rating TINYINT NOT NULL,
  UNIQUE KEY uq_user_store (user_id, store_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (store_id) REFERENCES stores(id) ON DELETE CASCADE
);


USE store_ratings;

-- Insert an admin user
INSERT INTO users (name, email, password, address, role)
VALUES (
  'Administrator John Williams Senior',
  'admin@example.com',
  -- password = Admin@123
  '$2a$10$IGfH9Jc8oxc9lYrjkhheie9bDyX7OP9kLJ7G7cQ.G7z7AyVV0VbCG',
  '123 Admin Street, Admin City',
  'admin'
);

-- Insert some regular users
INSERT INTO users (name, email, password, address, role)
VALUES
(
  'Jonathan Williams Senior User',
  'jonathan@example.com',
  -- password = User@123
  '$2a$10$eA9W2T.yC5t68mbFOh6Cce6YOslMuE47qWZpphvGXvJu0NT8fyDwy',
  '45 User Road, Sample City',
  'user'
),
(
  'Elizabeth Catherine Montgomery Anderson',
  'elizabeth@example.com',
  -- password = User@123
  '$2a$10$eA9W2T.yC5t68mbFOh6Cce6YOslMuE47qWZpphvGXvJu0NT8fyDwy',
  '89 Park Lane, Sample City',
  'user'
);

-- Insert stores
INSERT INTO stores (name, address)
VALUES
  ('FreshMart Supermarket', '123 Market Street'),
  ('TechZone Electronics', '456 Tech Avenue'),
  ('BookNest Library', '789 Book Road'),
  ('CoffeeCorner Cafe', '101 Coffee Lane');
  
SELECT u.name, u.email, r.store_id, r.rating
FROM users u
LEFT JOIN ratings r ON u.id = r.user_id;







