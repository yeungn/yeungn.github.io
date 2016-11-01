---
layout: page
title: sql
permalink: /sql/
date:   2016-09-23
---


Basics

`which sql` if installed shows the location of the sqlite3
`sqlite3 test_sqlite.db` open a new file called `test_sqlite3.db`
`create table test_table(id);` creates a new table in db
`.quit` to exit

`sqlite3 pets_database.db`

```
CREATE TABLE cats (
  id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER
);
```

alter table

`ALTER TABLE cats ADD COLUMN breed TEXT;`

.header on       # output the name of each column
.mode column     # now we are in column mode, enabling us to run the next two .width commands
.width auto      # adjusts and normalizes column width
# or
.width NUM1, NUM2 # customize column width

Inner Join 
# Select column_name(s) FROM first_table INNER JOIN second_table ON first_table.column_name=second_table.column_name;

Left Join
Left Outer Join
Right Join
Right outer Join
FUll Outer Join

grouping and sorting
