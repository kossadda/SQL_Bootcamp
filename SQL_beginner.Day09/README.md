# Day 09 - Piscine SQL

## _RDBMS is not just a tables_

Resume: Today you will see how to create and use functional blocks in Databases.

## Exercise 00 - Audit of incoming inserts

| Exercise 00: Audit of incoming inserts |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex00                                                                                                                     |
| Files to turn-in                      | `day09_ex00.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML|

We want to be stronger with data, and we don't want to lose any change events. Let's implement an audit function for the incoming changes of INSERT. 
Please create a table `person_audit` with the same structure as a person table, but please add some additional changes. Take a look at the table below with descriptions for each column.

| Column | Type | Description |
| ------ | ------ | ------ |
| created | timestamp with time zone | timestamp when a new event has been created.  Default value is a current timestamp and NOT NULL |
| type_event | char(1) | possible values I (insert), D (delete), U (update). Default value is ‘I’. NOT NULL. Add check constraint `ch_type_event` with possible values ‘I’, ‘U’ and ‘D’ |
| row_id |bigint | copy of person.id. NOT NULL |
| name |varchar | copy of person.name (no any constraints) |
| age |integer | copy of person.age (no any constraints) |
| gender |varchar | copy of person.gender (no any constraints) |
| address |varchar | copy of person.address (no any constraints) |

Actually, let’s create a Database Trigger Function with the name `fnc_trg_person_insert_audit` that should process `INSERT` DML traffic and make a copy of a new row in the person_audit table.

Just a hint, if you want to implement a PostgreSQL trigger (please read it in PostgreSQL documentation), you need to create 2 objects: Database Trigger Function and Database Trigger. 

So, please define a Database Trigger with the name `trg_person_insert_audit` with the following options:
- trigger with "FOR EACH ROW" option;
- trigger with "AFTER INSERT";
- trigger calls fnc_trg_person_insert_audit trigger function.

When you are done with the trigger objects, please issue an `INSERT` statement into the person table. 
`INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');`


## Chapter V
## Exercise 01 - Audit of incoming updates

| Exercise 01: Audit of incoming updates|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex01                                                                                                                     |
| Files to turn-in                      | `day09_ex01.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Let’s continue to implement our audit pattern for the person table. Just define a trigger `trg_person_update_audit` and corresponding trigger function `fnc_trg_person_update_audit` to handle all `UPDATE` traffic on the person table. We should save the OLD states of all attribute values.

When you are ready, apply the UPDATE statements below.

`UPDATE person SET name = 'Bulat' WHERE id = 10;`
`UPDATE person SET name = 'Damir' WHERE id = 10;`


## Chapter VI
## Exercise 02 - Audit of incoming deletes

| Exercise 02: Audit of incoming deletes|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex02                                                                                                                     |
| Files to turn-in                      | `day09_ex02.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Finally, we need to handle `DELETE` statements and make a copy of the OLD states for all attribute’s values. Please create a trigger `trg_person_delete_audit` and corresponding trigger function `fnc_trg_person_delete_audit`. 

When you are ready, use the SQL statement below.

`DELETE FROM person WHERE id = 10;`

## Chapter VII
## Exercise 03 - Generic Audit

| Exercise 03: Generic Audit |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex03                                                                                                                     |
| Files to turn-in                      | `day09_ex03.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Actually, there are 3 triggers for one `person` table. Let's merge all our logic into one main trigger called `trg_person_audit` and a new corresponding trigger function `fnc_trg_person_audit`.

In other words, all DML traffic (`INSERT`, `UPDATE`, `DELETE`) should be handled by the one function block. Please explicitly define a separate IF-ELSE block for each event (I, U, D)!

Additionally, please follow the steps below .
- to remove 3 old triggers from the person table;
- to remove 3 old trigger functions;
- to do a `TRUNCATE` (or `DELETE`) of all rows in our `person_audit` table.

When you are ready, reapply the set of DML statements.
`INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');`
`UPDATE person SET name = 'Bulat' WHERE id = 10;`
`UPDATE person SET name = 'Damir' WHERE id = 10;`
`DELETE FROM person WHERE id = 10;`


## Chapter VIII
## Exercise 04 - Database View VS Database Function


| Exercise 04: Database View VS Database Function |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex04                                                                                                                     |
| Files to turn-in                      | `day09_ex04.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

As you recall, we created 2 database views to separate data from the person tables by gender attribute. 
Please define 2 SQL functions (note, not pl/pgsql functions) with the names:
- `fnc_persons_female` (should return female persons),
- `fnc_persons_male` (should return male persons).

To check yourself and call a function, you can make a statement like this (Amazing! You can work with a function like a virtual table!):

    SELECT *
    FROM fnc_persons_male();

    SELECT *
    FROM fnc_persons_female();


## Chapter IX
## Exercise 05 - Parameterized Database Function


| Exercise 05: Parameterized Database Function|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex05                                                                                                                     |
| Files to turn-in                      | `day09_ex05.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        |  SQL, DDL, DML                                                                                               |

Looks like 2 functions from Exercise 04 need a more generic approach. Please remove these functions from the database before proceeding. 
Write a generic SQL function (note, not pl/pgsql-function) called `fnc_persons`. This function should have an `IN` parameter pgender with the default value = 'female'. 

To check yourself and call a function, you can make a statement like this (Wow! You can work with a function like with a virtual table, but with more flexibility!):

    select *
    from fnc_persons(pgender := 'male');

    select *
    from fnc_persons();


## Chapter X
## Exercise 06 - Function like a function-wrapper


| Exercise 06: Function like a function-wrapper|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex06                                                                                                                     |
| Files to turn-in                      | `day09_ex06.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Now let's look at pl/pgsql functions. 

Please create a pl/pgsql function `fnc_person_visits_and_eats_on_date` based on an SQL statement that will find the names of pizzerias that a person (`IN` pperson parameter with default value 'Dmitriy') visited and where he could buy pizza for less than the given amount in rubles (`IN` pprice parameter with default value 500) on the given date (`IN` pdate parameter with default value January 8, 2022).

To check yourself and call a function, you can make a statement like the one below.

    select *
    from fnc_person_visits_and_eats_on_date(pprice := 800);

    select *
    from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');


## Chapter XI
## Exercise 07 - Different view to find a Minimum


| Exercise 07: Different view to find a Minimum|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex07                                                                                                                     |
| Files to turn-in                      | `day09_ex07.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Please write an SQL or pl/pgsql function `func_minimum` (it is up to you) that has an input parameter that is an array of numbers and the function should return a minimum value. 

To check yourself and call a function, you can make a statement like the one below.

    SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);


## Chapter XII
## Exercise 08 - Fibonacci algorithm is in a function


| Exercise 08: Fibonacci algorithm is in a function|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex08                                                                                                                     |
| Files to turn-in                      | `day09_ex08.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | SQL, DDL, DML                                                                                              |

Write an SQL or pl/pgsql function `fnc_fibonacci` (it's up to you) that has an input parameter pstop of type integer (default is 10) and the function output is a table of all Fibonacci numbers less than pstop.

To check yourself and call a function, you can make a statement like the one below.

    select * from fnc_fibonacci(100);
    select * from fnc_fibonacci();

