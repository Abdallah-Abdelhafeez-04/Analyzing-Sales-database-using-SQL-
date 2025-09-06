# Analyzing-Sales-database-using-SQL-
MS SQL Server project featuring a Sales database (SalesDB) with Customers, Products, Orders, and related tables. Includes sample data with intentional errors for data cleaning, queries for analysis, and database objects such as views, procedures, and triggers.
# 📊 MS SQL Server Sales Database Project

## 📌 Project Overview
This project is a **Microsoft SQL Server database solution** that builds a complete sales management database (`SalesDB`).  
It contains multiple tables with realistic sample data — including intentional inconsistencies to practice **data cleaning and validation**.  

The project demonstrates:
- Database design & relationships
- Data insertion with test records
- Queries for reporting and analysis
- Views, stored procedures, and functions
- Triggers and transactions for business logic

---

## 📂 Database Content

### 🧾 Tables
- **Customers** → Stores customer details (name, email, phone, city). Includes ~30 records with messy/dirty data (e.g., invalid emails, null values, inconsistent casing).  
- **Products** → Product catalog with pricing and categories.  
- **Orders** → Customer purchase records linked to products.  
- **OrderDetails** → Line items for each order.  
- **Sales** → Tracks sales transactions and totals.  

### ⚡ Features
- **Constraints**: Primary keys, foreign keys, unique, and check constraints  
- **Sample Data**: Inserted values for testing queries and procedures  
- **Queries**: SELECT, JOIN, GROUP BY, HAVING, ORDER BY  
- **Views**: Simplified access to combined data  
- **Stored Procedures**: Automating repetitive tasks (e.g., sales reports)  
- **Functions**: Reusable database logic  
- **Triggers**: Enforcing rules when inserting or updating data  
- **Transactions**: Ensuring consistency and rollback on errors  

---

## 🚀 How to Run
1. Open **SQL Server Management Studio (SSMS)**.  
2. Create a new database or use the script to generate `SalesDB`.  
3. Run the script step by step or execute the full file:
   ```sql
   :r Abdallah Abdelhafeez Saber_MS SQL Server Assignemnt Script_Solution.sql
