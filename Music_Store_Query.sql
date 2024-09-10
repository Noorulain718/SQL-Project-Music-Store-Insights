Q1: Who is the senior most employee based on job title?
select * from employee
ORDER BY levels desc

Q2: Which countries have the most Invoices?
select COUNT(*) as c, billing_country 
from invoice
group by billing_country
ORDER BY c desc
limit 1

Q3: What are top 3 values of total invoice?
select * from invoice
order by total desc
limit 3


select total from invoice
order by total desc
limit 3

Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals

select SUM(total) as invoice_total, billing_city  
from invoice
group by billing_city
order by invoice_total desc
limit 1

Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.

select customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total DESC
limit 1

Question Set 2 – Moderate

1. Write query to return the email, first name, last name, & Genre of all Rock Music 
listeners. Return your list ordered alphabetically by email starting with A

SELECT DISTINCT email, first_name,last_name
FROM customer
JOIN invoice ON customer.customer_id=invoice.customer_id
JOIN invoice_line ON invoice.invoice_id= invoice_line.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id=genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;

2. Lets invite the artists who have written the most rock music in our dataset. Write a 
query that returns the Artist name and total track count of the top 10 rock bands

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id= album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;

3. Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the 
longest songs listed first

Select name,milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	from track)

	ORDER BY milliseconds DESC
)



