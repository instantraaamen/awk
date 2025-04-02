# awk

## What does the awk command mean?

The name awk comes from the initials of its three creators: **Alfred Aho**, **Peter Weinberger**, and **Brian Kernighan**.

awk is a powerful text-processing tool used in Unix/Linux environments. It is especially useful for manipulating column-based data,


## Examples:

1. Extracting a specific column
 - Prints the 2nd column of file.txt
```sh
awk '{print $2}' file.txt

# column2
# 200000
# 220000
```

2. Printing only rows that meet a condition
 - Prints rows where the 3rd column is greater than 100
```sh
awk '$3 > 290000 {print $0}' file.txt

# column3 
# 300000
# 330000
```

3. Using a custom field separator
 - Prints the 1st and 3rd columns from data.csv, using a comma as the delimiter
```sh
awk -F ',' '{print $1, $3}' data.csv

# column1 column3 
# 100000  300000
# 110000  330000
```

ex | file.txt

```sh
column1 column2 column3 
100000  200000  300000
110000  220000  330000
```

ex | data.txt

```sh
column1,column2,column3 
100000,200000,300000
110000,220000,330000
```