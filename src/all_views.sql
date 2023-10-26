show databases;
use transactionexample;

drop view if exists v_today;

create view v_today as select current_date;

create or replace view v_today (today) as select current_date();

ALTER VIEW v_today AS SELECT current_date();

select * from v_today;

describe v_today;