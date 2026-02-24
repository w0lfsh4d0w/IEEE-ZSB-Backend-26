## UNION vs UNION ALL:

#### First, we use both of them to merge the result sets.

### But the difference between them is in dealing with duplicate data:

### Look! 
* **UNION**: Merges the results but it **removes duplicates**.
* **UNION ALL**: Doesn't do that; it **merges data only**.

### Which leads to:
The performance of **UNION ALL** is better because **UNION** performs **(Sorting/Hashing)** to search for duplicates and remove them.
___
## Subquery vs JOIN:

### Why we preffered join insted if subquery:

* **First thing in performance:**
    Join plan to connect before excution by indexing.

* **2nd in the resorceutilization:**
    Join deal with data directly lead to save ram, but the subquery put the result of sub query in cache and main query deal with it.

* **3d Join is simple and standar for all porgrammers:**
    But subquery in the real projects may be complicated to under stand.