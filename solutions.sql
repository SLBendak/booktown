
-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;
-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;
​
-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects 
WHERE location = 'Main St' 
ORDER BY subject;
​
-- ### Joins
-- 6. Find all books about Computers and list ONLY the book titles
SELECT b.title FROM books b
JOIN subjects s
ON b.subject_id = s.id
WHERE s.subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
--  * Book title
--  * Author's first name
--  * Author's last name
--  * Book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject 
FROM books 
INNER JOIN authors 
ON authors.id = books.author_id 
INNER JOIN subjects 
ON subjects.id = books.subject_id;
​
SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b
JOIN authors a
ON b.author_id = a.id
JOIN subjects s
ON b.subject_id = s.id;
​
-- 8. Find all books that are listed in the stock table
SELECT books.title, stock.retail 
FROM books 
INNER JOIN editions 
ON books.id = editions.book_id 
INNER JOIN stock 
ON stock.isbn = editions.isbn 
ORDER BY stock.retail DESC;
​
SELECT b.title, s.retail 
FROM books b
JOIN editions e
ON b.id = e.book_id
JOIN stock s
ON e.isbn = s.isbn
ORDER BY s.retail DESC;
​
-- 9. Find the book "Dune" and display ONLY the following columns
--  * Book title
--  * ISBN number
--  * Publisher name
--  * Retail price
SELECT b.title, e.isbn, p.name, s.retail 
FROM books b
INNER JOIN editions e
ON b.id = e.book_id 
INNER JOIN publishers p
ON p.id = e.publisher_id 
INNER JOIN stock s
ON s.isbn = e.isbn 
WHERE b.title = 'Dune';
​
SELECT b.title, e.isbn, p.name AS publisher_name, s.retail
FROM books b
JOIN editions e
ON b.id = e.book_id
JOIN publishers p
ON e.publisher_id = p.id
JOIN stock s
ON e.isbn = s.isbn
WHERE b.title = 'Dune';
​
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
--  * Customer first name
--  * Customer last name
--  * ship date
--  * book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title 
FROM customers
INNER JOIN shipments 
ON customers.id = shipments.customer_id 
INNER JOIN editions 
ON editions.isbn = shipments.isbn 
INNER JOIN books 
ON books.id = editions.book_id 
ORDER BY shipments.ship_date;
​
SELECT c.first_name, c.last_name, s.ship_date, b.title
FROM books b
JOIN editions e
ON b.id = e.book_id
JOIN shipments s
ON e.isbn = s.isbn
JOIN customers c
ON c.id = s.customer_id
ORDER BY s.ship_date;
​
-- ### Grouping and Counting
-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(location), location FROM subjects GROUP BY location
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT b.title, COUNT(e.book_id) AS editions
FROM books b
JOIN editions e
ON b.id = e.book_id
GROUP BY b.title; ON editions.book_id = books.id 
GROUP BY books.id, books.title, editions.edition;