BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('The Root Beer Stand', 'food', ' The Root Beer Stand, the wonderful eatery that signifies summer in Greater Cincinnati, opened as an A & W Root Beer Stand in 1957. Since then, Cincinnati Magazine has named it as the best place to quaff a root beer in town and ranked "The Stand" in the number 12 slot among the "Top 100 Places in Cincinnati."', '(513) 769-4349', '11566 Reading Rd, Sharonville, OH 45241', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'The Root Beer Stand'),'Monday','11:00:00','20:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'The Root Beer Stand'),'Tuesday','11:00:00','20:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'The Root Beer Stand'),'Wednesday','11:00:00','20:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'The Root Beer Stand'),'Thursday','11:00:00','20:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'The Root Beer Stand'),'Friday','11:00:00','20:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'The Root Beer Stand'),'Saturday','11:00:00','20:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'The Root Beer Stand'),'Sunday','11:00:00','20:00:00', false, false);


INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Boca', 'food', 'Boca has been recognized as one of the top French Restaurants in the United States by Travel and Leisure Magazine as well as Open Table’s Top 100 Restaurants in the United States.', '(513) 542-2022', '114 E 6th St, Cincinnati, OH 45202', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Boca'),'Monday','16:00:00','22:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Boca'),'Tuesday','16:00:00','22:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Boca'),'Wednesday','16:00:00','22:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Boca'),'Thursday','16:00:00','22:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Boca'),'Friday','16:00:00','22:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Boca'),'Saturday','16:00:00','22:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Boca'),'Sunday','16:00:00','22:00:00', false, false);


INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Skyline (Ludlow)', 'food', 'Skyline is famous for their incredibly delicious Cheese Coneys and 3-Ways. Their unique chili is still made with the original secret family recipe passed down through generations of the Lambrinides family. It’s extremely craveable. Some would even say addictive. All we know is people love it.', '(513) 221-2142', '290 Ludlow Ave, Cincinnati, OH 45220', 0, 0, true, '' );

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Skyline (Ludlow)'),'Monday','10:00:00','24:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Skyline (Ludlow)'),'Tuesday','10:00:00','24:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Skyline (Ludlow)'),'Wednesday','10:00:00','24:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Skyline (Ludlow)'),'Thursday','10:00:00','24:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Skyline (Ludlow)'),'Friday','10:00:00','24:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Skyline (Ludlow)'),'Saturday','10:00:00','24:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Skyline (Ludlow)'),'Sunday','10:00:00','24:00:00', false, false);


INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Mochiko', 'food', 'In 2022 Cafe Mochiko was named by Bon Appetit Magazine as one of the 50 Best New Restaurants in the country, and Chef Elaine was nominated as a semifinalist for the James Beard Awards for Outstanding Baker. In 2023 Chef Elaine was nominated as a finalist for the James Beard Awards for Outstanding Pastry Chef or Baker.', '(513) 559-1000', '1524 Madison Rd, Cincinnati, OH 45206', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Mochiko'), 'Monday', NULL, NULL, true, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Mochiko'), 'Tuesday', NULL, NULL, true, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Mochiko'), 'Wednesday', NULL, NULL, true, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Mochiko'), 'Thursday', '08:00:00', '21:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Mochiko'), 'Friday', '08:00:00', '21:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Mochiko'), 'Saturday', '09:00:00', '21:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Mochiko'), 'Sunday', '09:00:00', '21:00:00', false, false);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Findlay Market', 'food', 'Findlay Market is the only surviving municipal market house of the nine public markets operating in Cincinnati in the 19th and early 20th  century. The market house is built on land donated to the City of Cincinnati by the estate of General James Findlay (1770 - 1835) and Jane Irwin Findlay (1769 - 1851). Findlay Market is Ohio''s oldest surviving  municipal market house. It was designed under the direction of City Civil Engineer Alfred West Gilbert (1816-1900) using a durable but unconventional cast and wrought iron frame, a construction technology that had been little used in the United States. Findlay Market was  listed on the National Register of Historic Places in 1972. The structure was among the first markets in the United States to use iron  frame construction technology and is one of very few that have survived. ', '(513) 665-4839', '1801 Race St, Cincinnati, OH 45202', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Findlay Market'), 'Monday', NULL, NULL, true, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Findlay Market'), 'Tuesday', '09:00:00', '18:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Findlay Market'), 'Wednesday', '09:00:00', '18:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Findlay Market'), 'Thursday', '09:00:00', '18:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Findlay Market'), 'Friday', '09:00:00', '18:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Findlay Market'), 'Saturday', '08:00:00', '18:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Findlay Market'), 'Sunday', '10:00:00', '16:00:00', false, false);


INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('FC Cincinnati', 'sports', 'Football Club Cincinnati, commonly known as FC Cincinnati, is an American professional soccer club based in Cincinnati. The club plays in the Eastern Conference of Major League Soccer.', '(513) 991-1803', '14 East 4th St, Cincinnati, OH', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'FC Cincinnati'), 'Monday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'FC Cincinnati'), 'Tuesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'FC Cincinnati'), 'Wednesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'FC Cincinnati'), 'Thursday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'FC Cincinnati'), 'Friday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'FC Cincinnati'), 'Saturday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'FC Cincinnati'), 'Sunday', NULL, NULL, false, true);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Cincinnati Reds', 'sports', 'The Cincinnati Reds are an American professional baseball team based in Cincinnati. They compete in Major League Baseball as a member club of the National League Central division and were a charter member of the American Association in 1881 before joining the NL in 1890.', '(513) 765-7000', '100 Joe Nuxhall Way, Cincinnati, OH 45202', 0, 0, true, 'https://www.ballparksofbaseball.com/wp-content/uploads/2016/03/gab23main.jpg');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'FC Cincinnati'), 'Monday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Reds'), 'Tuesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Reds'), 'Wednesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Reds'), 'Thursday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Reds'), 'Friday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Reds'), 'Saturday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Reds'), 'Sunday', NULL, NULL, false, true);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Cincinnati Bengals', 'sports', 'The Cincinnati Bengals are a professional American football team based in Cincinnati. The Bengals compete in the National Football League as a member club of the league''s American Football Conference North division. The club''s home games are held in downtown Cincinnati at Paycor Stadium.', '(513) 621-8383', '1 Paycor Stadium | Cincinnati, Ohio 45202', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Bengals'), 'Monday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Bengals'), 'Tuesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Bengals'), 'Wednesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Bengals'), 'Thursday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Bengals'), 'Friday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Bengals'), 'Saturday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Bengals'), 'Sunday', NULL, NULL, false, true);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Cincinnati Rollergirls', 'sports', 'The Cincinnati Rollergirls is Cincinnati’s amateur flat track roller derby team. A member of the Women''s Flat Track Derby Association, CRG plays its home games at Cintas Center at Xavier University and at Sports Plus in Evendale.', '(513) 818-3372', 'P.O. Box 36322. Cincinnati, OH 45236', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Rollergirls'), 'Monday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Rollergirls'), 'Tuesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Rollergirls'), 'Wednesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Rollergirls'), 'Thursday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Rollergirls'), 'Friday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Rollergirls'), 'Saturday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Cincinnati Rollergirls'), 'Sunday', NULL, NULL, false, true);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Rhinegeist', 'brewery', 'Taproom located in a historic bottling plant offering house-brewed beers, Ping-Pong, cornhole & TVs.', '(513) 381-1367', '1910 Elm St, Cincinnati, OH 45202', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Rhinegeist'),'Monday','15:00:00','22:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Rhinegeist'),'Tuesday','15:00:00','22:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Rhinegeist'),'Wednesday','15:00:00','22:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Rhinegeist'),'Thursday','15:00:00','22:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Rhinegeist'),'Friday','11:00:00','24:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Rhinegeist'),'Saturday','12:00:00','24:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Rhinegeist'),'Sunday','12:00:00','21:00:00', false, false);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Madtree', 'brewery', 'Bustling taproom offering craft beers, wood-fired pizzas, growler fills & keg sales, plus a patio.', '(513) 836-8733', '3301 Madison Rd, Cincinnati, OH 45209', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Madtree'),'Monday','11:00:00','23:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Madtree'),'Tuesday','11:00:00','23:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Madtree'),'Wednesday','11:00:00','23:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Madtree'),'Thursday','11:00:00','23:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Madtree'),'Friday','10:00:00','24:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Madtree'),'Saturday','10:00:00','24:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Madtree'),'Sunday','10:00:00','24:00:00', false, false);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Fifty West Brewing Company', 'brewery', 'Offers craft beer brewery, restaurant for lunch and dinner, sand volleyball courts, canoe and kayak rental, bicycle rental, Sunday brunch, running club, craft beer, and brewery services. Located next to the Little Miami Scenic Trail.', '(513) 834-8789', '7605 Wooster Pike, Cincinnati, OH 45227', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Fifty West Brewing Company'),'Monday','11:00:00','23:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Fifty West Brewing Company'),'Tuesday','11:00:00','23:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Fifty West Brewing Company'),'Wednesday','11:00:00','23:00:00',false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Fifty West Brewing Company'),'Thursday','11:00:00','23:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Fifty West Brewing Company'),'Friday','11:00:00','23:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Fifty West Brewing Company'),'Saturday','11:00:00','23:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Fifty West Brewing Company'),'Sunday','11:00:00','21:00:00', false, false);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('American Sign Museum', 'historic', 'This museum features a collection of over 100 years of American signage, including neon signs, electric signs, and other types of advertising and marketing materials.', '(513) 541-6366', '1330 Monmouth Ave, Cincinnati, OH 45225', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'American Sign Museum'), 'Monday', NULL, NULL, true, false),
((SELECT landmark_id FROM landmarks WHERE name = 'American Sign Museum'), 'Tuesday', NULL, NULL, true, false),
((SELECT landmark_id FROM landmarks WHERE name = 'American Sign Museum'), 'Wednesday', '10:00:00', '16:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'American Sign Museum'), 'Thursday', '10:00:00', '16:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'American Sign Museum'), 'Friday', '10:00:00', '16:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'American Sign Museum'), 'Saturday', '10:00:00', '16:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'American Sign Museum'), 'Sunday', NULL, NULL, true, false);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Serpent Mound State Memorial', 'historic', 'The Great Serpent Mound is a 1,348-foot-long, three-foot-high prehistoric effigy mound located in Peebles, Ohio. It was built on what is known as the Serpent Mound crater plateau, running along the Ohio Brush Creek in Adams County, Ohio. The mound is the largest serpent effigy in the world', '(800) 752-2757', '3850 OH-73, Peebles, OH 45660', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Serpent Mound State Memorial'), 'Monday', '10:00:00', '17:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Serpent Mound State Memorial'), 'Tuesday', '10:00:00', '17:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Serpent Mound State Memorial'), 'Wednesday', '10:00:00', '17:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Serpent Mound State Memorial'), 'Thursday', '10:00:00', '17:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Serpent Mound State Memorial'), 'Friday', '10:00:00', '17:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Serpent Mound State Memorial'), 'Saturday', '10:00:00', '17:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Serpent Mound State Memorial'), 'Sunday', '12:00:00', '17:00:00', false, false);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Norwood Mound', 'historic', 'Norwood Mound, also known as “Indian Mound” by locals, is a prehistoric Native American earthwork mound located in Norwood, Ohio, United States, believed to be at least 2000 years old.', NULL, '2413 Indian Mound Ave, Cincinnati, OH 45212, USA', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Norwood Mound'), 'Monday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Norwood Mound'), 'Tuesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Norwood Mound'), 'Wednesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Norwood Mound'), 'Thursday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Norwood Mound'), 'Friday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Norwood Mound'), 'Saturday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Norwood Mound'), 'Sunday', NULL, NULL, false, true);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Harriet Beecher Stowe House', 'historic', 'The Harriet Beecher Stowe House is a historic home in Cincinnati, Ohio which was once the residence of influential anti slavery author Harriet Beecher Stowe, author of the 1852 novel Uncle Tom''s Cabin.', '(513) 751-0651', '2950 Gilbert Ave, Cincinnati, OH 45206
', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Harriet Beecher Stowe House'), 'Monday', NULL, NULL, true, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Harriet Beecher Stowe House'), 'Tuesday', NULL, NULL, true, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Harriet Beecher Stowe House'), 'Wednesday', NULL, NULL, true, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Harriet Beecher Stowe House'), 'Thursday', '10:00:00', '16:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Harriet Beecher Stowe House'), 'Friday', '10:00:00', '16:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Harriet Beecher Stowe House'), 'Saturday', '10:00:00', '16:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Harriet Beecher Stowe House'), 'Sunday', NULL, NULL, true, false);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Bobby Mackeys', 'haunted', 'On the 2 hour tour, you are taken around all accessible areas of the building.  Your tour guide is with you at all times and provides information on the history of the location and reported paranormal activity.  We will spend time in each area to allow for a brief paranormal investigation.  You are welcome to bring small, handheld equipment such as recorders, EMF meters, camera, etc.', '(859) 431-5588', '44 Licking Pike, Wilder, KY 41071', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Bobby Mackeys'), 'Monday', '19:00:00', '21:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Bobby Mackeys'), 'Tuesday', '19:00:00', '21:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Bobby Mackeys'), 'Wednesday', '19:00:00', '21:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Bobby Mackeys'), 'Thursday', '19:00:00', '21:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Bobby Mackeys'), 'Friday', NULL, NULL, true, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Bobby Mackeys'), 'Saturday', NULL, NULL, true, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Bobby Mackeys'), 'Sunday', '19:00:00', '21:00:00', false, false);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Lick Road', 'haunted', 'A ghost named Amy is said to haunt the end of the long, desolate road.  There are many tales of how Amy had died, but the most popular is that she was murdered by her boyfriend.  Witnesses have reported hearing footsteps following them, others have spotted a ghostly girl walking the grounds.  Another legend states that if one flicks their headlights at the sign, you can see “Amy” written on the sign. Other legends states that one might hear screams, or even see the word “Help” scrawled in the condensation on the window of your car while parked in the cul-de-sac.', NULL, 'Lick Rd, Colerain Township, OH 45251', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Lick Road'), 'Monday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Lick Road'), 'Tuesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Lick Road'), 'Wednesday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Lick Road'), 'Thursday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Lick Road'), 'Friday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Lick Road'), 'Saturday', NULL, NULL, false, true),
((SELECT landmark_id FROM landmarks WHERE name = 'Lick Road'), 'Sunday', NULL, NULL, false, true);

INSERT INTO landmarks (name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img)
VALUES ('Spring Grove Cemetery', 'haunted', 'One legend revolves around the grave of Charles Breuer, upon which a bust of Charles sits.  Late one evening, a visitor is said to have witnessed one of the eyes popping out of the head of the bust, landing beside the visitor’s foot, and then turning toward the visitor, squelching wetly as it moved. Another frightening tale involved a mausoleum that opens up to reveal a pair of snarling white dogs, eyes aglow with blue fire, that let out blood-curdling howls.', '(513) 681-7526', '4521 Spring Grove Ave. Cincinnati, OH 45232', 0, 0, true, '');

INSERT INTO operating_hrs (landmark_id, day_of_week, opening_time, closing_time, closed, varies)
VALUES ((SELECT landmark_id FROM landmarks WHERE name = 'Spring Grove Cemetery'), 'Monday', '08:00:00', '18:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Spring Grove Cemetery'), 'Tuesday', '08:00:00', '18:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Spring Grove Cemetery'), 'Wednesday', '08:00:00', '18:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Spring Grove Cemetery'), 'Thursday', '08:00:00', '18:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Spring Grove Cemetery'), 'Friday', '08:00:00', '18:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Spring Grove Cemetery'), 'Saturday', '08:00:00', '18:00:00', false, false),
((SELECT landmark_id FROM landmarks WHERE name = 'Spring Grove Cemetery'), 'Sunday', '08:00:00', '18:00:00', false, false);


COMMIT TRANSACTION;
