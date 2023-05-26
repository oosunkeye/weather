6.8
CREATE TABLE "Weather"(
	"weatherId" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
	"cityId" integer NOT NULL,
	"userId" integer NOT NULL,
	"weatherStatusId" integer NOT NULL,
	"description" varchar NOT NULL,
	"icon" varchar NOT NULL,
	"sunrise" timestamp without time zone NOT NULL,
	"sunset" timestamp without time zone NOT NULL,
	"temp" numeric NOT NULL,
	"feelsLike" numeric NOT NULL,
	"tempMin" numeric NOT NULL,
	"tempMax" numeric NOT NULL,
	"pressure" numeric NOT NULL,
	"humidity" numeric NOT NULL,
	"visibility" numeric NOT NULL,
	"windSpeed" numeric NOT NULL,
	"windDirection" numeric NOT NULL,
	"cloudsAll" numeric NOT NULL,
	"updatedOn" timestamp without time zone NOT NULL,
	CONSTRAINT "Weather_pkey" PRIMARY KEY ("weatherId"),
	CONSTRAINT "Weather_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City"("cityId"),
	CONSTRAINT "Weather_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("userId")
);

INSERT INTO "Weather"("cityId", "userId", "weatherStatusId", "description", "icon","sunrise",
				   "sunset", "temp", "feelsLike", "tempMin", "tempMax", "pressure", "humidity",
				   "visibility", "windSpeed", "windDirection", "cloudsAll", "updatedOn")
VALUES (1, 2, 3, 'Cloudy with a chance of rain', '01n', '2023-02-22 06:30:00', '2023-02-22 18:30:00', 12.5, 10.5, 9.5, 15.5, 1015, 75, 8000, 5.5, 180, 80, '2023-02-22 12:30:00');

SELECT * FROM "Weather"
WHERE "cityId" = 1;

UPDATE "Weather"
SET "temp" = 15.0
WHERE "weatherId" = 1;

INSERT INTO "Weather"("cityId", "userId", "weatherStatusId", "description", "icon","sunrise",
				   "sunset", "temp", "feelsLike", "tempMin", "tempMax", "pressure", "humidity",
				   "visibility", "windSpeed", "windDirection", "cloudsAll", "updatedOn")
VALUES (2, 2, 200, 'scattered clouds', '03d', '2023-02-23 06:39:53', '2023-02-23 17:50:39', 19.2, 18.3, 18.5, 20.8, 1010.0, 74.0, 10000, 3.0, 170.0, 40.0, '2023-02-23 13:45:00');

SELECT * FROM "Weather"

----------------------


6.7
CREATE TABLE "City"(
	"cityId" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	"timezone" varchar NOT NULL,
	"longitude" numeric NOT NULL,
	"latitude" numeric NOT NULL,
	"weatherCityId" integer NOT NULL,
	"countryId" integer NOT NULL,
	CONSTRAINT "City_pkey" PRIMARY KEY ("cityId"),
	CONSTRAINT "City_countryId_fkey" FOREIGN KEY ("countryId")
	REFERENCES "Country"("countryId")
);

INSERT INTO "City"("name", "timezone", "longitude", "latitude", "weatherCityId", "countryId")
VALUES ('London', 'GMT', -0.1278, 51.5074, 12345, 1);

SELECT * FROM "City";

SELECT * FROM "City"
WHERE "cityId" = 1;

UPDATE "City"
SET "timezone" = 'BST'
WHERE "cityId" = 1;

INSERT INTO "City"("name", "timezone", "longitude", "latitude", "weatherCityId", "countryId")
VALUES ('Paris', 'CET', 2.3522, 48.8566, 54321, 2);

SELECT * FROM "City"
WHERE "countryId" = 2;

UPDATE "City"
SET "timezone" = 'UTC';

--------------------

6.6
CREATE TABLE "Country"(
	"countryId" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
	"countryCode" varchar NOT NULL,
	CONSTRAINT "Country_pkey" PRIMARY KEY ("countryId")
);

INSERT INTO "Country"("countryCode")
VALUES ('CA'),('DE'),('IT');

SELECT * FROM "Country";

SELECT * FROM "Country"
WHERE "countryId" = 3;

UPDATE "Country"
SET "countryCode" = 'UK'
WHERE "countryId" = 1;

UPDATE "Country"
SET "countryCode" = 'FR'
WHERE "countryId" = 2;

DELETE FROM "Country"
WHERE "countryId" =3;

------------------

6.5
CREATE TABLE "User"(
	"userId" integer NOT NULL GENERATED ALWAYS AS IDENTITY,
	"firstName" varchar NOT NULL,
	"lastName" varchar NOT NULL,
	"username" varchar NOT NULL,
	"phone" varchar NOT NULL,
	"emailId" varchar NOT NULL,
	"password" varchar NOT NULL,
	"emailVerified" boolean NOT NULL,
	"createdOn" timestamp without time zone NOT NULL,
	CONSTRAINT "User_pkey" PRIMARY KEY ("userId"),
	CONSTRAINT "User_emailId_key" UNIQUE ("emailId"),
	CONSTRAINT "User_username_key" UNIQUE ("username")
);

INSERT INTO "User"("firstName", "lastName", "username", "phone", "emailId", "password", "emailVerified", "createdOn")
VALUES ('Amy', 'Lee', 'amylee', '+1-555-9012', 'amylee@example.com', 'password789', true, NOW()),
('Tom', 'Jones', 'tomjones', '+1-555-3456', 'tomjones@example.com', 'passwordabc', false, NOW());

SELECT * from "User";

SELECT * from "User"
WHERE "emailVerified" = true;

SELECT * from "User"
WHERE "userId" = 1;

SELECT * from "User"
WHERE "emailId" = 'johndoe@example.com';