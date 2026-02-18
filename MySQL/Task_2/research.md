# Please Focus !! 
### Today we must answer these questions:
### 1. What is the difference between a DBMS and an RDBMS?

---

### **DBMS (Database Management System):**
DBMS is the basic system used to manage and store data in different formats, like simple files. 
* **The Main Issue:** We don't have any relations between the data. 
* **Analogy:** It is just like the "File System" on my PC or any other PC where you store information in separate files, but they don't "talk" to each other.
* **Key Point:** It doesn't support the "Relational" concept, which means data redundancy (repetition) is very common here.

---

### **RDBMS (Relational Database Management System):**
RDBMS is the modern and advanced version of DBMS. The "R" stands for **Relational**.
* **The Structure:** It stores data in organized **Tables** (Rows and Columns).
* **Relationships:** Unlike a normal DBMS, it uses **Primary Keys** and **Foreign Keys** to create strong relations between tables.
* **Normalization:** It follows normalization rules to make sure there is no unnecessary repetition of data.
* **Integrity:** It is much more secure and maintains data integrity better than a standard DBMS.
* **Examples:** MySQL, PostgreSQL, and SQL Server.
____
### The difference betweenDDL And DMl ? 
### 1. DDL (Data Definition Language)
**Focus!** We use DDL to build or change the **structure** of the database itself. We don't deal with the actual data (records) here; we only deal with the "Container" or the "Schema."

* **What it does:** It defines the rules and the shape of the database (Tables, Columns, Data Types).
* **CommandsLike:**
    * `CREATE`: To build a new database or table.
  
  ### 1. DML (Data Manipulation Language)
**Focus!** This is **special** in Data. After we build the structure using DDL, we use DML to work with the actual information inside the column"

* **What it does:** It allows you to deal with the values (rows). You can add, change, or remove the data itself..
* **CommandsLike:**
    * `INSERT`: To add new values/rows into the table.
  
  ____

  # Why Normalization is Crucial for UniCore System

### Please Focus !!
In a big system like **UniCore**, we deal with a lot of data: Students, Courses, Professors, Departments, and Grades. If we put all this in one table, the system will crash or give wrong data.

---

### 1. Eliminating Data Redundancy (Saving Space)
In UniCore, a student might register for 6 courses. 
* **The Problem:** Without Normalization, we would repeat the student’s Name, Phone, and Address 6 times in the database.
* **The Solution:** We store the student info once in a `Students` table and just use their `Student_ID` in other tables. This saves huge disk space as the system grows.

### 2. Preventing Update Anomalies (Data Accuracy)
Imagine a Professor in UniCore changes their office building.
* **The Problem:** If the professor's info is repeated in every "Course" row, you have to update it in 100 places. If you miss one, the system will show the professor in two different buildings!
* **The Solution:** With **3NF**, we have a separate `Departments` table. You change the building once, and it reflects everywhere.



### 3. Handling Multi-valued Attributes (The Phone Problem)
Students often have more than one phone number (Orange, Vodafone, etc.).
* **The Problem:** Putting two numbers in one cell makes it impossible to search for a specific number.
* **The Solution (1NF):** We create a `Student_Phones` table. This makes the database "Atomic" and very easy to query.


