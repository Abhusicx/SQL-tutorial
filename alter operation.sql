USE temp

Create table bankaccount(
	id int primary key,
    name varchar(255) UNIQUE, 
    balance int not null default 0
);

select * from bankaccount;

alter table bankaccount ADD interest float not null default 0;

alter table bankaccount modify interest float not null default 0;

Desc bankaccount;

alter table bankaccount change column interest saving_interest float not null default 0;

alter table bankaccount drop column saving_interest;

alter table bankaccount rename to account_details;