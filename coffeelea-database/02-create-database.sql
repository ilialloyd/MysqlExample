DROP DATABASE  IF EXISTS `coffelea`;

CREATE DATABASE  IF NOT EXISTS `coffelea`;
USE `coffelea`;

--
-- Table structure for table `coffelea`
--


-- Table 'admin'
DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Table 'p'

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Table 'customer'

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



-- Table 'order'

 --  TIMESTAMP for day, month,year  and hh,mm,ss 
-- Burda hemcinin biz avtomatik eger timestamp girmesek ozu avtomatik timeleri verecek

-- qeyd . dusunurem ki burda id elave elemek yerine birbasa produkt_id ni esas id qebul edib onu da hemcinin fk edib
-- mehsullari da satin ainan vaxta gore duzenleye bilerik - diskussiya eleyek bu hisseni       
-- bize burda hem de dusunursen ki qiymet lazim ola biler ya ehtiyac yoxdur?

-- vacib . size ve price arasinda relation nece qurulacaq

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
   order_date TIMESTAMP NOT NULL
                           DEFAULT CURRENT_TIMESTAMP 
                           ON UPDATE CURRENT_TIMESTAMP, 
                    
  `quantity` int(11)  DEFAULT NULL,
   `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  
  PRIMARY KEY (`id`),

     KEY `FK_DETAIL_idx` (`instructor_detail_id`),
   
  CONSTRAINT `FK_PRODUCT` FOREIGN KEY (`product_id`) 
  REFERENCES `product` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT `FK_USER` FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



