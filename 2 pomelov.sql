--=============== МОДУЛЬ 2. РАБОТА С БАЗАМИ ДАННЫХ =======================================
--= ПОМНИТЕ, ЧТО НЕОБХОДИМО УСТАНОВИТЬ ВЕРНОЕ СОЕДИНЕНИЕ И ВЫБРАТЬ СХЕМУ PUBLIC===========
SET search_path TO public;

--======== ОСНОВНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--Выведите уникальные названия городов из таблицы городов.

select distinct city 
from city






--ЗАДАНИЕ №2
--Доработайте запрос из предыдущего задания, чтобы запрос выводил только те города,
--названия которых начинаются на “L” и заканчиваются на “a”, и названия не содержат пробелов.

select distinct city
from address
where city like 'L%'
and 
city like '%a'
and 
city not like '% %'




--ЗАДАНИЕ №3
--Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись 
--в промежуток с 17 июня 2005 года по 19 июня 2005 года включительно, 
--и стоимость которых превышает 1.00.
--Платежи нужно отсортировать по дате платежа.


select payment_id, payment_date, amount
from payment p 
where payment_date::date between '2005-06-17' and '2006-06-19'
and 
amount > 1.00
order by payment_date 





--ЗАДАНИЕ №4
-- Выведите информацию о 10-ти последних платежах за прокат фильмов.

select payment_id, payment_date, amount
from payment p 
order by payment_date desc 
limit 10;




--ЗАДАНИЕ №5
--Выведите следующую информацию по покупателям:
--  1. Фамилия и имя (в одной колонке через пробел)
--  2. Электронная почта
--  3. Длину значения поля email
--  4. Дату последнего обновления записи о покупателе (без времени)
--Каждой колонке задайте наименование на русском языке.


select first_name|| ' ' ||last_name "Фамилиия и Имя", email "Электронная почта", character_length(email) "Длина емейл", date(last_update) "Дата"
from customer c 




--ЗАДАНИЕ №6
--Выведите одним запросом только активных покупателей, имена которых KELLY или WILLIE.
--Все буквы в фамилии и имени из верхнего регистра должны быть переведены в нижний регистр.

select upper(last_name), upper(first_name)
from customer c 
where activebool = true 
and 
first_name  ilike 'Kelly'
or 
first_name ilike 'Willie'






--======== ДОПОЛНИТЕЛЬНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--Выведите одним запросом информацию о фильмах, у которых рейтинг "R" 
--и стоимость аренды указана от 0.00 до 3.00 включительно, 
--а также фильмы c рейтингом "PG-13" и стоимостью аренды больше или равной 4.00.


select title, rating, rental_rate 
from film f 
where (rating = 'R' and rental_rate between 0. and 3.) 
or
(rating = 'PG-13' and rental_rate >= 4.) 

--ЗАДАНИЕ №2
--Получите информацию о трёх фильмах с самым длинным описанием фильма.


select title, description 
from film f 
order by character_length(description) desc 
limit 3







--ЗАДАНИЕ №3
-- Выведите Email каждого покупателя, разделив значение Email на 2 отдельных колонки:
--в первой колонке должно быть значение, указанное до @, 
--во второй колонке должно быть значение, указанное после @.


select concat(first_name, ' ', last_name), split_part(email, '@', 1), split_part(email, '@', 2) 
from customer c 




--ЗАДАНИЕ №4
--Доработайте запрос из предыдущего задания, скорректируйте значения в новых колонках: 
--первая буква должна быть заглавной, остальные строчными.

select concat(first_name, ' ', last_name), 
concat(upper(left(split_part(email, '@', 1),1)), (lower(substring(split_part(email, '@', 1),2)))),
split_part(email, '@', 2) 
from customer


