# Day 04 - Piscine SQL

## _Snapshots, virtual tables… What is going on?_

Resume: Today you will see how to use a virtual view and physical snapshot of data.

## Exercise 00 - Let’s create separated views for persons

| Exercise 00: Let’s create separated views for persons |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex00                                                                                                                     |
| Files to turn-in                      | `day04_ex00.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please create 2 Database Views (with similar attributes as the original table) based on a simple filtering by gender of persons. Set the corresponding names for the database views: `v_persons_female` and `v_persons_male`.

## Chapter V
## Exercise 01 - From parts to common view

| Exercise 01: From parts to common view|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex01                                                                                                                     |
| Files to turn-in                      | `day04_ex01.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please use 2 Database Views from Exercise #00 and write SQL to get female and male person names in one list. Please specify the order by person name. The sample data is shown below.

| name |
| ------ |
| Andrey |
| Anna |
| ... |


## Chapter VI
## Exercise 02 - "Store" generated dates in one place

| Exercise 02: "Store" generated dates in one place|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex02                                                                                                                     |
| Files to turn-in                      | `day04_ex02.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| SQL Syntax Construction                        | `generate_series(...)`                                                                                              |

Please create a Database View (with name `v_generated_dates`) which should "store" generated dates from January 1st to January 31st, 2022 in type DATE. Don't forget the order of the generated_date column.

| generated_date |
| ------ |
| 2022-01-01 |
| 2022-01-02 |
| ... |


## Chapter VII
## Exercise 03 - Find missing visit days with Database View

| Exercise 03: Find missing visit days with Database View |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex03                                                                                                                     |
| Files to turn-in                      | `day04_ex03.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |


Write a SQL statement that returns missing days for people's visits in January 2022. Use the `v_generated_dates` view for this task and sort the result by the missing_date column. The sample data is shown below.

| missing_date |
| ------ |
| 2022-01-11 |
| 2022-01-12 |
| ... |

## Chapter VIII
## Exercise 04 - Let’s find something from Set Theory


| Exercise 04: Let’s find something from Set Theory |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex04                                                                                                                     |
| Files to turn-in                      | `day04_ex04.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Write an SQL statement that satisfies the formula `(R - S)∪(S - R)` .
Where R is the `person_visits` table with a filter through January 2, 2022, S is also the `person_visits` table but with a different filter through January 6, 2022. Please do your calculations with sets under the `person_id` column and this column will be alone in a result. Please sort the result by the `person_id` column and present your final SQL in the `v_symmetric_union` (*) database view.

(*) To be honest, the definition of "symmetric union" doesn't exist in set theory. This is the author's interpretation, the main idea is based on the existing rule of symmetric difference.



## Chapter IX
## Exercise 05 - Let’s calculate a discount price for each person


| Exercise 05: Let’s calculate a discount price for each person |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex05                                                                                                                     |
| Files to turn-in                      | `day04_ex05.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please create a Database View `v_price_with_discount` that returns the orders of a person with person name, pizza name, real price and calculated column `discount_price` (with applied 10% discount and satisfying formula `price - price*0.1`). Please sort the result by person names and pizza names and convert the `discount_price` column to integer type. See a sample result below.


| name |  pizza_name | price | discount_price |
| ------ | ------ | ------ | ------ | 
| Andrey | cheese pizza | 800 | 720 | 
| Andrey | mushroom pizza | 1100 | 990 |
| ... | ... | ... | ... |




## Chapter X
## Exercise 06 - Materialization from virtualization


| Exercise 06: Materialization from virtualization |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex06                                                                                                                     |
| Files to turn-in                      | `day04_ex06.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please create a Materialized View `mv_dmitriy_visits_and_eats` (with data included) based on the SQL statement that finds the name of the pizzeria where Dmitriy visited on January 8, 2022 and could eat pizzas for less than 800 rubles (this SQL can be found at Day #02 Exercise #07). 

To check yourself, you can write SQL to the Materialized View `mv_dmitriy_visits_and_eats` and compare the results with your previous query.


## Chapter XI
## Exercise 07 - Refresh our state


| Exercise 07: Refresh our state|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex07                                                                                                                     |
| Files to turn-in                      | `day04_ex07.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| **Denied**                               |                                                                                                                          |
| SQL Syntax Pattern                        | Don’t use direct numbers for identifiers of Primary Key, person and pizzeria                                                                                               |

Let's refresh the data in our Materialized View `mv_dmitriy_visits_and_eats` from Exercise #06. Before this action, please create another Dmitriy visit that satisfies the SQL clause of the Materialized View except pizzeria, which we can see in a result from Exercise #06.
After adding a new visit, please update a data state for `mv_dmitriy_visits_and_eats`.

## Chapter XII
## Exercise 08 - Just clear our database


| Exercise 08: Just clear our database |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex08                                                                                                                     |
| Files to turn-in                      | `day04_ex08.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |           

After all our exercises, we have a couple of Virtual Tables and a Materialized View. Let's drop them!


