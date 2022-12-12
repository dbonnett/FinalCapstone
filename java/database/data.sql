begin transaction;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

insert into breweries (brewery_name, street_address, city, state_abv, zip, time_open, time_closed, history)
values ('Mindful', '3759 Library Rd', 'Pittsburgh', 'PA', '15234', '11:00', '0:00', 'Mindful brewery is a new hot spot in the Castle Shannon borough of Pittsburgh, crafting their own beers. They also have a renowned menu of pub food with a restaurant open to all ages');
insert into beers (brewery_id, beer_name, abv, beer_type, beer_description)
values ((select brewery_id from breweries where brewery_name = 'Mindful'), '88 rabbits', 8, 'Adjunct Lager', 'Named for the famous route 88 that Mindful resides on' );
insert into breweries (brewery_name, street_address, city, state_abv, zip, time_open, time_closed, history)
values ('Kyle Beer Co', '111 Beer Lane', 'Beertown', 'PA', '15228', '0:00', '0:00', 'The south hills premier location for locally crafted beers');


insert into beers (brewery_id, beer_name, abv, beer_type, beer_description)
values
((select brewery_id from breweries where brewery_name = 'Kyle Beer Co'), 'Kyles Blonde Lager', '12.1', 'American Lager', 'Flagship beer from the flagship brewery in Western PA'),
((select brewery_id from breweries where brewery_name = 'Kyle Beer Co'), 'TomA Porter', '12.5', 'Porter', 'Dark and strong porter created by the infamous Tom Anderson');
select * from reviews;

insert into reviews (username, title, beer_id, rating, review_body)
values
((select username from users where username = 'user'), 'DRINK THIS ONE!', (select beer_id from beers where beer_name = '88 rabbits'), 5, 'It is the greatest beer in all the VERLD!'),
((select username from users where username = 'user'), 'Refreshing', (select beer_id from beers where beer_name = 'Kyles Blonde Lager'), 4, 'Slimy, yet satisfying!'),
((select username from users where username = 'admin'), 'One of my new favorites!', (select beer_id from beers where beer_name = '88 rabbits'), 5, '5 out of 5!'),
((select username from users where username = 'admin'), 'Just OK for me dawg', (select beer_id from beers where beer_name = 'TomA Porter'), 4, 'Better than OK, not great');
insert into reviews (username, title, brewery_id, rating, review_body)
values
((select username from users where username = 'user'), 'Great food, great beer', (select brewery_id from breweries where brewery_name = 'Mindful'), 5, 'Great establishment!'),
((select username from users where username = 'user'), 'Beer lovers come here', (select brewery_id from breweries where brewery_name = 'Kyle Beer Co'), 4, 'Great beer, food just OK'),
((select username from users where username = 'admin'), 'Get the TomA Porter!', (select brewery_id from breweries where brewery_name = 'Mindful'), 5, 'Great selection of beer, not just all IPAs like some places');

COMMIT;
---------------------Filter by brewery, characteristisc etc.-------------------------
select review_id, username, title, beer_id, beer_name, rating, review_body from reviews
join beers using (beer_id);
join breweries using (brewery_id)
where brewery_name = 'Kyle Beer Co'
order by abv desc;

select * from reviews where beer_id = 1;

SELECT beer_name, brewery_name, abv, beer_type, beer_description FROM beers JOIN breweries USING (brewery_id) WHERE beer_id = 1;
SELECT review_id, username, beer_id, title, rating, review_body FROM reviews where review_id = 1



select * from users;
SELECT beer_id, brewery_id, beer_name, brewery_name, abv, beer_type, beer_description FROM beers JOIN breweries USING (brewery_id) WHERE beer_id = 1 ORDER BY beer_name;