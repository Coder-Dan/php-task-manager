# PHP MySQLi Guide 

## Mysqli classes

* mysqli
    * Main class and interface to your mysqli database
* mysqli_​stmt
    * For handling prepared statements
* mysqli_​result
    * container for query results
* mysqli_​driver
    * provides information about the mysql server and client
* mysqli_​warning
* mysqli_​sql_​exception


## MySQLi Statement Class

Creates and process prepared statements to execute.
Using this prevents SQL injections.

## MySQli Results Class

The results class an interface you can use to view the output of sql statements and the metadata from the query.

### $current_​field
### data_​seek
### fetch_​all
### fetch_​array

`fetch_array()` function will allow you to obtain all the data rows from an SQL query.

Basically if you do `SELECT * FROM table;` and table has n rows values. You can get all of the values from each tuple in the convenience of an associative array. Nice.

it's a convenient way of any amount of data be it single tuple or many. Flexible.

Note: Field names are case-sensitive - you may incur have reference errors.

Note: returns null NO results. Also NULL sql values are set to NULL php

### fetch_​assoc
### fetch\_​field\_​direct
### fetch_​field
### fetch_​fields
### fetch_​object
### fetch_​row



### $field_​count
### field_​seek
### free
### $lengths
### $num_rows

