CREATE Database Inventory;
use Inventory;

-- Sample Product table		
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    stock INT,
    price DECIMAL(10,2)
);
-- Procedure to add a new Product
DELIMITER //
CREATE PROCEDURE AddProduct(
    IN p_name VARCHAR(100),
    IN p_stock INT,
    IN p_price DECIMAL(10,2)
)
BEGIN
    INSERT INTO Products(product_name, stock, price)
    VALUES (p_name, p_stock, p_price);
END //
DELIMITER ;

-- Procedure to Update Stock
DELIMITER //
CREATE PROCEDURE UpdateStock(
    IN p_id INT,
    IN p_qty INT
)
BEGIN
    UPDATE Products
    SET stock = stock + p_qty
    WHERE product_id = p_id;
END //
DELIMITER ;
-- Procedure to Process Sale (reduce stock + error handling)
DELIMITER //

CREATE PROCEDURE ProcessSale(
    IN p_id INT,
    IN p_qty INT,
    OUT p_status VARCHAR(50)
)
BEGIN
    DECLARE current_stock INT;

    -- Get current stock
    SELECT stock INTO current_stock
    FROM Products
    WHERE product_id = p_id;

    -- Logic for stock validation
    IF current_stock IS NULL THEN
        SET p_status = 'Product not found';
    ELSEIF current_stock < p_qty THEN
        SET p_status = 'Insufficient stock';
    ELSE
        UPDATE Products
        SET stock = stock - p_qty
        WHERE product_id = p_id;
        SET p_status = 'Sale processed successfully';
    END IF;
END //

DELIMITER ;


DELIMITER //
CREATE PROCEDURE ProcessSale(
    IN p_id INT,
    IN p_qty INT,
    OUT p_status VARCHAR(50)
)
BEGIN
    DECLARE current_stock INT;

    SELECT stock INTO current_stock
    FROM Products
    WHERE product_id = p_id;

    IF current_stock IS NULL THEN
        SET p_status = 'Product not found';
    ELSEIF current_stock < p_qty THEN
        SET p_status = 'Insufficient stock';
    ELSE
        UPDATE Products
        SET stock = stock - p_qty
        WHERE product_id = p_id;
        SET p_status = 'Sale processed successfully';
    END IF;
END //
DELIMITER ;
-- Sample Execution
-- Add products
CALL AddProduct('Laptop', 50, 60000.00);
CALL AddProduct('Phone', 100, 20000.00);

-- Increase stock
CALL UpdateStock(1, 20);

-- Process Sale
CALL ProcessSale(1, 10, @status);
SELECT @status;

-- Check result

