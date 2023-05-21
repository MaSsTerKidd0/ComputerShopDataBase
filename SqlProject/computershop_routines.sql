CREATE DATABASE  IF NOT EXISTS `computershop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `computershop`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: computershop
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'computershop'
--

--
-- Dumping routines for database 'computershop'
--
/*!50003 DROP FUNCTION IF EXISTS `function_checkProductAvailability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `function_checkProductAvailability`(productName varchar(45)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE stockAmount INT;
    DECLARE result varchar(50);
	select unitsInStock into stockAmount from products 
    where products.name = productName limit 1;
    
    if stockAmount > 0 Then
		SET result = "Available";
	ELSE 
		SET result = "Not Available";
	END IF;
    RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `function_employeeMonthlySalary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `function_employeeMonthlySalary`(employeeID INT, monthSalary INT, yearSalary INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_salary DECIMAL(10,2) default 0;
    DECLARE default_salary DECIMAL(10,2);
    
    IF monthSalary < 1 OR monthSalary > 12 THEN
        RETURN -1;
    ELSE
        -- Get default salary of employee
        SELECT salary INTO default_salary FROM employees WHERE personID = employeeID;
        
        -- Calculate total salary of employee for given month and year
        SELECT SUM(function_GetOrderTotalPrice(products_orders.orderID) * 0.05) INTO total_salary
        FROM products_orders
        INNER JOIN orders ON products_orders.orderID = orders.orderID
        WHERE orders.employeeID = employeeID AND MONTH(orders.OrderDate) = monthSalary AND YEAR(orders.OrderDate) = yearSalary;
        
        IF total_salary IS NULL THEN
            RETURN default_salary;
        ELSE
            RETURN total_salary + default_salary;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `function_GetOrderTotalPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `function_GetOrderTotalPrice`(orderID int) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_price DECIMAL(10,2) DEFAULT 0;
    
    -- Calculate total price of the order
    SELECT SUM(p.price * po.productAmount) INTO total_price
    FROM products p
    INNER JOIN products_orders po ON p.productID = po.productID
    WHERE po.orderID = orderID;
    
    RETURN total_price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `function_GetProductSales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `function_GetProductSales`(productName VARCHAR(45), yearCheck INT, monthCheck INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE productSales INT DEFAULT 0;
	
	SELECT SUM(products_orders.productAmount) INTO productSales
	FROM products_orders
	JOIN products ON products_orders.productID = products.productID
	JOIN orders ON products_orders.orderID = orders.orderID
	WHERE products.name = productName
	AND YEAR(orders.OrderDate) = yearCheck
	AND MONTH(orders.OrderDate) = monthCheck;
	
	RETURN productSales;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `function_IsCustomerVeteran` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `function_IsCustomerVeteran`(customerID INT, vetranDays INT) RETURNS tinyint
    DETERMINISTIC
BEGIN
    DECLARE firstOrderDate DATE;
    DECLARE diff INT;
    
    SELECT OrderDate INTO firstOrderDate
    FROM orders
    WHERE CustomerID = customerID
    ORDER BY OrderDate ASC
    LIMIT 1;
    
    SET diff = DATEDIFF(CURDATE(), firstOrderDate);
    
    IF diff > vetranDays THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `function_MonthShopProfit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `function_MonthShopProfit`(checkMonth int, checkYear int) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE totalProfit INT DEFAULT 0;
    
    SELECT SUM((p.price - p.shopPrice) * po.productAmount)
    INTO totalProfit
    FROM products p
    JOIN products_orders po ON p.productID = po.productID
    JOIN orders o ON po.orderID = o.orderID
    WHERE MONTH(o.OrderDate) = checkMonth AND YEAR(o.OrderDate) = checkYear;
    
    IF totalProfit IS NULL THEN
        SET totalProfit = 0;
    END IF;
    
    RETURN totalProfit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `function_ProductAvailableDiscount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `function_ProductAvailableDiscount`(productName VARCHAR(45), yearCheck INT, monthCheck INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE salesAmount INT DEFAULT 0;
    DECLARE discount INT DEFAULT 0;
    
    SELECT function_GetProductSales(productName, yearCheck, monthCheck)
    INTO salesAmount;
    
    CASE
        WHEN salesAmount < 10 THEN SET discount = 15;
        WHEN salesAmount >= 10 AND salesAmount <= 20 THEN SET discount = 10;
        WHEN salesAmount > 20 AND salesAmount <= 40 THEN SET discount = 5;
        ELSE SET discount = 0;
    END CASE;
    
    RETURN discount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `function_RecruitEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `function_RecruitEmployee`(PersonID int, job varchar(45)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE count_persons INT DEFAULT 0;
    
    SELECT COUNT(*) INTO count_persons
    FROM employees
    WHERE personID = PersonID;
    
    IF count_persons > 0 THEN -- check if person already exists
        RETURN 0; 
    END IF;
    
    -- insert new person to employees table
    IF job IN ('guard', 'cashier', 'cleaner', 'stock', 'salesman') THEN
        INSERT INTO employees (personID, job)
        VALUES (PersonID, job);
        RETURN 1; -- person recruited successfully
    ELSE
        RETURN -1; -- invalid job
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `function_RefillProductStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `function_RefillProductStock`(productID INT, minimalStock INT) RETURNS int
    DETERMINISTIC
BEGIN

    DECLARE checkDate DATE;
    DECLARE prod1 VARCHAR(45);
    DECLARE prod2 VARCHAR(45);
    DECLARE prod3 VARCHAR(45);
    DECLARE cat1 VARCHAR(45);
    DECLARE cat2 VARCHAR(45);
    DECLARE cat3 VARCHAR(45);
    DECLARE ProductNameToCheck VARCHAR(45);
    DECLARE ProductCategoryToCheck VARCHAR(45);
    DECLARE supplyMul INT DEFAULT 1;

    SET checkDate = DATE(NOW());
    CALL procedure_TopThreeSellingProducts(YEAR(checkDate), MONTH(checkDate), @prod1, @prod2, @prod3);
    CALL procedure_topThreeSellersCategories(YEAR(checkDate), MONTH(checkDate), @cat1, @cat2, @cat3);

    SET ProductNameToCheck = (SELECT products.name FROM products WHERE productID = productID limit 1);
    SET ProductCategoryToCheck = (SELECT categoryName FROM categories c JOIN products p ON c.categoryID = p.CategoryID WHERE p.productID = productID limit 1);

    IF ProductNameToCheck IN (@prod1, @prod2, @prod3) THEN
        SET supplyMul = supplyMul + 0.25;
    END IF;

    IF ProductCategoryToCheck IN (@cat1, @cat2, @cat3) THEN
        SET supplyMul = supplyMul + 0.25;
    END IF;

    UPDATE products SET unitsInStock = (minimalStock * supplyMul) WHERE products.productID = productID;

	SET minimalStock = minimalStock*supplyMul;
    RETURN minimalStock;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `function_YearlyProfit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `function_YearlyProfit`(yearCheck int) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE totalProfit INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= 12 DO
        SET totalProfit = totalProfit + function_MonthShopProfit(i, yearCheck);
        SET i = i + 1;
    END WHILE;
    
    RETURN totalProfit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_CustomerMonthlyOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_CustomerMonthlyOrders`(IN customerID int, IN monthReport int, IN yearReport int)
BEGIN
	--
	DECLARE done INT DEFAULT FALSE;
	DECLARE orderID INT;
	DECLARE OrderDate DATE;
	DECLARE prodName VARCHAR(255);
	DECLARE price INT;
	DECLARE productAmount INT;
	
	DECLARE CustomerMonthlyCart_Cursor CURSOR FOR
	SELECT orders.orderID as 'orderID', orders.OrderDate as 'OrderDate', products.name as 'name', products.price 'price', products_orders.productAmount as 'productAmount'
	FROM orders
	JOIN products_orders ON orders.orderID = products_orders.orderID
	JOIN products ON products_orders.productID = products.productID
	WHERE orders.Customer_ID = customerID
	AND YEAR(orders.OrderDate) = yearReport
	AND MONTH(orders.OrderDate) = monthReport
	ORDER BY orders.orderID;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	DROP TABLE IF EXISTS TEMP_TABLE_CustomerMonthlyCart;    
	CREATE TABLE TEMP_TABLE_CustomerMonthlyCart(OrderID int unsigned not null, Order_Date date not null, ProductName varchar(255) not null, UnitPrice int not null, UnitAmount int not null);
    
	OPEN CustomerMonthlyCart_Cursor;
	
	CustomerMonthlyCart_loop: LOOP
		FETCH CustomerMonthlyCart_Cursor INTO orderID, OrderDate, prodName, price, productAmount;
		
		IF done THEN
			LEAVE CustomerMonthlyCart_loop;
		END IF;
		
		INSERT INTO TEMP_TABLE_CustomerMonthlyCart(OrderID, Order_Date, ProductName, UnitPrice, UnitAmount)
		VALUES(orderID, OrderDate, prodName, price, productAmount);
	END LOOP; 
	
	CLOSE CustomerMonthlyCart_Cursor;
	
	SELECT * FROM TEMP_TABLE_CustomerMonthlyCart;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_EvaluateEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_EvaluateEmployee`(in employeeID int, out salesAmount int, out empProfit int)
BEGIN
    SELECT COUNT(o.orderID) INTO salesAmount
    FROM orders o
    WHERE o.employeeID = employeeID;
    
    SELECT SUM((p.price - p.shopPrice) * po.productAmount) INTO empProfit
    FROM orders o
    JOIN products_orders po ON o.orderID = po.orderID
    JOIN products p ON po.productID = p.productID
    WHERE o.employeeID = employeeID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_GetProportionProductsSales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_GetProportionProductsSales`()
BEGIN
DECLARE finished INTEGER DEFAULT 0;
Declare prodName varchar(45) default "";
Declare prodSales Int default 0;
Declare prodStock int default 0;
Declare curProdName CURSOR FOR 
select name from products;

DECLARE CONTINUE HANDLER
FOR NOT FOUND SET finished = 1;
open curProdName;

getProportion: LOOP
	FETCH curProdName INTO prodName;
	set prodSales = function_GetProductSales(prodName, 2022, 6);
    select unitsInStock into prodStock from products where name = prodName;
    select prodName, prodSales/(prodStock+prodSales);
	IF finished = 1 THEN
		LEAVE getProportion;
	END IF;
END LOOP getProportion;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_OrderDiscount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_OrderDiscount`(IN orderID INT, IN orderDate DATE, OUT discountedPrice DECIMAL(10,2))
BEGIN
    DECLARE totalPrice DECIMAL(10,2) DEFAULT 0;
    DECLARE productPrice DECIMAL(10,2) DEFAULT 0;
    DECLARE productAmount INT DEFAULT 0;
    DECLARE productDiscount DECIMAL(10,2) DEFAULT 0;
    DECLARE customerID INT;
    DECLARE done INT DEFAULT FALSE;
    
    -- Loop over each product in the order and apply its respective discount percentage
    DECLARE prodctAvailableDiscount_Cursor CURSOR FOR 
        SELECT p.Price, po.ProductAmount, function_ProductAvailableDiscount(p.name, YEAR(orderDate), MONTH(orderDate))
        FROM products p
        INNER JOIN products_orders po ON p.ProductID = po.ProductID
        WHERE po.OrderID = orderID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Calculate total price of the order
    
    OPEN prodctAvailableDiscount_Cursor;
    
    prodctAvailableDiscount_loop: LOOP
        FETCH prodctAvailableDiscount_Cursor INTO productPrice, productAmount, productDiscount;
        IF done THEN
            LEAVE prodctAvailableDiscount_loop;
        END IF;
        
        IF (productPrice IS NULL) THEN
            LEAVE prodctAvailableDiscount_loop;
        END IF;
        select totalPrice;
        SET totalPrice = totalPrice + ((productPrice * ((100 - productDiscount)/100)) * productAmount);
        
    END LOOP;
    
    CLOSE prodctAvailableDiscount_Cursor;
    
    #check if the customer is veteran in order to give him additional discount of 5%
    select customerID  into customerID from orders where orders.OrderID = orderID; 
    
    IF(function_IsCustomerVeteran(customerID) = 1) THEN
		SET discountedPrice = totalPrice*0.95;
    ELSE
		SET discountedPrice = totalPrice;
    END IF;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_productProp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_productProp`(in prodName Varchar(45), out prop float)
BEGIN
	declare stock int default 0;
	declare sales int default 0;
    
    select unitsInStock into stock from product where name = prodName;
    set sales = function_GetProductSales(prodName, 2022, 6);
    set prop = sales/(stock+ sales);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_PromoteEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_PromoteEmployee`(in personID int, in jobPromote varchar(45))
BEGIN

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_PromoteEmployeeToManager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_PromoteEmployeeToManager`(in personID int)
BEGIN
    DECLARE salesAmount INT;
    DECLARE empProfit INT;
    DECLARE startDate DATE;

    CALL procedure_EvaluateEmployee(personID, salesAmount, empProfit);

    SELECT startDate INTO startDate FROM employees WHERE personID = personID LIMIT 1;

    IF salesAmount > 100 AND empProfit > 5000 AND DATEDIFF(CURDATE(), startDate) > 730 THEN
        -- Update the job field to 'manager' for the employee with the given ID
        UPDATE employees SET job = 'manager' WHERE personID = personID;
        UPDATE employees SET salary = 4500 WHERE personID = personID;  
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_RecommendCustomerFromFavCat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_RecommendCustomerFromFavCat`(
    IN customerID INT, 
    IN monthCheck INT, 
    IN yearCheck INT, 
    OUT prod1 VARCHAR(45))
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE prodMaxName VARCHAR(45);
    DECLARE prodNameTemp VARCHAR(45);
    DECLARE MaxSales INT;
    DECLARE TempSales INT;
    
    DECLARE prodXCat CURSOR FOR
        SELECT products.name 
        FROM products 
        WHERE CategoryID = (
            SELECT CategoryID 
            FROM products 
            WHERE products.name = prodMaxName
        )
        AND name != prodMaxName;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET done = TRUE;
    
    CALL procedure_CustomerMonthlyOrders(customerID, monthCheck, yearCheck);
    
    SELECT temp_table_customermonthlycart.ProductName INTO prodMaxName 
    FROM temp_table_customermonthlycart 
    WHERE UnitAmount = (
        SELECT MAX(UnitAmount) 
        FROM temp_table_customermonthlycart
    );
    
    OPEN prodXCat;
    SET MaxSales = 0; # initialize MaxSales to 0
    
    prodXCat_loop: LOOP
        FETCH prodXCat INTO prodNameTemp;
        IF done THEN
            LEAVE prodXCat_loop;
        END IF;
        
        SET TempSales = function_GetProductSales(prodNameTemp, yearCheck, monthCheck);
        IF TempSales > MaxSales THEN
            SET MaxSales = TempSales;
            SET prod1 = prodNameTemp; # set new recommended product to prod1
        END IF;
    END LOOP;
    
    CLOSE prodXCat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_topThreeSellersCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_topThreeSellersCategories`(IN yearCheck INT, IN monthCheck INT, OUT cat1 VARCHAR(45), OUT cat2 VARCHAR(45) , OUT cat3 VARCHAR(45))
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE temp_category VARCHAR(45) default null;
	
    DECLARE TopCategories_Cursor CURSOR FOR 
    SELECT c.categoryName
    FROM (
        SELECT distinct productID, SUM(productAmount) AS total_amount
        FROM products_orders 
        JOIN orders ON products_orders.orderID = orders.orderID
        WHERE YEAR(orders.OrderDate) = yearCheck 
        AND MONTH(orders.OrderDate) = monthCheck
        GROUP BY productID
        ORDER BY total_amount DESC
        LIMIT 3
    ) po
    JOIN products p ON po.productID = p.productID
    JOIN categories c ON p.categoryID = c.categoryID
    GROUP BY p.categoryID;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    set cat1 = null;
	set cat2 = null;
	set cat3 = null;
    
	OPEN TopCategories_Cursor;
		TopCategories_loop : LOOP
			FETCH TopCategories_Cursor INTO temp_category;
            
		IF done THEN
			LEAVE TopCategories_loop;
		END IF;
        
        IF cat1 IS NULL THEN
			SET cat1 = temp_category;
        ELSEIF cat2 IS NULL THEN
			SET cat2 = temp_category;
		ELSE
			SET cat3 = temp_category;
		END IF;
	END LOOP;
    CLOSE TopCategories_Cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_TopThreeSellingProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_TopThreeSellingProducts`(IN yearCheck INT, IN monthCheck INT, OUT prodName1 VARCHAR(45), OUT prodName2 VARCHAR(45), OUT prodName3 VARCHAR(45))
BEGIN
	DECLARE done INT DEFAULT FALSE;
	DECLARE prodName VARCHAR(45);
	
	DECLARE TopSellingProducts_Cursor CURSOR FOR 
	SELECT p.name
	FROM products_orders po
	JOIN products p ON po.productID = p.productID
	JOIN orders o ON po.orderID = o.orderID
	WHERE YEAR(o.OrderDate) = yearCheck AND MONTH(o.OrderDate) = monthCheck
	GROUP BY po.productID
	ORDER BY SUM(po.productAmount) DESC
	LIMIT 3;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	SET prodName1 = NULL;
	SET prodName2 = NULL;
	SET prodName3 = NULL;
	
	OPEN TopSellingProducts_Cursor;
	
	TopSellingProducts_loop: LOOP
		FETCH TopSellingProducts_Cursor INTO prodName;
		
		IF done THEN
			LEAVE TopSellingProducts_loop;
		END IF;
		
		IF prodName1 IS NULL THEN
			SET prodName1 = prodName;
		ELSEIF prodName2 IS NULL THEN
			SET prodName2 = prodName;
		ELSEIF prodName3 IS NULL THEN
			SET prodName3 = prodName;
		END IF;
	END LOOP; 
	
	CLOSE TopSellingProducts_Cursor;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 13:23:14
