create database Online_Food_Delivery_System;
use Online_Food_Delivery_System; 

CREATE TABLE Restaurants (
 restaurant_id INT PRIMARY KEY,
 restaurant_name VARCHAR(100) NOT NULL,
 cuisine_type VARCHAR(50),
 address VARCHAR(255),
 phone VARCHAR(20)
 );

 CREATE TABLE MenuItems (
 item_id INT PRIMARY KEY,
 restaurant_id INT,
 item_name VARCHAR(100) NOT NULL,
 description VARCHAR(255),
 price DECIMAL(10, 2),
 FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
 );

 CREATE TABLE Orders (
 order_id INT PRIMARY KEY,
 item_id INT,
 customer_name VARCHAR(100) NOT NULL,
 delivery_address VARCHAR(255),
 order_date DATE,
 total_amount DECIMAL(10, 2),
 FOREIGN KEY (item_id) REFERENCES MenuItems(item_id)
 );

  INSERT INTO Restaurants (restaurant_id, restaurant_name, cuisine_type,
 address, phone) VALUES
 (1, 'Pasta Palace', 'Italian', '123 Main St, City, State','555-123-4567'),
 (2, 'Taco Time', 'Mexican', '456 Elm St, City, State','555-987-6543'),
 (3, 'Burger Barn', 'American', '789 Oak St, City, State','555-789-1234');

  INSERT INTO MenuItems (item_id, restaurant_id, item_name, description,
 price) VALUES
 (101, 1, 'Spaghetti Carbonara', 'Pasta with eggs, cheese, pancetta, and black pepper', 12.99),
 (102, 1, 'Margherita Pizza', 'Classic pizza with tomato, mozzarella, and basil', 14.99),
 (103, 2, 'Taco Combo', 'Assorted tacos with sides', 9.99),
 (104, 2, 'Quesadilla', 'Cheese-filled tortilla with meat or vegetables', 8.99),
 (105, 3, 'Classic Burger', 'Beef patty with lettuce, tomato, onion, and pickles', 10.99);

  INSERT INTO Orders (order_id, item_id, customer_name, delivery_address,
 order_date, total_amount) VALUES
 (201, 101, 'John Doe', '123 Main St, City, State', '2024-04-15', 12.99),
 (202, 103, 'Jane Smith', '456 Elm St, City, State', '2024-04-16', 9.99),
 (203, 105, 'Alice Johnson', '789 Oak St, City, State', '2024-04-17', 10.99),
 (204, 101, 'John Doe', '123 Main St, City, State', '2024-04-18', 12.99),
 (205, 104, 'Jane Smith', '456 Elm St, City, State', '2024-04-19', 8.99);

 select * from Restaurants;
 select * from Orders;
 select * from MenuItems;

 -- 1)Retrieve all restaurants offering Italian cuisine.
 select * from restaurants where cuisine_type = 'Italian';

 -- 2)List all menu items with prices for a specific restaurant.
 select Restaurants.restaurant_name, MenuItems.item_name, MenuItems.price from Restaurants 
 inner join MenuItems on Restaurants.restaurant_id = MenuItems.restaurant_id;

 -- 3)Calculate the total revenue generated from orders placed in the last month.
 select sum(total_amount) from Orders where month(order_date) = 04;

 -- 4)Update the description of a specific menu item.
 update MenuItems set description='Tacos with sides' where item_id = 103;

 -- 5)Identify the top-selling menu items based on the number of orders.
 select orders.customer_name, MenuItems.item_name, orders.total_amount 
 from Orders inner join MenuItems on Orders.item_id = MenuItems.item_id 
 order by Orders.Customer_name desc limit 2;

 -- 6)Retrieve the list of orders delivered to a specific address.
 select delivery_address, count(order_id) from orders group by delivery_address;

 -- 7)Find the restaurant with the highest total revenue.
select R.Restaurant_name, sum(O.total_amount) AS total_revenue from Orders O
join MenuItems M on O.item_id = M.item_id
join Restaurants R on M.Restaurant_id = R.Restaurant_id
group by R.Restaurant_name order by total_revenue desc limit 1;