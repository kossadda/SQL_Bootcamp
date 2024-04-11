# Day 03 - Piscine SQL

## _Continuing to JOIN and make change in data_

Resume: Today you will see how to change data based on DML language.

## Exercise 00 - Let’s find appropriate prices for Kate

| Exercise 00: Let’s find appropriate prices for Kate |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex00                                                                                                                     |
| Files to turn-in                      | `day03_ex00.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please write a SQL statement that returns a list of pizza names, pizza prices, pizzeria names, and visit dates for Kate and for prices ranging from 800 to 1000 rubles. Please sort by pizza, price, and pizzeria name. See a sample of the data below.

| pizza_name | price | pizzeria_name | visit_date |
| ------ | ------ | ------ | ------ |
| cheese pizza | 950 | DinoPizza | 2022-01-04 |
| pepperoni pizza | 800 | Best Pizza | 2022-01-03 |
| pepperoni pizza | 800 | DinoPizza | 2022-01-04 |
| ... | ... | ... | ... |


## Chapter V
## Exercise 01 - Let’s find forgotten menus

| Exercise 01: Let’s find forgotten menus|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex01                                                                                                                     |
| Files to turn-in                      | `day03_ex01.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| **Denied**                               |                                                                                                                          |
| SQL Syntax Construction                        | any type of `JOINs`                                                                                              |

Find all menu identifiers that are not ordered by anyone. The result should be sorted by identifier. The sample output is shown below.

| menu_id |
| ------ |
| 5 |
| 10 |
| ... |


## Chapter VI
## Exercise 02 - Let’s find forgotten pizza and pizzerias

| Exercise 02: Let’s find forgotten pizza and pizzerias|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex02                                                                                                                     |
| Files to turn-in                      | `day03_ex02.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please use the SQL statement from Exercise #01 and display the names of pizzas from the pizzeria that no one has ordered, including the corresponding prices. The result should be sorted by pizza name and price. The sample output data is shown below.

| pizza_name | price | pizzeria_name |
| ------ | ------ | ------ |
| cheese pizza | 700 | Papa Johns |
| cheese pizza | 780 | DoDo Pizza |
| ... | ... | ... |

## Chapter VII
## Exercise 03 - Let’s compare visits

| Exercise 03: Let’s compare visits |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex03                                                                                                                     |
| Files to turn-in                      | `day03_ex03.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please find pizzerias that have been visited more often by women or by men. Save duplicates for any SQL operators with sets (UNION ALL, EXCEPT ALL, INTERSECT ALL constructions). Please sort a result by the name of the pizzeria. The sample data is shown below.


| pizzeria_name | 
| ------ | 
| Best Pizza | 
| Dominos |
| ... |

## Chapter VIII
## Exercise 04 - Let’s compare orders


| Exercise 04: Let’s compare orders |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex04                                                                                                                     |
| Files to turn-in                      | `day03_ex04.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Find a union of pizzerias that have orders from either women or men. In other words, you should find a set of names of pizzerias that have been ordered only by women and make "UNION" operation with set of names of pizzerias that have been ordered only by men. Please be careful with word "only" for both genders. For all SQL operators with sets don't store duplicates (`UNION`, `EXCEPT`, `INTERSECT`).  Please sort a result by the name of the pizzeria. The sample data is shown below.


| pizzeria_name | 
| ------ | 
| Papa Johns | 

## Chapter IX
## Exercise 05 - Visited but did not make any order


| Exercise 05: Visited but did not make any order |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex05                                                                                                                     |
| Files to turn-in                      | `day03_ex05.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Write an SQL statement that returns a list of pizzerias that Andrey visited but did not order from. Please order by the name of the pizzeria. The sample data is shown below.


| pizzeria_name | 
| ------ | 
| Pizza Hut | 



## Chapter X
## Exercise 06 - Find price-similarity pizzas


| Exercise 06: Find price-similarity pizzas |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex06                                                                                                                     |
| Files to turn-in                      | `day03_ex06.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Find the same pizza names that have the same price, but from different pizzerias. Make sure that the result is ordered by pizza name. The data sample is shown below. Please make sure that your column names match the column names below.

| pizza_name | pizzeria_name_1 | pizzeria_name_2 | price |
| ------ | ------ | ------ | ------ |
| cheese pizza | Best Pizza | Papa Johns | 700 |
| ... | ... | ... | ... |

## Chapter XI
## Exercise 07 - Let’s cook a new type of pizza


| Exercise 07: Let’s cook a new type of pizza |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex07                                                                                                                     |
| Files to turn-in                      | `day03_ex07.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please register a new pizza with the name "Greek pizza" (use id = 19) with the price of 800 rubles in the restaurant "Dominos" (pizzeria_id = 2).
**Warning**: this exercise is likely to cause the modification of data in the wrong way. Actually, you can restore the original database model with data from the link in the "Rules of the day" section.


## Chapter XII
## Exercise 08 - Let’s cook a new type of pizza with more dynamics


| Exercise 08: Let’s cook a new type of pizza with more dynamics |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex08                                                                                                                     |
| Files to turn-in                      | `day03_ex08.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |           
| **Denied**                               |                                                                                                                          |
| SQL Syntax Pattern                        | Don’t use direct numbers for identifiers of Primary Key and pizzeria                                                                                               |       

Please register a new pizza with the name "Sicilian pizza" (whose id should be calculated by the formula "maximum id value + 1") with the price of 900 rubles in the restaurant "Dominos" (please use internal query to get the identifier of the pizzeria).
**Warning**: This exercise is likely to cause the modification of data in the wrong way. Actually, you can restore the original database model with data from the link in the "Rules of the day" section and replay the script from Exercise 07.


## Chapter XIII
## Exercise 09 - New pizza means new visits


| Exercise 09: New pizza means new visits |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex09                                                                                                                     |
| Files to turn-in                      | `day03_ex09.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| **Denied**                               |                                                                                                                          |
| SQL Syntax Pattern                        | Don’t use direct numbers for identifiers of Primary Key and pizzeria                                                                                               |       

Please record new visits to Domino's restaurant by Denis and Irina on February 24, 2022.
**Warning**: This exercise is likely to cause the modification of data in the wrong way. Actually, you can restore the original database model with data from the link in the "Rules of the Day" section and replay the script from Exercises 07 and 08.


## Chapter XIV
## Exercise 10 - New visits means new orders


| Exercise 10: New visits means new orders |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex10                                                                                                                     |
| Files to turn-in                      | `day03_ex10.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| **Denied**                               |                                                                                                                          |
| SQL Syntax Pattern                        | Don’t use direct numbers for identifiers of Primary Key and pizzeria                                                                                               |     


Please register new orders from Denis and Irina on February 24, 2022 for the new menu with "Sicilian Pizza".
**Warning**: This exercise will probably cause you to change data in the wrong way. Actually, you can restore the original database model with data from the link in the Rules of the Day section and replay the script from Exercises 07, 08 and 09.


## Chapter XV
## Exercise 11 - “Improve” a price for clients


| Exercise 11: “Improve” a price for clients|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex11                                                                                                                     |
| Files to turn-in                      | `day03_ex11.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
    
Please change the price of "Greek Pizza" to -10% of the current value.
**Warning**: This exercise is likely to cause you to change data in the wrong way. Actually, you can rebuild the original database model with data from the link in the "Rules of the Day" section and replay the script from Exercises 07, 08, 09, and 10.


## Chapter XVI
## Exercise 12 - New orders are coming!


| Exercise 12: New orders are coming!|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex12                                                                                                                     |
| Files to turn-in                      | `day03_ex12.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| SQL Syntax Construction                        | `generate_series(...)`                                                                                              |
| SQL Syntax Patten                        | Please use “insert-select” pattern
`INSERT INTO ... SELECT ...`|
| **Denied**                               |                                                                                                                          |
| SQL Syntax Patten                        | - Don’t use direct numbers for identifiers of Primary Key, and menu 
- Don’t use window functions like `ROW_NUMBER( )`
- Don’t use atomic `INSERT` statements |

Please register new orders of all persons for "Greek pizza" on February 25, 2022.
**Warning**: This exercise will probably cause you to change data in the wrong way. Actually, you can restore the original database model with data from the link in the "Rules of the Day" section and replay the script from Exercises 07, 08, 09, 10 and 11.


## Chapter XVII
## Exercise 13 - Money back to our customers


| Exercise 13: Money back to our customers|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex13                                                                                                                     |
| Files to turn-in                      | `day03_ex13.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
    
Write 2 SQL (DML) statements that delete all new orders from Exercise #12 based on the order date. Then delete "Greek Pizza" from the menu. 
**Warning**: This exercise is likely to cause you to modify data in the wrong way. Actually, you can rebuild the original database model with data from the link in the "Rules of the Day section" and replay the script from Exercises 07, 08, 09, 10, 11, 12, and 13.
