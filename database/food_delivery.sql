CREATE DATABASE IF NOT EXISTS `food`;
USE `food`;

CREATE TABLE IF NOT EXISTS `user` (
  `userid` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(150) NOT NULL UNIQUE,
  `phonenumber` VARCHAR(30),
  `address` VARCHAR(255),
  `role` VARCHAR(50),
  `createddate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `lastlogindate` TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS `restaurant` (
  `restaurantid` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(150) NOT NULL,
  `address` VARCHAR(255),
  `phonenumber` VARCHAR(30),
  `cusinetype` VARCHAR(100),
  `deliverytime` VARCHAR(50),
  `admineuserid` INT,
  `rating` VARCHAR(20),
  `isactive` VARCHAR(20),
  `imagepath` VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS `menu` (
  `menuid` INT AUTO_INCREMENT PRIMARY KEY,
  `restaurantid` INT NOT NULL,
  `itemname` VARCHAR(150) NOT NULL,
  `description` VARCHAR(500),
  `price` DECIMAL(10,2) NOT NULL,
  `isavailable` VARCHAR(20),
  `ratings` VARCHAR(20),
  `imagepath` VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS `order` (
  `orderid` INT AUTO_INCREMENT PRIMARY KEY,
  `restaurantid` INT,
  `userid` INT,
  `orderdate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `totalamount` DECIMAL(10,2),
  `status` VARCHAR(50),
  `paymentmode` VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `order_item` (
  `orderitemid` INT AUTO_INCREMENT PRIMARY KEY,
  `orderid` INT NOT NULL,
  `menuid` INT NOT NULL,
  `quantity` INT NOT NULL,
  `totalamount` DECIMAL(10,2)
);

INSERT INTO `restaurant` (`name`,`address`,`phonenumber`,`cusinetype`,`deliverytime`,`admineuserid`,`rating`,`isactive`,`imagepath`) VALUES
('Bawarchi','RTC X Roads, Hyderabad','040-27605333','North Indian, Biryani','30-40 mins',1,'4.4','Active','https://images.unsplash.com/photo-1563379091339-03246963d96c?w=800'),
('Paradise Biryani','Secunderabad, Hyderabad','040-27843163','Hyderabadi Biryani','35-45 mins',1,'4.3','Active','https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=800'),
('Shah Ghouse','Tolichowki, Hyderabad','040-23536666','Biryani, Mughlai','35-45 mins',1,'4.2','Active','https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800'),
('Cafe Bahar','Basheerbagh, Hyderabad','040-23237333','Biryani, Chinese','30-40 mins',1,'4.4','Active','https://images.unsplash.com/photo-1547592180-85f173990554?w=800'),
('Chichas','Lakdikapul, Hyderabad','040-23311999','Hyderabadi, Mughlai','30-40 mins',1,'4.1','Active','https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800'),
('Absolute Barbecues','Gachibowli, Hyderabad','040-48555555','Barbecue, North Indian','40-50 mins',1,'4.5','Active','https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800'),
('Flechazo','Jubilee Hills, Hyderabad','040-48556666','Mediterranean, Asian','40-50 mins',1,'4.3','Active','https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?w=800'),
('Minerva Coffee Shop','Himayatnagar, Hyderabad','040-23221000','South Indian, Cafe','25-35 mins',1,'4.2','Active','https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=800'),
('Sarvi Restaurant','Banjara Hills, Hyderabad','040-23355555','North Indian, Chinese','35-45 mins',1,'4.0','Active','https://images.unsplash.com/photo-1513104890138-7c749659a591?w=800'),
('Ulavacharu','Madhapur, Hyderabad','040-40123456','Andhra, South Indian','35-45 mins',1,'4.4','Active','https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800'),
('Chutneys','Somajiguda, Hyderabad','040-23333333','South Indian','25-35 mins',1,'4.3','Active','https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=800'),
('Nayyab Hotel','Charminar, Hyderabad','040-24570000','Biryani, Mughlai','35-45 mins',1,'4.2','Active','https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?w=800');

INSERT INTO `menu` (`restaurantid`,`itemname`,`description`,`price`,`isavailable`,`ratings`,`imagepath`) VALUES
(1,'Chicken Biryani','Fragrant Hyderabadi chicken biryani with raita',280,'Available',4.5,'https://images.unsplash.com/photo-1563379091339-03246963d96c?w=800'),
(1,'Mutton Biryani','Slow-cooked mutton biryani with aromatic spices',360,'Available',4.4,'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=800'),
(2,'Paradise Special Biryani','Classic Hyderabadi biryani served with mirchi ka salan',320,'Available',4.4,'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=800'),
(2,'Chicken 65','Crispy spicy chicken bites',220,'Available',4.2,'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800'),
(3,'Mutton Biryani','Rich mutton biryani with boiled egg and salan',350,'Available',4.4,'https://images.unsplash.com/photo-1563379091339-03246963d96c?w=800'),
(3,'Haleem','Slow-cooked meat and lentil stew',180,'Available',4.3,'https://images.unsplash.com/photo-1547592180-85f173990554?w=800'),
(4,'Chicken Biryani','Traditional chicken biryani with salan',290,'Available',4.5,'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=800'),
(4,'Chicken Manchurian','Indo-Chinese chicken in a tangy sauce',240,'Available',4.1,'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800'),
(5,'Mutton Biryani','Tender mutton layered with fragrant basmati rice',340,'Available',4.3,'https://images.unsplash.com/photo-1563379091339-03246963d96c?w=800'),
(5,'Double Ka Meetha','Hyderabadi bread pudding with saffron',120,'Available',4.2,'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=800'),
(6,'Barbecue Platter','Assorted grilled kebabs and tandoori starters',599,'Available',4.6,'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800'),
(6,'Paneer Tikka','Chargrilled paneer with peppers and onions',299,'Available',4.4,'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=800'),
(7,'Mediterranean Mezze','Hummus, falafel, pita and fresh salads',449,'Available',4.4,'https://images.unsplash.com/photo-1544510808-91bcbee1df55?w=800'),
(7,'Asian Stir Fry','Seasonal vegetables and noodles in Asian sauce',329,'Available',4.2,'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800'),
(8,'Masala Dosa','Crisp dosa with potato masala and chutneys',140,'Available',4.4,'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=800'),
(8,'Filter Coffee','South Indian filter coffee',70,'Available',4.5,'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=800'),
(9,'Butter Chicken','Creamy tomato-based chicken curry',320,'Available',4.3,'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=800'),
(9,'Margherita Pizza','Classic pizza with tomato, basil and mozzarella',299,'Available',4.2,'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=800'),
(10,'Andhra Meals','Traditional rice meal with curries and accompaniments',260,'Available',4.5,'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=800'),
(10,'Gongura Chicken','Andhra-style chicken cooked with gongura leaves',310,'Available',4.4,'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=800'),
(11,'Idli Vada Combo','Soft idli and crisp vada with sambar and chutney',130,'Available',4.4,'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=800'),
(11,'Paneer Dosa','Dosa filled with spiced paneer and vegetables',180,'Available',4.2,'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=800'),
(12,'Nihari','Slow-cooked spiced meat stew with naan',280,'Available',4.3,'https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?w=800'),
(12,'Chicken Biryani','Aromatic chicken biryani with raita and salan',290,'Available',4.4,'https://images.unsplash.com/photo-1563379091339-03246963d96c?w=800');