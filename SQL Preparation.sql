--	Data Definition Language (DDL)
--	1. Create database
--		syntax :
--		create database store;

--	2. Create table
--		syntax :
--	create table customers (
--		customer_key int not null,
--		gender varchar(10),
--		name varchar(50) not null,
--		city varchar(50),
--		state_code varchar(50),
--		state varchar(50),
--		zip_code varchar(20),
--		country varchar(50),
--		continent varchar(50),
--		birthday varchar(50),
--		primary key (customer_key)
--		) engine = innodb;

--	create table products (
--		product_key int not null,
--		product_name varchar(100),
--		brand varchar(50),
--		color varchar(50),
--		unit_cost_USD double,
--		unit_price_USD double,
--		subcategory_key int,
--		subcategory varchar(50),
--		category_key int,
--		category varchar(50),
--		primary key (product_key)
--		) engine = innodb;

--	create table sales (
--		id int not null auto_increment,
--		order_number int,
--		line_item int,
--		order_date date,
--		customer_key int,
--		store_key int,
--		product_key int,
--		quantity int,
--		primary key (id),
--		constraint fk_sales_customers
--		foreign key (customer_key) references customers (customer_key),
--		constraint fk_sales_product
--		foreign key (product_key) references products (product_key)
--		) engine = innodb;

--	3. Alter table
--		a. Add column
--			syntax :
--			alter table "table_name"
--			add column "column_name" "data_type";
--		b. Drop column
--			syntax :
--			alter table "table_name"
--			drop column "column_name";
--		c. Modify data type
--			syntax :
--			alter table "table_name"
--			modify "column_name" "new_data_type";
--		d. Rename column
--			syntax :
--			alter table "table_name"
--			rename column "column_name" to "new_column_name";
--		e. Add constraint
--			syntax :
--			alter table "table_name"
--			add constraint column_name check condition
--	4. Truncate 
--		syntax :
--		truncate table "table_name";

--	Data Manipulation Language (DML)
--	1. insert data
--		syntax :
--		insert into customers (customer_key, gender, name, city, state_code, state, zip_code, country, continent, birthday)
--			values
--				(301, 'Female', 'Lilly Harding', 'WANDEARAH EAST', 'SA', 'South Australia', '5523', 'Australia', 'Australia', '7/3/1939'),
--				(325, 'Female', 'Madison Hull', 'MOUNT BUDD', 'WA', 'Western Australia', '6522', 'Australia', 'Australia', '9/27/1979');

--		syntax :
--		insert into products (product_key, product_name, brand, color, unit_cost_USD, unit_price_USD, subcategory_key, subcategory, category_key, category)
--			values
--				(1, 'Contoso 512MB MP3 Player E51 Silver', 'Contoso', 'Silver', 6.62, 12.99, 101, 'MP4&MP3', 1, 'Audio'),
--				(2, 'Contoso 512MB MP3 Player E51 Blue', 'Contoso', 'Blue', 6.62, 12.99, 101, 'MP4&MP3', 1, 'Audio');

--		syntax :
--		insert into sales (order_number, line_item, order_date, customer_key, store_key, product_key, quantity)
--			values
--				(383002, 1, '2016-01-18', 1650783, 57, 1145, 1),
--				(397003, 1, '2016-02-01', 760816, 29, 955, 1);

--	2. Update data
--		syntax :
--		update products
--			set color = 'Black'
--				where product_key = 1;

--	3. Delete data
--		syntax :
--		delete from products
--			where product_key = 1;

-- Data Query Language (DQL)
--	1. Select
--		syntax :
--		select * from customers;


