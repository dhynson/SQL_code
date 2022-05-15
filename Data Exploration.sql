select *
from genders;

select * 
from users;

select YEAR(u.birthdate) AS year_of_birth, COUNT(*) AS num_of_users
from genders g INNER JOIN users u
	ON g.gender_id = u.gender_id
   GROUP BY YEAR(u.birthdate)
   HAVING COUNT(*) > 54
   ORDER BY YEAR(u.birthdate);
   
   select *
   from locations;
   
   select u.first_name, u.last_name, u.email, birthdate, l.country, l.city
   from users u INNER JOIN locations l
		ON u.location_id = l.location_id
        where l.country = 'United Kingdom';
        
        select COUNT(*) AS num_users, l.city, l.country
        from users u INNER JOIN locations l
			ON u.location_id = l.location_id
        where YEAR(curdate()) - YEAR(u.birthdate) > 30
        GROUP BY l.city, l.country
        ORDER BY COUNT(*) DESC;
        
        select *
        from occupations;
        
        select AVG(TIMESTAMPDIFF(YEAR, u.birthdate, curdate())) AS avg_age, o.occupation_name
        from users u INNER JOIN occupations o
			ON u.occupation_id = o.occupation_id
            GROUP BY o.occupation_name 
            HAVING AVG(TIMESTAMPDIFF(YEAR, u.birthdate, curdate())) > 40;
            
            select *
            from books;
            
            select * from authors;
            
            select a.authors, AVG(b.num_pages) AS avg_num_pages
            from authors a INNER JOIN books b
				ON a.author_id = b.author_id
			GROUP BY a.authors
            ORDER BY AVG(b.num_pages) DESC;
            
            select * from languages;
            
            select l.language_name, COUNT(*) AS num_books
			from books b INNER JOIN languages l
				ON b.language_code = l.language_code
			GROUP BY l.language_name
            ORDER BY COUNT(b.book_id) DESC;
            
            select l.language_name, COUNT(DISTINCT b.publisher_id) AS unique_publishers
            from books b INNER JOIN languages l
				ON b.language_code = l.language_code
			GROUP BY l.language_name
            ORDER BY COUNT(DISTINCT b.publisher_id) DESC;
            
            select * from occupations;
            
            select * from users;
            
            select * from locations;
            
            select u.first_name, u.last_name, u.email, u.birthdate, o.occupation_name, l.city, l.country
            from occupations o INNER JOIN users u 
				ON o.occupation_id = u.occupation_id
            INNER JOIN locations l 
				ON u.location_id = l.location_id;
                
                select * from ratings;
                
                select COUNT(DISTINCT u.user_id) AS num_users
                from ratings r INNER JOIN books b
					ON r.book_id = b.book_id
				INNER JOIN users u
					ON u.user_id = r.user_id
                    where b.title LIKE '%Harry Potter%'
                    ;
                    
select l.country, COUNT(DISTINCT u.user_id)
from locations l INNER JOIN users u ON l.location_id = u.user_id
INNER JOIN ratings r ON u.user_id = r.user_id
INNER JOIN books b ON r.book_id = b.book_id
where b.title LIKE '%Harry Potter%'
GROUP BY l.country;               

select * from publishers;

select b.title, b.num_pages, p.publisher_name
 from books b LEFT JOIN publishers p
	ON b.publisher_id = p.publisher_id
    where p.publisher_name IS NULL;
    
    select * from authors;
    select b.title, b.num_pages, b.publication_date, a.authors
    from books b LEFT JOIN authors a 
		ON b.author_id = a.author_id
	where a.authors IS NULL ;
    
    select COUNT(*)
    from books b LEFT JOIN ratings r
		ON b.book_id = r.book_id
	where r.rating IS NULL;
    
    use hr;
    select * from employees;
    
   select e.last_name AS 'employee', m.last_name AS 'manager'
   from employees e LEFT JOIN employees m
	ON e.manager_id = m.id
   ;
        
	
				
   