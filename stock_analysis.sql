# commands for creating schema- Create schema assignment;


update bajaj_auto
SET `Date`=str_to_date(Date,'%d-%M-%Y');

update eicher_motors
SET `Date`=str_to_date(Date,'%d-%M-%Y');                             #Changing the datatype of date columns in all the tables

update hero_motocorp
SET `Date`=str_to_date(Date,'%d-%M-%Y');

update infosys
SET `Date`=str_to_date(Date,'%d-%M-%Y');

update tcs
SET `Date`=str_to_date(Date,'%d-%M-%Y');

update tvs_motors
SET `Date`=str_to_date(Date,'%d-%M-%Y');


create table bajaj1 as                   # Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA.
with bajaj_auto (`Date`, `Close Price`, RowNumber, MA20, MA50)
AS
(
SELECT `Date`,                         
`Close Price`,																	# Calculating  Moving average 
ROW_NUMBER() OVER (ORDER BY `Date` ASC) RowNumber,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM bajaj_auto
)																												
SELECT `Date`,                        
       RowNumber,
       `Close Price`,
       IF(RowNumber > 19, MA20, NULL) `20 Day Ma`,              # 1st 19 rows - Null
       IF(RowNumber > 49, MA50, NULL) `50 Day MA`               # 1st 49 rows - Null
From bajaj_auto
order by `Date`;

Alter table bajaj1
drop RowNumber;

select * from bajaj1;


 # Create a new table named 'eicher1' containing the date, close price, 20 Day MA and 50 Day MA.

create table eicher1 as                 
with eicher_motors (`Date`, `Close Price`, RowNumber, MA20, MA50)
AS
(
SELECT `Date`,                         
`Close Price`,																	# Calculating  Moving average 
ROW_NUMBER() OVER (ORDER BY `Date` ASC) RowNumber,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM eicher_motors
)																												
SELECT `Date`,                        
       RowNumber,
       `Close Price`,
       IF(RowNumber > 19, MA20, NULL) `20 Day Ma`,              # 1st 19 rows - Null
       IF(RowNumber > 49, MA50, NULL) `50 Day MA`               # 1st 49 rows - Null
From eicher_motors
order by `Date`;

Alter table eicher1
drop RowNumber;

select * from eicher1;

 # Create a new table named 'hero1' containing the date, close price, 20 Day MA and 50 Day MA.

create table hero1 as                 
with hero_motocorp (`Date`, `Close Price`, RowNumber, MA20, MA50)
AS
(
SELECT `Date`,                         
`Close Price`,																	# Calculating  Moving average 
ROW_NUMBER() OVER (ORDER BY `Date` ASC) RowNumber,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM hero_motocorp
)																												
SELECT `Date`,                        
       RowNumber,
       `Close Price`,
       IF(RowNumber > 19, MA20, NULL) `20 Day Ma`,              # 1st 19 rows - Null
       IF(RowNumber > 49, MA50, NULL) `50 Day MA`               # 1st 49 rows - Null
From hero_motocorp
order by `Date`;

Alter table hero1
drop RowNumber;

select * from hero1;

    # Create a new table named 'infosys1' containing the date, close price, 20 Day MA and 50 Day MA.

create table infosys1 as              
with infosys (`Date`, `Close Price`, RowNumber, MA20, MA50)
AS
(
SELECT `Date`,                         
`Close Price`,																	# Calculating  Moving average 
ROW_NUMBER() OVER (ORDER BY `Date` ASC) RowNumber,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM infosys
)																												
SELECT `Date`,                        
       RowNumber,
       `Close Price`,
       IF(RowNumber > 19, MA20, NULL) `20 Day Ma`,              # 1st 19 rows - Null
       IF(RowNumber > 49, MA50, NULL) `50 Day MA`               # 1st 49 rows - Null
From infosys
order by `Date`;

Alter table infosys1
drop RowNumber;

select * from infosys1;


# Create a new table named 'tcs1' containing the date, close price, 20 Day MA and 50 Day MA.

create table tcs1 as                   
with tcs (`Date`, `Close Price`, RowNumber, MA20, MA50)
AS
(
SELECT `Date`,                         
`Close Price`,																	# Calculating  Moving average 
ROW_NUMBER() OVER (ORDER BY `Date` ASC) RowNumber,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM tcs
)																												
SELECT `Date`,                        
       RowNumber,
       `Close Price`,
       IF(RowNumber > 19, MA20, NULL) `20 Day Ma`,              # 1st 19 rows - Null
       IF(RowNumber > 49, MA50, NULL) `50 Day MA`               # 1st 49 rows - Null
From tcs
order by `Date`;

Alter table tcs1
drop RowNumber;

select * from tcs1;

 # Create a new table named 'tvs1' containing the date, close price, 20 Day MA and 50 Day MA.


create table tvs1 as                  
with tvs_motors (`Date`, `Close Price`, RowNumber, MA20, MA50)
AS
(
SELECT `Date`,                         
`Close Price`,																	# Calculating  Moving average 
ROW_NUMBER() OVER (ORDER BY `Date` ASC) RowNumber,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 19 PRECEDING) AS `20 Day MA`,
AVG(`Close Price`) OVER (ORDER BY `Date` ASC ROWS 49 PRECEDING) AS `50 Day MA`
FROM tvs_motors
)																												
SELECT `Date`,                        
       RowNumber,
       `Close Price`,
       IF(RowNumber > 19, MA20, NULL) `20 Day Ma`,              # 1st 19 rows - Null
       IF(RowNumber > 49, MA50, NULL) `50 Day MA`               # 1st 49 rows - Null
From tvs_motors
order by `Date`;

Alter table tvs1
drop RowNumber;

select * from tvs1;


#  Use the table created in Part(1) to generate buy and sell signal. Store this in another table named 'bajaj2'.
# i) bajaj1: 

create table bajaj2 as
SELECT `Date`,
`Close Price`,
CASE
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` > `50 Day MA` THEN 'Buy'        # Checking Buy or Sell after 49 rows( because of 50 day MA)
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` < `50 Day MA` THEN 'Sell'
ELSE 'Hold'
END as `Signal`
FROM bajaj1;

select * from bajaj2;


# ii) eicher2:

create table eicher2 as
SELECT `Date`,
`Close Price`,
CASE
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` > `50 Day MA` THEN 'Buy'        # Checking Buy or Sell after 49 rows( because of 50 day MA)
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` < `50 Day MA` THEN 'Sell'
ELSE 'Hold'
END as `Signal`
FROM eicher1;

select * from eicher2;

# iii) hero2:

create table hero2 as
SELECT `Date`,
`Close Price`,
CASE
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` > `50 Day MA` THEN 'Buy'        # Checking Buy or Sell after 49 rows( because of 50 day MA)
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` < `50 Day MA` THEN 'Sell'
ELSE 'Hold'
END as `Signal`
FROM hero1;

select * from hero2;

#iv) infosys2:

create table infosys2 as
SELECT `Date`,
`Close Price`,
CASE
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` > `50 Day MA` THEN 'Buy'        # Checking Buy or Sell after 49 rows( because of 50 day MA)
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` < `50 Day MA` THEN 'Sell'
ELSE 'Hold'
END as `Signal`
FROM infosys1;

select * from hero2;

#v) tcs2:

create table tcs2 as
SELECT `Date`,
`Close Price`,
CASE
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` > `50 Day MA` THEN 'Buy'        # Checking Buy or Sell after 49 rows( because of 50 day MA)
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` < `50 Day MA` THEN 'Sell'
ELSE 'Hold'
END as `Signal`
FROM tcs1;

select * from tcs2;

# vi) tvs2:

create table tvs2 as
SELECT `Date`,
`Close Price`,
CASE
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` > `50 Day MA` THEN 'Buy'        # Checking Buy or Sell after 49 rows( because of 50 day MA)
WHEN ROW_NUMBER() OVER (ORDER BY `Date` ASC)>49 and `20 Day MA` < `50 Day MA` THEN 'Sell'
ELSE 'Hold'
END as `Signal`
FROM tvs1;

select * from tvs2;


# Create a master table containing the date and close price of all the six stocks.(Column header for the price is the name of the stock)


create table  master_abc
select b.`Date`, b.`Close Price` as Bajaj , e.`Close Price` as Eicher , h.`Close Price` as Hero, i.`Close Price` as Infosys, t.`Close Price` as TCS, tv.`Close Price` as TVS
from bajaj_auto as b inner join eicher_motors as e on b.`Date`=e.`Date` inner join hero_motocorp as h on h.`Date`=e.`Date` inner join infosys as i on i.`Date`=e.`Date` inner join tcs as t on t.`Date`=i.`Date` inner join tvs_motors as tv on tv.`Date`=t.`Date`
order by b.`Date`;

select * from master_abc;


 

#Create a User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock.

DELIMITER //

CREATE FUNCTION sig(date1 date) returns char(50) deterministic
BEGIN 
  RETURN (select `Signal` from bajaj2 where date1=`Date`);
END 

//

DELIMITER ;
select * from bajaj2;
select sig("2015-04-27") from bajaj2;