#1
select mov_title, mov_year 
from movie

#2
select mov_year 
from movie
where mov_title = 'American Beauty';

#3
select mov_title
from movie
where mov_year = '1999';

#4
select mov_title
from movie
where mov_year < '1998';

#5
select mov_title
from movie
where mov_year < '1999';

#6
select rev_name, mov_title
from reviewer join movie;

#7
select rev_name
from reviewer join rating 
where rev_stars >= '7';

#8
select mov_title
from movie join rating
where num_of_ratings = 0;

#9
select rev_name
from reviewer join rating
where num_of_ratings = null;

#10
select mov_title, dir_fname, dir_lname
from movie join director
where mov_title = 'Eyes Wide Shut';



















