
CREATE  TABLE users (
  username VARCHAR(45) NOT NULL ,
  address VARCHAR(45) NOT NULL ,
  email VARCHAR(45) NOT NULL ,
  password VARCHAR(45) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));

CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));




-- tables for product, product_type & user_product

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` INT(11) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `product`
--
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(255) ,
  `description` VARCHAR(255) NOT NULL,
  `price` FLOAT(11) NOT NULL,
  `productType_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `fk_product_producttype_id` FOREIGN KEY (`productType_id`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table user_product
--

DROP TABLE IF EXISTS `user_product`;
CREATE TABLE `user_product`(
  `user_username` VARCHAR(45) NOT NULL,
  `product_id` int(10) NOT NULL,
  PRIMARY KEY (`product_id`,`user_username`),
  CONSTRAINT `fk_user_product_user_username` FOREIGN KEY (`user_username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO users(username,address,email,password,enabled)
VALUES ('admin','Cluj','admin@yahoocom','123456', true);
INSERT INTO users(username,address,email,password,enabled)
VALUES ('raul','Cluj','admin@yahoocom','123456', true);

INSERT INTO user_roles (username, role)
VALUES ('admin', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role)
VALUES ('raul', 'ROLE_USER');


insert into product_type VALUES(1,"lactate");
insert into product_type VALUES(2,"fructe");
insert into product_type VALUES(3,"legume");

INSERT INTO product (product_name,description,price,productType_id)
VALUES ("Iaurt cu fructe de padure","Facut dupa o reteta traditionala, recomandam cel mai bun iaurt din Ardeal",10,1);

INSERT INTO product (product_name,description,price,productType_id)
VALUES ("Mere Golden","Gustul care nu se uita niciodata",3 ,2);

INSERT INTO product (product_name,description,price,productType_id)
VALUES ("Cartofi albi","Ideali pentru orice tip de reteta, atat la cuptor cat si prajiti", 2,3);