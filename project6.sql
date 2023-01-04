create database geospacial;

use geospacial;

CREATE TABLE bc_roads  (
	gId INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
 	gName varchar(255),
 	the_geom GEOMETRY
); 

SET @g1 = 'LINESTRING(0 0,1 2,2 4)';
SET @g2 = 'LINESTRING(0 0, 10 10, 20 25, 50 60)';
SET @g3 = 'LINESTRING(0 0,1 3,2 5,3 5,4 7)';
SET @g4 = 'LINESTRING(15 15, 30 15)';
SET @g5 = 'LineString(1 1,2 2,3 3)';

INSERT into bc_roads (
				gName,
                the_geom
			) values 
				('High Street',ST_GeomFromText(@g1)),
				('Station Road',ST_GeomFromText(@g2)),
				('Victoria Road',ST_GeomFromText(@g3)),
                ('Park Avenue',ST_GeomFromText(@g4)),
                ('The Crescent',ST_GeomFromText(@g5));
               
SELECT 
    gId,gName,ST_AsText(the_geom)
FROM
    bc_roads;
    

CREATE TABLE bc_municipality (
	gId INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
    gCode INT NOT NULL UNIQUE,
 	gName varchar(255),
 	the_geom GEOMETRY
); 
truncate table bc_municipality;
SET @p1 = 'POLYGON((0 0,8 0,12 9,0 9,0 0),(5 3,4 5,7 9,3 7, 5 3))';
SET @p2 = 'POLYGON((0 0,10 0,10 10,0 10,0 0),(5 5,7 5,7 7,5 7, 5 5))';
SET @p3 = 'POLYGON((0 0, 0 3, 3 3, 3 0, 0 0), (1 1, 1 2, 2 1, 1 1))';
SET @p4 = 'POLYGON((1 1, 3 1, 3 7, 1 7, 1 1))';
SET @p5 = 'POLYGON((10 1, 10 9, 4 9, 10 1),(9 4, 9 8, 6 8, 9 4))';
INSERT into bc_municipality (
				gCode,
				gName,
                the_geom
			) values 
				(1,'city of Prince George',ST_GeomFromText(@p1)),
				(2,'Greater London',ST_GeomFromText(@p2)),
				(3,'Willington',ST_GeomFromText(@p3)),
                (4,'Wales',ST_GeomFromText(@p4)),
                (5,'Manchester',ST_GeomFromText(@p5));
               
SELECT 
    gId,gCode,gName,ST_AsText(the_geom)
FROM
    bc_municipality;

#CREATE SPATIAL REFERENCE SYSTEM 1162758476 NAME 'TINA009' ORGANIZATION 'TINA009' IDENTIFIED BY 1162758476 DEFINITION 'GEOGCS["TINA009",DATUM["TINA009",SPHEROID["Bessel 1841",6377397.155,299.1528128,AUTHORITY["TINA009","7004"]],AUTHORITY["TINA009","6120"]],PRIMEM["Greenwich",0,AUTHORITY["TINA009","8901"]],UNIT["degree",0.017453292519943278,AUTHORITY["TINA009","9122"]],AXIS["Lat",NORTH],AXIS["Lon",EAST],AUTHORITY["TINA009","4120"]]';    

#DROP SPATIAL REFERENCE SYSTEM 1162758476;   

# 	What is the total length of all roads, expressed in kilometres?

#SET @ls1 = ST_GeomFromText(@g1, 4326);
SET @dist_1 = ST_Length( ST_GeomFromText(@g1, 4326) ,'kilometre');
#SET @ls2 = ST_GeomFromText(@g2, 4326);
SET @dist_2 = ST_Length(ST_GeomFromText(@g2, 4326),'kilometre');
#SET @ls3 = ST_GeomFromText(@g3, 4326);
SET @dist_3 = ST_Length(ST_GeomFromText(@g3, 4326),'kilometre');
#SET @ls4 = ST_GeomFromText(@g4, 4326);
SET @dist_4 = ST_Length(ST_GeomFromText(@g4, 4326),'kilometre');
#SET @ls5 = ST_GeomFromText(@g5, 4326);
SET @dist_5 = ST_Length(ST_GeomFromText(@g5, 4326),'kilometre');

SELECT @dist_1+@dist_2+@dist_3+@dist_4+@dist_5 as total_road_length_km;

# How large is the city of Prince George, in hectares?
SELECT ST_Area(the_geom)* 0.3048^2/10000 as area_in_hectares from bc_municipality where gName = 'city of Prince George';

#	What is the largest municipality in the province, by area?
SELECT ST_Area(the_geom),gName from bc_municipality order by ST_Area(the_geom) desc limit 1;

