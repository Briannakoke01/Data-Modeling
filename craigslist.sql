--Regions Table
CREATE TABLE Regions (
    region_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

--Users Table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    preferred_region_id INT REFERENCES Regions(region_id) ON DELETE SET NULL
);

--Categories Table
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);


--Posts Table
CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    location VARCHAR(255), -- e.g., "Downtown Seattle"
    region_id INT REFERENCES Regions(region_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--PostCategories Table
CREATE TABLE PostCategories (
    post_id INT REFERENCES Posts(post_id) ON DELETE CASCADE,
    category_id INT REFERENCES Categories(category_id) ON DELETE CASCADE,
    PRIMARY KEY (post_id, category_id)
);
