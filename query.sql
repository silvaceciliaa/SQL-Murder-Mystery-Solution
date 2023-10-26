SELECT * FROM crime_scene_report WHERE date = 20180115 AND type = 'murder'
--Start by retrieving the corresponding crime scene report from the police department’s database.

SELECT * FROM person WHERE address_street_name = 'Northwestern Dr' ORDER BY address_number desc LIMIT 1
--The first witness lives at the last house on "Northwestern Dr".

SELECT * FROM person WHERE address_street_name='Franklin Ave' AND name like 'Annabel%'
--The second witness, named Annabel, lives somewhere on "Franklin Ave"

SELECT * FROM interview WHERE person_id = 16371
-- What Annabel told in her interview

SELECT * FROM interview WHERE person_id = 14887
-- What Morty told in his interview

SELECT * FROM get_fit_now_check_in WHERE check_in_date = 20180109 AND membership_id like '48Z%'
-- first clue

SELECT p.name, d.id as license, d.gender, d.plate_number
FROM drivers_license as d 
JOIN person as p on d.id = p.license_id
WHERE d.plate_number like '%H42W%'
-- second clue

SELECT * FROM interview WHERE person_id = 67318
-- interview with Jeremy Bowers

SELECT event_id, event_name FROM facebook_event_checkin WHERE event_name = 'SQL Symphony Concert'
-- finding the id of the SQL Symphony Concert event

SELECT p.name, d.height, d.hair_color, d.gender, p.id, d.car_make as brand, d.car_model as model
FROM facebook_event_checkin as f
JOIN person as p on p.id=f.person_id
JOIN drivers_license as d on d.id=p.license_id
WHERE f.event_id=1143
and d.hair_color='red'
and d.gender='female'
and d.height between 65 and 67
and f.date between 20171201 and 20171231
-- finding the woman that's around 5'5" (65") or 5'7" (67"). She has red hair and she attended the SQL Symphony Concert 3 times in December 2017

SELECT 
	p.name, p.id, d.age, d.height, d.hair_color, d.gender, d.car_make as brand, d.car_model as model
FROM drivers_license as d 
JOIN person as p on d.id = p.license_id
WHERE d.car_make='Tesla' and d.car_model='Model S'and d.hair_color='red'and d.gender='female' and d.height between 65 and 67;
-- finding out if she owns a Tesla

--RESOLUTION
INSERT INTO solution VALUES (1, 'Jeremy Bowers');

SELECT value FROM solution;

INSERT INTO solution VALUES (1, 'Miranda Priestly');

SELECT value FROM solution;
