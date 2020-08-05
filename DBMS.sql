CREATE DATABASE IF NOT EXISTS BookstoreDatabase;
USE BookstoreDatabase;

CREATE TABLE IF NOT EXISTS Book (
    id INT PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(100),
    translator VARCHAR(50),
    publishing_name VARCHAR(50),
    publishing_year INT,
    pages INT,
    weight FLOAT,
    book_condition VARCHAR(20),
    cost FLOAT,
    storage_count INT,
    store_count INT
);

insert into Book 	(id, title, author, translator, publishing_name, publishing_year, pages, weight, book_condition, cost, storage_count, store_count)
values			 	(1000, 'big data','guy chriqui,shira levi', 'david nash', 'golight', '1992', 542, 3.2, 'new', 25, 3, 1);
insert into Book 	(id, title, author, translator, publishing_name, publishing_year, pages, weight, book_condition, cost, storage_count, store_count)
values			 	(1001, 'big data','guy chriqui,shira levi', 'david nash', 'godark', '1998', 542, 3.2, 'good', 25, 7, 5);
insert into Book 	(id, title, author, translator, publishing_name, publishing_year, pages, weight, book_condition, cost, storage_count, store_count)
values			 	(1002, 'big data','guy chriqui,shira levi', 'alemo avara', 'golight', '1992', 542, 3.2, 'medium', 25, 3, 1);
insert into Book 	(id, title, author, translator, publishing_name, publishing_year, pages, weight, book_condition, cost, storage_count, store_count)
values			 	(1003, 'small data','ori kfir', 'yam arbel', 'moonlight', '2005', 200, 1.2, 'new', 10, 0, 0);
insert into Book 	(id, title, author, translator, publishing_name, publishing_year, pages, weight, book_condition, cost, storage_count, store_count)
values			 	(1004, 'small data','ori kfir', 'yam arbel', 'moonlight', '2020', 200, 1.5, 'new', 10, 5, 7);
insert into Book 	(id, title, author, translator, publishing_name, publishing_year, pages, weight, book_condition, cost, storage_count, store_count)
values			 	(1005, 'earth','mother nature', 'spanish man', 'justlight', '1948', 70, 2, 'new like', 100, 20, 4);
insert into Book 	(id, title, author, translator, publishing_name, publishing_year, pages, weight, book_condition, cost, storage_count, store_count)
values			 	(1006, 'earth','mother nature', 'spanish man', 'moonlight', '1992', 70, 2, 'new', 100, 1, 1);
insert into Book 	(id, title, author, translator, publishing_name, publishing_year, pages, weight, book_condition, cost, storage_count, store_count)
values			 	(1007, 'earth','mother nature', 'english man', 'google', '1995', 70, 2, 'new', 100, 0, 0);
insert into Book 	(id, title, author, translator, publishing_name, publishing_year, pages, weight, book_condition, cost, storage_count, store_count)
values			 	(1008, 'just me','guy chriqui', 'hebrew man', 'israellight', '1992', 300, 3, 'new like', 30, 5, 5);
insert into Book 	(id, title, author, translator, publishing_name, publishing_year, pages, weight, book_condition, cost, storage_count, store_count)
values			 	(1009, 'just me','guy chriqui', 'hebrew man', 'israellight', '2005', 300, 3, 'new like', 30, 1, 1);


CREATE TABLE IF NOT EXISTS Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    mobile_phone VARCHAR(15),
    address VARCHAR(100),
    hour_salary FLOAT,
    still_working BOOL,
    join_date DATE,
    leave_date DATE
);

insert into Employee (id, name, mobile_phone, address, hour_salary, still_working, join_date, leave_date)
values			 	(100, 'guy chriqui', '0527895486', 'shalon 1,tel-aviv', '50', true, '2018-02-22', null);
insert into Employee (id, name, mobile_phone, address, hour_salary, still_working, join_date, leave_date)
values			 	(101, 'assaf chriqui', '0548962195', 'gol 8,tel-aviv', '25', true, '2019-10-07', null);
insert into Employee (id, name, mobile_phone, address, hour_salary, still_working, join_date, leave_date)
values			 	(102, 'noy dori', '0501485279', 'vermayze 55,tel-aviv', '27', true, '2018-04-22', null);
insert into Employee (id, name, mobile_phone, address, hour_salary, still_working, join_date, leave_date)
values			 	(103, 'noam dor', '0509547585', 'hadar 12,tel-aviv', '32', false, '2020-01-02', '2020-02-15');
insert into Employee (id, name, mobile_phone, address, hour_salary, still_working, join_date, leave_date)
values			 	(104, 'guy blum', '0541238526', 'shmakom 99,tel-aviv', '18', true, '2017-12-28', null);
insert into Employee (id, name, mobile_phone, address, hour_salary, still_working, join_date, leave_date)
values			 	(105, 'jon kim', '0524789563', 'rembranted 63,tel-aviv', '60', true, '2019-12-22', null);
insert into Employee (id, name, mobile_phone, address, hour_salary, still_working, join_date, leave_date)
values			 	(106, 'shir levi', '0524789512', 'google 456,tel-aviv', '30', false, '2017-02-22', '2018-03-07');
insert into Employee (id, name, mobile_phone, address, hour_salary, still_working, join_date, leave_date)
values			 	(107, 'chen aharon', '0503278425', 'sham 4,tel-aviv', '30', true, '2020-01-01', null);
insert into Employee (id, name, mobile_phone, address, hour_salary, still_working, join_date, leave_date)
values			 	(108, 'omer ron', '0548957895', 'ofen 123,tel-aviv', '22', true, '2018-05-11', null);
insert into Employee (id, name, mobile_phone, address, hour_salary, still_working, join_date, leave_date)
values			 	(109, 'shahar barmatz', '0503679841', 'haham 222,tel-aviv', '21', false, '2019-02-22', '2019-09-22');


CREATE TABLE IF NOT EXISTS Client (
    id_number INT PRIMARY KEY,
    name VARCHAR(50),
    mobile_phone VARCHAR(15),
    landline VARCHAR(15),
    join_date DATE
);


insert into Client  (id_number, name, mobile_phone, landline, join_date)
values			 	(203845975, 'guy shriki', '0527895486', '099375478', '2020-07-02');
insert into Client  (id_number, name, mobile_phone, landline, join_date)
values			 	(548637952, 'noam boom', '0547896352', '092135678', '2019-03-26');
insert into Client  (id_number, name, mobile_phone, landline, join_date)
values			 	(475896358, 'anat shalom', '0547895216', '039504278', '2018-01-17');
insert into Client  (id_number, name, mobile_phone, landline, join_date)
values			 	(204789587, 'or mor', '0504831054', '049504278', '2018-02-22');
insert into Client  (id_number, name, mobile_phone, landline, join_date)
values			 	(205483790, 'dor nor', '0546875218', '039504318', '2019-07-29');
insert into Client  (id_number, name, mobile_phone, landline, join_date)
values			 	(200456852, 'avi nos', '0504586521', '099511118', '2019-11-24');
insert into Client  (id_number, name, mobile_phone, landline, join_date)
values			 	(207846375, 'sam hazak', '0520458905', '095555278', '2020-04-03');
insert into Client  (id_number, name, mobile_phone, landline, join_date)
values			 	(205798515, 'lior aviel', '0540546852', '099643242', '2018-09-09');
insert into Client  (id_number, name, mobile_phone, landline, join_date)
values			 	(207419835, 'gal erez', '0523654789', '049502378', '2018-02-08');
insert into Client  (id_number, name, mobile_phone, landline, join_date)
values			 	(305874298, 'lili lala', '0544544485', '029503345', '2019-06-19');



CREATE TABLE IF NOT EXISTS Payments (
    date DATE PRIMARY KEY,
    rent FLOAT,
    property FLOAT,
    water FLOAT,
    electricity FLOAT,
    mobile_phone FLOAT,
    laneline FLOAT,
    mail FLOAT,
    xpress FLOAT,
    salaries FLOAT,
    other FLOAT
);


insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2019-12-01', 2000, 450, 700, 750, 50, 20, 456, 456, 9000, 4500);
insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2018-09-09', 2000, 450, 800, 555, 50, 20, 425, 456, 8000, 4500);
insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2019-10-01', 2000, 450, 400, 465, 50, 20, 785, 456, 10000, 4500);
insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2019-09-01', 2000, 450, 555, 785, 50, 20, 462, 456, 8500, 4500);
insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2019-08-01', 2000, 450, 222, 452, 50, 20, 785, 456, 10000, 4500);
insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2019-07-01', 2000, 450, 750, 786, 50, 20, 462, 456, 9700, 4500);
insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2019-06-01', 2000, 450, 650, 789, 50, 20, 484, 456, 7899, 4500);
insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2019-05-01', 2000, 450, 333, 456, 50, 20, 426, 456, 10000, 4500);
insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2019-04-01', 2000, 450, 777, 852, 50, 20, 785, 456, 8888, 4500);
insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2019-03-01', 2000, 450, 800, 734, 50, 20, 257, 456, 10000, 4500);
insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2019-02-01', 2000, 450, 450, 765, 50, 20, 697, 456, 9800, 4500);
insert into Payments  (date, rent, property, water, electricity, mobile_phone, laneline, mail, xpress, salaries, other)
values			 	('2019-01-01', 2000, 450, 800, 788, 50, 20, 300, 456, 10000, 4500);



CREATE TABLE IF NOT EXISTS Purchase (
    id INT PRIMARY KEY,
    client_id INT,
    employee_id INT,
    payment_method VARCHAR(50),
    date DATE
);

insert into Purchase  (id, client_id, employee_id, payment_method, date)
values				  (200, 203845975, 102, 'credit', '2017-01-01');
insert into Purchase  (id, client_id, employee_id, payment_method, date)
values				  (201, 204789587, 102, 'bit', '2019-03-26');
insert into Purchase  (id, client_id, employee_id, payment_method, date)
values				  (202, 203845975, 101, 'bank', '2018-02-08');
insert into Purchase  (id, client_id, employee_id, payment_method, date)
values				  (203, 305874298, 102, 'bit', '2019-11-11');
insert into Purchase  (id, client_id, employee_id, payment_method, date)
values				  (204, 475896358, 105, 'bit', '2020-01-21');
insert into Purchase  (id, client_id, employee_id, payment_method, date)
values				  (205, 204789587, 107, 'bit', '2019-11-15');
insert into Purchase  (id, client_id, employee_id, payment_method, date)
values				  (206, 205483790, 108, 'bank', '2017-01-08');
insert into Purchase  (id, client_id, employee_id, payment_method, date)
values				  (207, 205483790, 105, 'credit', '2018-01-02');
insert into Purchase  (id, client_id, employee_id, payment_method, date)
values				  (208, 205483790, 107, 'bank', '2019-11-05');
insert into Purchase  (id, client_id, employee_id, payment_method, date)
values				  (209, 207419835, 100, 'bit', '2020-05-09');


CREATE TABLE IF NOT EXISTS StorePurchases (
    id INT PRIMARY KEY,
    date DATE
);


insert into StorePurchases  (id, date)
values				  		(300, '2018-12-02');
insert into StorePurchases  (id, date)
values				  		(301, '2020-04-09');
insert into StorePurchases  (id, date)
values				  		(302, '2019-11-11');
insert into StorePurchases  (id, date)
values				  		(303, '2018-08-21');
insert into StorePurchases  (id, date)
values				  		(304, '2020-03-25');
insert into StorePurchases  (id, date)
values				  		(305, '2019-07-11');
insert into StorePurchases  (id, date)
values				  		(306, '2018-11-09');
insert into StorePurchases  (id, date)
values				  		(307, '2018-08-28');
insert into StorePurchases  (id, date)
values				  		(308, '2019-02-21');
insert into StorePurchases  (id, date)
values				  		(309, '2020-02-12');


CREATE TABLE IF NOT EXISTS Delivery (
    id INT PRIMARY KEY,
    method_name VARCHAR(20),
    delivery_type VARCHAR(20),
    destination VARCHAR(50),
    status VARCHAR(20),
    status_update_date DATE
);

insert into Delivery  (id, delivery_type, method_name, destination, status, status_update_date)
values				  (400, 'mail', 'mail-regular', 'shabat 15,tel-aviv', 'preparation', '2020-04-09');
insert into Delivery  (id, delivery_type, method_name, destination, status, status_update_date)
values				  (401, 'xpress', 'pickup-point', 'rishon 9,tel-aviv', 'sent', '2020-07-19');
insert into Delivery  (id, delivery_type, method_name, destination, status, status_update_date)
values				  (402, 'xpress', 'pickup', 'sheni 22,tel-aviv', 'await', '2020-07-06');
insert into Delivery  (id, delivery_type, method_name, destination, status, status_update_date)
values				  (403, 'mail', 'mail-regular', 'gola 1,tel-aviv', 'preparation', '2019-02-06');
insert into Delivery  (id, delivery_type, method_name, destination, status, status_update_date)
values				  (404, 'xpress', 'xpress-home', 'nana 36,tel-aviv', 'deliverd', '2019-03-03');
insert into Delivery  (id, delivery_type, method_name, destination, status, status_update_date)
values				  (405, 'mail', 'mail-fast', 'gol 200,tel-aviv', 'deliverd', '2019-11-16');
insert into Delivery  (id, delivery_type, method_name, destination, status, status_update_date)
values				  (406, 'xpress', 'xpress-home', 'zam 154,tel-aviv', 'deliverd', '2019-12-06');
insert into Delivery  (id, delivery_type, method_name, destination, status, status_update_date)
values				  (407, 'mail', 'mail-fast', 'hoop 59,tel-aviv', 'preparation', '2019-04-14');
insert into Delivery  (id, delivery_type, method_name, destination, status, status_update_date)
values				  (408, 'xpress', 'xpress-home', 'mola 123,tel-aviv', 'deliverd', '2019-08-27');
insert into Delivery  (id, delivery_type, method_name, destination, status, status_update_date)
values				  (409, 'mail', 'mail-fast', 'lock 198,tel-aviv', 'sent', '2019-09-06');


CREATE TABLE IF NOT EXISTS DeliveryMethod (
    name VARCHAR(50) PRIMARY KEY,
    KG_Price FLOAT
);

insert into DeliveryMethod  (name, KG_Price)
values				  ('mail-regular', 6.5);
insert into DeliveryMethod  (name, KG_Price)
values				  ('mail-fast', 10);
insert into DeliveryMethod  (name, KG_Price)
values				  ('pickup-point', 5);
insert into DeliveryMethod  (name, KG_Price)
values				  ('pickup', 3);
insert into DeliveryMethod  (name, KG_Price)
values				  ('xpress-home', 12);


CREATE TABLE IF NOT EXISTS Orders (
    id INT PRIMARY KEY,
    client_ID INT,
    date DATE,
    status VARCHAR(20),
    message_date DATE
);


insert into Orders  (id, client_ID, date, status, message_date)
values				(500, 203845975, '2020-01-11', 'bought', '2020-01-20');
insert into Orders  (id, client_ID, date, status, message_date)
values				(501, 548637952, '2020-02-11', 'bought', '2020-02-20');
insert into Orders  (id, client_ID, date, status, message_date)
values				(502, 475896358, '2020-03-11', 'bought', '2020-03-20');
insert into Orders  (id, client_ID, date, status, message_date)
values				(503, 204789587, '2020-04-11', 'message-sent', '2020-04-20');
insert into Orders  (id, client_ID, date, status, message_date)
values				(504, 205483790, '2020-05-11', 'bought', '2020-05-20');
insert into Orders  (id, client_ID, date, status, message_date)
values				(505, 205483790, '2020-06-11', 'bought', '2020-06-20');
insert into Orders  (id, client_ID, date, status, message_date)
values				(506, 207846375, '2020-07-11', 'message-sent', '2020-06-20');
insert into Orders  (id, client_ID, date, status, message_date)
values				(507, 205798515, '2020-07-12', 'await', null);
insert into Orders  (id, client_ID, date, status, message_date)
values				(508, 207419835, '2020-07-11', 'bought', '2020-07-15');
insert into Orders  (id, client_ID, date, status, message_date)
values				(509, 305874298, '2020-7-01', 'message-sent', '2020-07-30');


CREATE TABLE IF NOT EXISTS EmployeeHours (
    employee_id INT,
    date DATE,
    hours FLOAT,
    PRIMARY KEY (employee_id , date)
);


insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-01-01', 120);
insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-02-01', 89);
insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-03-01', 85.5);
insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-04-01', 66);
insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-05-01', 142);
insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-06-01', 99);
insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-07-01', 45);
insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-08-01', 60);
insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-09-01', 100);
insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-10-01', 76);
insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-11-01', 55);
insert into EmployeeHours  (employee_id, date, hours)
values				(101, '2019-12-01', 99);


CREATE TABLE IF NOT EXISTS BookStorePurchases (
    book_id INT,
    store_purchases_id INT,
    amount INT,
    PRIMARY KEY (book_id , store_purchases_id)
);

insert into BookStorePurchases  (book_id, store_purchases_id, amount)
values				(1000, 301, 9);
insert into BookStorePurchases  (book_id, store_purchases_id, amount)
values				(1001, 301, 2);
insert into BookStorePurchases  (book_id, store_purchases_id, amount)
values				(1007, 301, 2);
insert into BookStorePurchases  (book_id, store_purchases_id, amount)
values				(1007, 303, 1);
insert into BookStorePurchases  (book_id, store_purchases_id, amount)
values				(1003, 303, 1);
insert into BookStorePurchases  (book_id, store_purchases_id, amount)
values				(1004, 308, 3);
insert into BookStorePurchases  (book_id, store_purchases_id, amount)
values				(1005, 308, 4);
insert into BookStorePurchases  (book_id, store_purchases_id, amount)
values				(1009, 300, 1);
insert into BookStorePurchases  (book_id, store_purchases_id, amount)
values				(1009, 306, 1);
insert into BookStorePurchases  (book_id, store_purchases_id, amount)
values				(1001, 309, 5);
insert into BookStorePurchases  (book_id, store_purchases_id, amount)
values				(1002, 309, 6);


CREATE TABLE IF NOT EXISTS BookPurchases (
    book_id INT,
    purchases_id INT,
    delivery_id INT,
    amount INT,
    PRIMARY KEY (book_id , purchases_id , delivery_id)
);


insert into BookPurchases  (book_id, purchases_id, delivery_id, amount)
values				(1002, 200, 400,  1);
insert into BookPurchases  (book_id, purchases_id, delivery_id, amount)
values				(1002, 200, 405,  1);
insert into BookPurchases  (book_id, purchases_id, delivery_id, amount)
values				(1001, 200, 405,  3);
insert into BookPurchases  (book_id, purchases_id, delivery_id, amount)
values				(1003, 202, 409,  1);
insert into BookPurchases  (book_id, purchases_id, delivery_id, amount)
values				(1006, 203, 402,  1);
insert into BookPurchases  (book_id, purchases_id, delivery_id, amount)
values				(1007, 204, 406,  2);
insert into BookPurchases  (book_id, purchases_id, delivery_id, amount)
values				(1009, 205, 407,  1);
insert into BookPurchases  (book_id, purchases_id, delivery_id, amount)
values				(1009, 205, 403,  4);
insert into BookPurchases  (book_id, purchases_id, delivery_id, amount)
values				(1002, 205, 408,  1);
insert into BookPurchases  (book_id, purchases_id, delivery_id, amount)
values				(1004, 209, -1,  3);


CREATE TABLE IF NOT EXISTS BookOrder (
    book_id INT,
    order_id INT,
    amount INT,
    PRIMARY KEY (book_id , order_id)
);


insert into BookOrder  (book_id, order_id, amount)
values				(1003, 501, 1);
insert into BookOrder  (book_id, order_id, amount)
values				(1002, 500, 1);
insert into BookOrder  (book_id, order_id, amount)
values				(1004, 501, 1);
insert into BookOrder  (book_id, order_id, amount)
values				(1005, 501, 1);
insert into BookOrder  (book_id, order_id, amount)
values				(1008, 506, 1);
insert into BookOrder  (book_id, order_id, amount)
values				(1007, 506, 2);
insert into BookOrder  (book_id, order_id, amount)
values				(1006, 505, 1);
insert into BookOrder  (book_id, order_id, amount)
values				(1001, 509, 1);
insert into BookOrder  (book_id, order_id, amount)
values				(1001, 508, 1);
insert into BookOrder  (book_id, order_id, amount)
values				(1003, 508, 2);
insert into BookOrder  (book_id, order_id, amount)
values				(1005, 508, 1);


