# task3-SQL-Internship

# Inventory Management using Stored Procedures

## 📌 Objective
Automate inventory operations such as adding products, updating stock, and processing sales using SQL stored procedures.

## 🛠️ Tools
- MySQL (tested on 8.x)
- SQL Server/PostgreSQL equivalent syntax can be adapted

## 🚀 Procedures Implemented
1. **AddProduct** → Add new product into inventory  
2. **UpdateStock** → Increase/decrease stock quantity  
3. **ProcessSale** → Deduct stock after sale with validation  

## 🔍 Sample Execution
```sql
CALL AddProduct('Laptop', 50, 60000.00);
CALL UpdateStock(1, 20);
CALL ProcessSale(1, 10, @status);
SELECT @status;

## 🔍 Outcome
<img width="194" height="65" alt="image" src="https://github.com/user-attachments/assets/52b0a01a-59d3-4ed0-ab19-f9ccb8241e79" />
