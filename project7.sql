create database airbnb;

use airbnb;

CREATE TABLE airbnb_hosts (
     	host_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
     	host_name varchar(150),
		host_since date,
		host_location varchar(150),
		host_response_time date,
		host_response_rate int,
		host_acceptance_rate int,
		host_is_superhost boolean,
		host_neighbourhood varchar(100),
		host_listings_count int,
		host_has_profile_pic boolean,
		host_identity_verified boolean
); 

INSERT into airbnb_hosts (
				host_name,
                host_since,
                host_location,
                host_response_time,
                host_response_rate,
                host_acceptance_rate,
                host_is_superhost,
                host_neighbourhood,
                host_listings_count,
                host_has_profile_pic,
                host_identity_verified
			) values 
				('Kristein','2014-09-17','Arizona','2022-01-20',1200,1100,true,'school',4,true,true),
				('Steward','2010-11-12','New York','2022-03-25',2300,2200,false,'park',5,true,false),
				('Jennifer','2015-02-1','Texas','2022-4-12',1000,850,false,'supermarket',7,false,true),
                ('Mc Gregor','2020-09-10','Kenya','2022-10-20',3000,2500,true,'home',9,true,false);
                
SELECT 
    *
FROM
    airbnb_hosts;
    
CREATE TABLE listing (
     	listing_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
     	listing_name varchar(150),
		street varchar(50),
		neighbourhood_cleansed varchar(150),
		neighbourhood_group_cleansed varchar(150),
		city varchar(50),
		state varchar(50),
		zipcode varchar(20),
		latitude float,
		longitude float,
		is_location_exact boolean,
		property_type varchar(150),
		room_type varchar(150),
		accommodates int,
		bathrooms int,
		bedrooms int,
		beds int,
		bed_type varchar(200),
		square_feet float,
		price float,
		weekly_price float,
		monthly_price float,
		security_deposit float,
		cleaning_fee float,
		guests_included int,
		extra_people float,
		min_nights int,
		max_nights int,
		has_availability boolean,
		availability_30 INT,
		availability_60 INT,
		availability_90 INT,
		availability_365 INT,
		calendar_updated DATE,
		number_of_reviews INT,
		first_review DATE,
		last_review DATE,
		review_scores_rating INT,
		review_scores_accuracy INT,
		review_scores_cleanliness INT,
		review_scores_checkin INT,
		review_scores_communication INT,
		review_scores_location INT,
		review_scores_value INT,
		requires_license BOOLEAN,
		instant_bookable BOOLEAN,
		cancellation_policy VARCHAR(200),
		require_guest_profile_picture BOOLEAN,
		require_guest_phone_verification BOOLEAN,
		reviews_per_month FLOAT,
		host_id INT
); 

INSERT into listing (
     	listing_name,
		street,
		neighbourhood_cleansed,
		neighbourhood_group_cleansed,
		city,
		state,
		zipcode,
		latitude,
		longitude,
		is_location_exact,
		property_type,
		room_type,
		accommodates,
		bathrooms,
		bedrooms,
		beds,
		bed_type,
		square_feet,
		price,
		weekly_price,
		monthly_price,
		security_deposit,
		cleaning_fee,
		guests_included,
		extra_people,
		min_nights,
		max_nights,
		has_availability,
		availability_30,
		availability_60,
		availability_90,
		availability_365,
		calendar_updated,
		number_of_reviews,
		first_review,
		last_review,
		review_scores_rating,
		review_scores_accuracy,
		review_scores_cleanliness,
		review_scores_checkin,
		review_scores_communication,
		review_scores_location,
		review_scores_value,
		requires_license,
		instant_bookable,
		cancellation_policy,
		require_guest_profile_picture,
		require_guest_phone_verification,
		reviews_per_month,
		host_id
			) values 
				('Baby Hut','Bourbon','yes','yes','New Orleans','Louisiana','71601',38.8951,-77.0364,true,'Apartments','Single',1,1,1,2,'Twin',450,200,1400,5000,500,25,1,2,2,2,true,true,true,true,true,'2022-3-4',78,'2022-2-14','2022-10-22',8,9,9,6,8,8,10,false,false,'Flexible',true,true,300,1),
				('Thieves Kitchen','Broadway','yes','yes','New York City','New York','85001',4124.2028,210.4418,true,'Villas','Double',2,2,2,2,'Twin XL',660,250,1750,7100,500,50,2,1,3,3,true,true,true,true,true,'2022-9-30',89,'2022-1-24','2022-10-27',9,8,9,8,7,9,9,false,false,'Moderate',true,true,245,2),
				('Grandmas Cuisine','Hollywood Boulevard','yes','yes','Los Angeles','California','96162',-77.0364,38.8951,false,'Apartments','Single',4,3,4,3,'King',1200,500,8400,15000,500,100,1,0,1,1,false,true,true,true,true,'2022-8-4',34,'2022-3-13','2022-10-2',7,5,9,7,9,10,8,false,false,'Firm',true,true,129,3),
                ('Be our host','Las Vegas','yes','yes','Chicago','Illinois','96162',-77.0364,38.8951,false,'Township','Single',4,8,8,7,'King',1200,500,8400,15000,500,100,1,0,1,1,false,true,true,true,true,'2022-8-4',34,'2022-3-13','2022-10-2',7,5,9,7,9,10,8,false,false,'Firm',true,true,98,4),
                ('Nest','Ocean Drive','yes','yes','Miami','Florida','96162',-77.0364,38.8951,false,'Township','Single',4,8,8,7,'King',890,650,6700,13000,500,100,1,0,1,1,false,true,true,true,true,'2022-8-4',34,'2022-3-13','2022-10-2',7,5,9,7,9,10,8,false,false,'Firm',true,true,98,4);

# ALTER AND ADD FOREIGN KEY CONSTRAINT
ALTER TABLE listing ADD FOREIGN KEY (host_id) REFERENCES airbnb_hosts(host_Id)  ON DELETE CASCADE;
                
SELECT 
    *
FROM
    listing;

CREATE TABLE property_availability (
	prop_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	listing_Id INT,
 	available_date DATE,
 	available BOOLEAN,
 	price FLOAT

); 

INSERT into property_availability (
				listing_Id,
                available_date,
                available,
                price
			) values 
				(1,'2022-3-26',true,230),
				(2,'2022-5-16',true,320),
				(3,'2022-7-13',true,110),
                (4,'2022-8-3',true,400),
                (5,'2022-7-2',true,450);
                
# ALTER AND ADD FOREIGN KEY CONSTRAINT
ALTER TABLE property_availability ADD FOREIGN KEY (listing_Id) REFERENCES listing(listing_Id)  ON DELETE CASCADE;
                
SELECT 
    *
FROM
    property_availability;
    
CREATE TABLE property_reviews (
	review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	listing_id INT,
 	review_date DATE,
 	reviewer_id INT,
 	reviewer_name VARCHAR(100),
 	comments MEDIUMTEXT
); 

INSERT into property_reviews (
 	listing_id,
 	review_date,
 	reviewer_id,
 	reviewer_name,
 	comments
			) values 
				(1,'2022-8-22',1,'John','very nnice service'),
				(2,'2022-9-25',2,'Elijah','you made our day!!'),
				(3,'2022-10-12',3,'Samuel','Big thanks'),
                (4,'2022-7-11',4,'Ruth','The best host I even seen'),
                (5,'2022-3-19',5,'Miriam','One of the best');
                
#ALTER AND ADD FOREIGN KEY CONSTRAINT
ALTER TABLE property_reviews ADD FOREIGN KEY (listing_Id) REFERENCES listing(listing_Id)  ON DELETE CASCADE;
                
SELECT 
    *
FROM
    property_reviews;
    
#	What is the average price for a listing with 8 bedrooms
    select AVG(price) from listing where bedrooms = 8;
    
#	Select host id, host name, host location from Airbnb hosts table, and select listing_name,street and state from listing table by using join
select a.host_Id,a.host_name,a.host_location,l.listing_name,l.street,l.state from airbnb_hosts a join listing l on l.host_id = a.host_Id;

#	Select beds, bedrooms and bed type from listing table
select beds,bedrooms,bed_type from listing;

#	What is the average price in the property availability table
select AVG(price) from property_availability;

#	select  price and available date from property availability table and select review date and reviewer date from property reviews table by using left join
select pa.price,pa.available_date,pr.review_date,pr.reviewer_name from property_availability pa left join property_reviews pr on pr.listing_id = pa.listing_Id;

#	Select review id, listing id and reviewer id from property reviews table.  
select review_id,listing_id,reviewer_id from property_reviews;

#	Select review score rating, review scores accuracy, review scores cleanliness, review scores checkin, review score communication and review score location from listings table.
select review_scores_rating,review_scores_accuracy,review_scores_cleanliness,review_scores_checkin,review_scores_communication,review_scores_location from listing;







