# Part A: The Normalization Challenge

### Step 1 (1NF): Removing Multi-valued Attributes
In this first step, we use **1NF** to split the attributes with multi-values into a separate table.
**Look!**
Our original table is: 
`Student_Grade_Report (Student_Name, Student_Phone, Student_Address, Course_Title, Instructor_Name, Instructor_Dept, Dept_Building, Grade)`

The multi-value attribute here is **Student_Phone**. We will separate it into a new table called `Student_Phones`.
Now we have two tables:
1.  **Student_Grade_Report** (_Student_Name_, _Course_Title_, Student_Address, Instructor_Name, Instructor_Dept, Dept_Building, Grade)
2.  **Student_Phones** (_Student_Name_, _Phone_Number_)

**Focus!** I removed the attribute `Student_Phone` from the first table and put it in its own table so one cell doesn't have multiple numbers.

---

### Step 2 (2NF): Removing Partial Dependencies
In this step, we look for **Partial Dependencies**. 
**What does that mean?** It means if we have a composite primary key (like Student_Name + Course_Title), and we find an attribute that depends on only **one** part of that key, this is a "Partial Dependency." We must take it and put it in a separate table.

If we look at the first table, we find **Student_Address** depends only on the `Student_Name`, not the `Course_Title`. Also, the task says it is mixed (City, Street, Zip) and repeats unnecessarily.

**We will separate it like this:**
1.  **Student_Info** (_Student_Name_, Street, City, Zip)
2.  **Course_Grades** (_Student_Name_, _Course_Title_, Instructor_Name, Instructor_Dept, Dept_Building, Grade)
3.  **Student_Phones** (_Student_Name_, _Phone_Number_)

---

### Step 3 (3NF): Removing Transitive Dependencies
In this step, we look for **Transitive Dependencies**.
**What is the meaning of that?** It means we have a "non-key" attribute depending on another "non-key" attribute.

In our `Course_Grades` table, we found that **Dept_Building** depends on **Instructor_Dept**. Neither of them is the primary key of the table! 
To reach **3NF**, we must separate them into a new Department table.

**Final 3NF Tables:**
1.  **Student_Info** (_Student_Name_, Street, City, Zip)
2.  **Student_Phones** (_Student_Name_, _Phone_Number_)
3.  **Departments** (_Instructor_Dept_, Dept_Building)
4.  **Course_Grades** (_Student_Name_, _Course_Title_, Instructor_Name, Instructor_Dept, Grade)