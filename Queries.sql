use bookstoredatabase;

#1 
-- SELECT EXISTS (
-- SELECT * 
-- FROM book 
-- WHERE title = 'big data' AND (storage_count + storage_count != 0)) as bool;

#2 
-- SELECT id_number, name, join_date
-- FROM client 
-- ORDER BY join_date ASC LIMIT 1;

#3
-- SELECT book_id, date, title, author 
-- FROM (
-- 	SELECT book_id, date 
-- 	FROM storepurchases 
--     INNER JOIN bookstorepurchases ON bookstorepurchases.store_purchases_id = storepurchases.id) as X 
-- INNER JOIN book ON X.book_id = book.id
-- WHERE storage_count + store_count > 0
-- ORDER BY date ASC limit 1

#4
-- SELECT *
-- FROM orders 
-- WHERE status != 'bought'
-- ORDER BY date ASC;

#5
-- SELECT id, title, sum(amount) AS sold
-- FROM book
-- LEFT JOIN bookpurchases ON book.id = bookpurchases.book_id
-- WHERE title = 'just me'

#6 
-- SELECT author, sum(amount) AS sold
-- FROM (
-- 	SELECT book.id, author, date, amount
-- 	FROM book
-- 	LEFT JOIN bookpurchases ON book.id = bookpurchases.book_id
-- 	LEFT JOIN purchase ON bookpurchases.purchases_id = purchase.id
-- 	WHERE (date BETWEEN "2019-01-01" AND "2020-07-14")) AS X
-- GROUP BY author
-- ORDER BY amount DESC LIMIT 1;

#7
-- select id_number, name, sum(amount) as bought
-- from (
-- 	SELECT id_number, name, amount
-- 	from client
-- 	inner join purchase on client.id_number = purchase.client_id
-- 	inner join bookpurchases on bookpurchases.purchases_id = purchase.id) as X
-- group by id_number
-- order by bought desc limit 3;

#8
-- select id, title , author, count(translator) as translations
-- from book
-- where book.storage_count + book.storage_count != 0
-- group by title
-- order by translations desc limit 1;

#9
-- SELECT id_number, client.name, book_id, title, date, amount, (KG_Price * weight + cost * 1.2) cost, ((KG_Price * weight + cost * 1.2) * amount) total_cost
-- from client
-- inner join purchase on client.id_number = purchase.client_id
-- inner join bookpurchases on bookpurchases.purchases_id = purchase.id
-- inner join delivery on bookpurchases.delivery_id = delivery.id
-- inner join deliverymethod on delivery.method_name = deliverymethod.name
-- inner join book on book.id = bookpurchases.book_id
-- where id_number = '204789587'
-- order by date asc;

#10
-- select (date) order_date, status, message_date, title, author
-- from orders
-- inner join bookorder on bookorder.order_id = orders.id
-- inner join client on client.id_number = orders.client_ID
-- inner join book on bookorder.book_id = book.id
-- where id_number = '305874298'

#11
####################### TODO ###############################

#12
-- select purchases_id, title, author, amount, delivery_id, destination, delivery_type, method_name 
-- from bookpurchases
-- inner join delivery on delivery.id = bookpurchases.delivery_id
-- inner join book on book.id = bookpurchases.book_id
-- inner join purchase on bookpurchases.purchases_id = purchase.id
-- inner join client on client.id_number = purchase.client_ID
-- where purchases_id in (
-- 	select purchases_id 
-- 	from bookpurchases
-- 	inner join delivery on delivery.id = bookpurchases.delivery_id
-- 	group by purchases_id having count(purchases_id) > 1 )
-- and client.id_number = '204789587'

#13
-- select status
-- from delivery
-- where id = 403

#14
-- select count(*) deliveres
-- from purchase
-- inner join bookpurchases on bookpurchases.purchases_id = id
-- inner join delivery on bookpurchases.delivery_id = delivery.id
-- where date between '2019-11-01' and ('2019-11-01' + interval 1 month) and delivery_type = 'xpress'

#15
-- select sum(amount * (cost * 1.2 + KG_Price * weight)) total
-- from purchase
-- inner join bookpurchases on bookpurchases.purchases_id = purchase.id
-- inner join book on book.id = bookpurchases.book_id
-- left join delivery on delivery.id = bookpurchases.delivery_id
-- left join deliverymethod on deliverymethod.name = delivery.method_name
-- where (date between "2019-11-01" and ('2019-11-01' + interval 1 month)) and payment_method = "bit"

#16
-- select purchases_id, date, (amount * cost * 0.2) profit
-- from purchase
-- left join bookpurchases on bookpurchases.purchases_id = purchase.id
-- left join book on book.id = bookpurchases.book_id
-- where (date between (now() - interval 1 year) and now())
-- and (
-- 	select avg(amount * cost * 0.2) avg_profit
-- 	from purchase
-- 	left join bookpurchases on bookpurchases.purchases_id = purchase.id
-- 	left join book on book.id = bookpurchases.book_id
-- 	where (date between (now() - interval 1 year) and now())) < (amount * cost * 0.2)

#17
-- select sum(delivery_type = "mail") mail_count, sum(delivery_type = "xpress") xpress_count  
-- from delivery
-- where (status_update_date between (now() - interval 1 year) and now())


#18
####################### TODO ###############################

#19
-- select client_id,  name, mobile_phone, landline, join_date
-- from (
-- 	select client_id, max(date) date
-- 	from purchase
-- 	group by client_id) as T
-- left join client on client.id_number = T.client_id
-- where date not between (now() - interval 2 year) and (now())

#20
-- select id_number, name
-- from orders
-- left join client on orders.client_ID = client.id_number
-- where (status = 'message-sent') and ( message_date between (now() - interval 14 day) and now())

#21
####################### TODO ###############################

#22
-- select sum(cost * amount) total_cost, sum(amount) book_count
-- from (
-- 	select id
-- 	from storepurchases
-- 	where date between '2020-04-01' and '2020-05-01') as T
-- left join bookstorepurchases on T.id = bookstorepurchases.store_purchases_id
-- left join book on book.id = bookstorepurchases.book_id

#23
-- select (sum(cost) * 0.20 * amount) month_profit
-- from (
-- 	select id
-- 	from purchase
-- 	where date between '2020-05-01' and ('2020-05-01' + interval 1 month)) as T
-- left join bookpurchases on T.id = bookpurchases.purchases_id
-- left join book on book.id = bookpurchases.book_id

#24
####################### TODO ###############################

#25
-- select (hours * hour_salary) bruto
-- from employeehours
-- left join employee on employee.id = employeehours.employee_id
-- where employee_id = 101 and date = '2019-01-01'

#26
-- select employee_id, name, count(employee_id) sales
-- from purchase
-- left join employee on employee.id = purchase.employee_id
-- where date between '2019-11-1' and ('2019-11-1' + interval 1 month)
-- group by employee_id
-- order by sales desc limit 1




