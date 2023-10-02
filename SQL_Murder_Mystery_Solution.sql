-- This line looks at interview transcripts of people who checked in a fit now event on the date of the murder. The table get_fit_now_member has suspect name information. 
SELECT * 
FROM facebook_event_checkin f
JOIN get_fit_now_member g
	USING(person_id)
JOIN interview i
	USING(person_id)
WHERE date = 20180115;

-- Next I want to confirm if Jeremy Bowers was woring out with Annabel Miller on the 9th of Jan
SELECT*
FROM get_fit_now_check_in gf
JOIN get_fit_now_member gm
	ON gf.membership_id = gm.id
WHERE check_in_date = 20180109;

-- Jeremy is the killer however, based on his transcript someone else orchestrated the murder so we will search based on his decription. 
SELECT * 
FROM person p
JOIN drivers_license d
	ON p.license_id = d.id
JOIN income i
	USING(ssn)
WHERE hair_color = 'red' AND car_make ='Tesla' AND car_model = 'Model S' AND height BETWEEN 65 AND 67;

-- This gives 2 options names: Red Korb or Miranda Priestly. Its time to check which one of these women was at the SQL Sympony 3 times in Dec 2017: 
SELECT * 
FROM person p
JOIN facebook_event_checkin f
	ON p.id = f.person_id
WHERE event_name = 'SQL Symphony Concert' AND name = 'Miranda Priestly' OR 'Red Korb'

-- Based on this query Miranda Priestly and Jeremy Bowers should be charged with first degree murder.




              