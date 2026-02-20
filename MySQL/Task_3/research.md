# Please Focus !! 
### Today we must answer these questions:

---

### 1. WHERE vs. HAVING: The Filter Battle
**Focus!** Both are used to filter data, but the "Timing" is what matters.
* **The Main Issue:** Where do we filter?
* **WHERE:** It filters the **Rows** BEFORE any grouping happens. It looks at the raw data in the table.
* **HAVING:** It filters the **Groups** AFTER the GROUP BY clause is done.
* **Key Point:** You can't use Aggregate functions (like SUM or COUNT) with WHERE, but you must use them with HAVING.

**Example:**
SELECT department_id, COUNT(employee_id)
FROM employees
WHERE salary > 5000              -- Filtering Rows
GROUP BY department_id
HAVING COUNT(employee_id) > 5;   -- Filtering Groups

---

### 2. DELETE vs. TRUNCATE vs. DROP
**Focus!** We have three ways to remove things, but the "Power" and "Effect" are different:
* **DELETE:** (DML) It removes specific rows using WHERE. The structure stays. **Rollback: YES** (You can undo it).
* **TRUNCATE:** (DDL) It wipes the entire table but keeps the structure. It is faster. **Rollback: NO**.
* **DROP:** (DDL) It deletes the structure and the data together. **Rollback: NO**.

---

### 3. Order of Execution
**Focus!** SQL is not read from top to bottom. The Database Engine has its own "Logical Order":
1. **FROM / JOIN:** Where is the data coming from?
2. **WHERE:** Filter the base rows.
3. **GROUP BY:** Organize rows into groups.
4. **HAVING:** Filter those groups.
5. **SELECT:** Choose which columns to show.
6. **ORDER BY:** Sort the final result.

---

### 4. COUNT(*) vs. COUNT(Column_Name)
**Focus!** They look the same but they treat **NULL** values differently:
* **COUNT(*):** It counts **Every Single Row** in the table, even if it has NULLs.
* **COUNT(Column_Name):** It ONLY counts rows where the column is **NOT NULL**. It ignores any empty values.

---

### 5. CHAR vs. VARCHAR: Storage Management
**Focus!** It is all about how they manage the storage space.
* **The Example (Storing "Cat"):** * **CHAR(10):** Fixed length. It will store "Cat" + 7 empty spaces to fill the 10. (Waste of space).
    * **VARCHAR(10):** Variable length. It will store "Cat" only and use space for 3 letters. (More efficient).

---