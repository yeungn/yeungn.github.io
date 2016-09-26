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