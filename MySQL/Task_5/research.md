# Window Functions vs GROUP BY

## Let’s start with GROUP BY

**GROUP BY** hides the details.  
We call this a change in **granularity** — it compresses similar data into one row.

## Window Functions

**Window functions** keep the granularity.  
They perform calculations without compressing all rows.  
They keep the original rows and show the new result in a column beside them.
___
# Clustered vs Non-Clustered Indexes

## The Difference Between Them (Leaf Node Level)

The main difference appears in the **leaf node**:

- In a **Clustered Index**, the leaf node contains the **actual data**
- In a **Non-Clustered Index**, the leaf node does **not** contain the actual data.  
  Instead, it contains the **index key** and a pointer to the data

The pointer is a physical address called a **RID (Row Identifier)** 
It is used to locate the actual data inside the data pages

## Why Only One Clustered Index?

A table can have **only one clustered index** because:

- A clustered index defines the **physical ordering** of the data
- Physical data can only be arranged in **one way** on disk
- It is not logically possible to physically order the same data in multiple different ways at the same time.
____
# Filtered & Unique Indexes

## Filtered Index

A **Filtered Index** makes the index include only rows that meet a specific condition.  

It is useful for query optimization because when you search in a small B-Tree, it is better.  
Storing a small amount of data has less impact on storage.

---

## Unique Index

When I put a **Unique Index** on the email column:

Normally, the insert is slow because it **checks for duplication** and does index maintenance.  

But in the SELECT, it is fast because of the **early stop** — when it finds the data, it is sure it does not exist again.  

And the **B-Tree is arranged alphabetically**, which makes access to the data fast.
___
# Choosing the Right Index

In this case, I will choose the **Heap** because it has very fast inserts.  
It adds the data in the first free space and does not do page splits for arranging data.

If you want to read all the data at once, the **Heap** is better in this case because it reads pages by their **physical address** and does not walk through a B-Tree.

When you delete all the data, it is also better because it does not need to rearrange a B-Tree after dropping data.
___

# Atomicity — All or Nothing

**Atomicity** means *all or nothing*.  

The meaning of that is: all the commands in the transaction are done, or none of them are done.

- If all commands are completed successfully, the transaction is **committed**.
- If one of them is not completed, all of them are canceled — this is called a **rollback**.
- If a partial failure occurs, the transaction must roll back.

Without using a transaction, this is a terrible thing.

It is like sending money to someone:
- If the first command is done and your cash decreases,
- And something happens before the second process (like a system failure),
- The money does not go to the other person, and their balance does not increase.