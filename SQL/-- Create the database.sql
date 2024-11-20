-- Create the database
CREATE DATABASE FindMyMeal;
USE FindMyMeal;

-- User table
CREATE TABLE User (
    UserId INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(150) NOT NULL,
    UserEmail VARCHAR(100) NOT NULL UNIQUE,
    UserPassword VARCHAR(255) NOT NULL
);

-- Recipe table
CREATE TABLE Recipe (
    RecipeId INT AUTO_INCREMENT PRIMARY KEY,
    RecipeName VARCHAR(255) NOT NULL,
    Ingredients TEXT NOT NULL,
    NutritionInfo TEXT,
    CreatedDate DATE DEFAULT CURRENT_DATE
);

-- UserRecipe table
CREATE TABLE UserRecipe (
    UserRecipeId INT AUTO_INCREMENT PRIMARY KEY,
    UserId INT NOT NULL,
    RecipeId INT NOT NULL,
    SaveDate DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (UserId) REFERENCES User(UserId),
    FOREIGN KEY (RecipeId) REFERENCES Recipe(RecipeId)
);

-- Insert data into User table
INSERT INTO User (UserName, UserEmail, UserPassword)
VALUES
('John Doe', 'johndoe@example.com', 'securepassword123'),
('Jana Smith', 'janasmith@example.com', 'anotherpassword456'),
('Alize Brown', 'alizebrown@example.com', 'mypassword789');

-- Insert data into Recipe table
INSERT INTO Recipe (RecipeName, Ingredients, NutritionInfo)
VALUES
('Classic Pancakes', 'Flour, Eggs, Milk, Sugar', 'Calories: 350, Protein: 8g, Fat: 10g'),
('Vegan Salad', 'Lettuce, Tomatoes, Cucumbers, Olive Oil', 'Calories: 150, Protein: 3g, Fat: 7g'),
('Spaghetti Bolognese', 'Spaghetti, Ground Beef, Tomato Sauce', 'Calories: 500, Protein: 20g, Fat: 15g');

-- Insert data into UserRecipe table
INSERT INTO UserRecipe (UserId, RecipeId)
VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1);
