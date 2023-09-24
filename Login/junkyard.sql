BEGIN;
CREATE DATABASE IF NOT EXISTS Junkyard;
USE Junkyard;

CREATE TABLE PART (
    PART_ID INT PRIMARY KEY,
    PART_NAME VARCHAR(45),
    PART_COST INT,
    PART_CATEGORY VARCHAR(45)
);

CREATE TABLE ENGINE (
    ENGINE_ID INT PRIMARY KEY,
    MAKE VARCHAR(45),
    MODEL VARCHAR(45),
    CYLINDERS VARCHAR(45),
    INDUCTION VARCHAR(45),
    DISPLACEMENT VARCHAR(45)
);

CREATE TABLE CAR (
    CAR_ID INT PRIMARY KEY,
    MAKE VARCHAR(45),
    MODEL VARCHAR(45),
    YEAR INT,
    VIN VARCHAR(45),
    ENGINE_ID INT REFERENCES ENGINE(ENGINE_ID)
);

CREATE TABLE LISTING (
    LISTING_ID INT PRIMARY KEY,
    LISTING_LOT INT,
    LISTING_DATE DATE,
    LISTING_VIN VARCHAR(45),
    LISTING_EXT_COLOR VARCHAR(45),
    LISTING_INT_COLOR VARCHAR(45),
    CAR_ID INT REFERENCES CAR(CAR_ID),
    ENGINE_ID INT REFERENCES ENGINE(ENGINE_ID),
    LISTING_PARTS_LISTING_ID INT
);

CREATE TABLE LISTING_PARTS (
    LISTING_ID INT,
    PART_ID INT,
    PRIMARY KEY (LISTING_ID, PART_ID),
    FOREIGN KEY (LISTING_ID) REFERENCES LISTING(LISTING_ID),
    FOREIGN KEY (PART_ID) REFERENCES PART(PART_ID)
);

-- Sample values for PART table
INSERT INTO PART (PART_ID, PART_NAME, PART_COST, PART_CATEGORY)
VALUES
(1, 'Spark Plug', 5.99, 'Engine'),
(2, 'Oil Filter', 6.49, 'Engine'),
(3, 'Brake Pad Set', 24.99, 'Brakes'),
(4, 'Brake Rotor', 18.75, 'Brakes'),
(5, 'Air Filter', 7.99, 'Engine'),
(6, 'Headlight Bulb', 3.49, 'Electrical'),
(7, 'Battery', 49.99, 'Electrical'),
(8, 'Windshield Wiper Blades', 9.99, 'Exterior'),
(9, 'Transmission Fluid', 12.99, 'Transmission'),
(10, 'Radiator Hose', 8.25, 'Cooling System'),
(11, 'Tire Pressure Gauge', 4.99, 'Tools'),
(12, 'Power Steering Fluid', 9.99, 'Steering'),
(13, 'Cabin Air Filter', 12.99, 'Interior'),
(14, 'Wheel Hub Assembly', 35.49, 'Suspension'),
(15, 'Serpentine Belt', 14.99, 'Engine'),
(16, 'Oxygen Sensor', 22.99, 'Engine'),
(17, 'Fuel Pump', 45.99, 'Fuel System'),
(18, 'Shock Absorber', 19.99, 'Suspension'),
(19, 'Strut Assembly', 28.75, 'Suspension'),
(20, 'Ignition Coil', 12.49, 'Electrical'),
(21, 'Starter Motor', 27.99, 'Electrical'),
(22, 'Alternator', 38.99, 'Electrical'),
(23, 'Clutch Kit', 42.99, 'Transmission'),
(24, 'Drive Belt', 6.99, 'Engine'),
(25, 'Exhaust Pipe', 34.99, 'Exhaust'),
(26, 'Fuel Injector', 16.49, 'Fuel System'),
(27, 'Thermostat', 8.99, 'Cooling System'),
(28, 'Steering Wheel Cover', 5.99, 'Interior'),
(29, 'Car Cover', 24.99, 'Exterior'),
(30, 'Wheel Locks', 9.49, 'Security'),
(31, 'Floor Mats', 15.99, 'Interior'),
(32, 'Trailer Hitch', 27.99, 'Towing'),
(33, 'Shock Mount', 5.49, 'Suspension'),
(34, 'Car Wash Kit', 12.99, 'Exterior'),
(35, 'Bug Deflector', 8.99, 'Exterior'),
(36, 'GPS Navigation System', 89.99, 'Electronics'),
(37, 'Car Air Freshener', 2.49, 'Interior'),
(38, 'Rearview Mirror', 9.99, 'Interior'),
(39, 'Brake Fluid', 4.99, 'Brakes'),
(40, 'Transmission Mount', 11.99, 'Transmission'),
(41, 'Catalytic Converter', 67.99, 'Exhaust'),
(42, 'Tie Rod End', 12.75, 'Steering'),
(43, 'Radiator Cap', 3.49, 'Cooling System'),
(44, 'Timing Belt', 15.49, 'Engine'),
(45, 'Car Battery Charger', 24.99, 'Electrical'),
(46, 'Engine Control Module', 58.99, 'Engine'),
(47, 'Brake Caliper', 18.99, 'Brakes'),
(48, 'Drive Shaft', 32.49, 'Transmission'),
(49, 'Ignition Control Module', 14.99, 'Electrical'),
(50, 'Wheel Bearing', 10.99, 'Suspension');

-- Sample values for ENGINE table
INSERT INTO ENGINE (ENGINE_ID, MAKE, MODEL, CYLINDERS, INDUCTION, DISPLACEMENT)
VALUES
(1, 'Toyota', 'Camry', 4, 'Turbocharged', 2.5),
(2, 'Honda', 'Civic', 4, 'Naturally Aspirated', 1.8),
(3, 'Ford', 'Mustang', 6, 'Supercharged', 3.7),
(4, 'Chevrolet', 'Corvette', 8, 'Naturally Aspirated', 6.2),
(5, 'Subaru', 'Impreza', 4, 'Turbocharged', 2.0),
(6, 'Mitsubishi', 'Lancer', 4, 'Naturally Aspirated', 2.0),
(7, 'Nissan', 'Maxima', 6, 'Turbocharged', 3.5),
(8, 'Volkswagen', 'Golf', 4, 'Naturally Aspirated', 1.4),
(9, 'BMW', '3 Series', 4, 'Turbocharged', 2.0),
(10, 'Mercedes-Benz', 'C-Class', 6, 'Supercharged', 3.0),
(11, 'Audi', 'A4', 4, 'Turbocharged', 2.0),
(12, 'Lexus', 'ES', 6, 'Naturally Aspirated', 3.5),
(13, 'Hyundai', 'Elantra', 4, 'Naturally Aspirated', 2.0),
(14, 'Kia', 'Optima', 4, 'Turbocharged', 2.0),
(15, 'Jeep', 'Wrangler', 6, 'Naturally Aspirated', 3.6),
(16, 'Ram', '1500', 8, 'Supercharged', 5.7),
(17, 'Chevrolet', 'Silverado', 8, 'Turbocharged', 6.2),
(18, 'GMC', 'Sierra', 8, 'Naturally Aspirated', 5.3),
(19, 'Dodge', 'Charger', 6, 'Supercharged', 3.6),
(20, 'Chrysler', '300', 6, 'Naturally Aspirated', 3.6),
(21, 'Jaguar', 'XE', 4, 'Turbocharged', 2.0),
(22, 'Land Rover', 'Range Rover', 8, 'Supercharged', 5.0),
(23, 'Volvo', 'S60', 4, 'Turbocharged', 2.0),
(24, 'Mazda', 'Mazda3', 4, 'Naturally Aspirated', 2.5),
(25, 'Tesla', 'Model 3', 0, 'Electric', 0.0),
(26, 'Acura', 'TLX', 6, 'Naturally Aspirated', 3.5),
(27, 'Infiniti', 'Q50', 6, 'Turbocharged', 3.0),
(28, 'Buick', 'Regal', 4, 'Naturally Aspirated', 2.0),
(29, 'Cadillac', 'ATS', 4, 'Turbocharged', 2.0),
(30, 'Lincoln', 'Continental', 6, 'Supercharged', 3.7),
(31, 'Porsche', '911', 6, 'Turbocharged', 3.0),
(32, 'Ferrari', '488', 8, 'Twin Turbocharged', 3.9),
(33, 'Lamborghini', 'Huracan', 10, 'Naturally Aspirated', 5.2),
(34, 'McLaren', '720S', 8, 'Twin Turbocharged', 4.0),
(35, 'Bugatti', 'Chiron', 16, 'Quad Turbocharged', 8.0),
(36, 'Koenigsegg', 'Jesko', 8, 'Twin Turbocharged', 5.0),
(37, 'Fiat', '500', 4, 'Naturally Aspirated', 1.4),
(38, 'Smart', 'Fortwo', 3, 'Naturally Aspirated', 0.9),
(39, 'Mini', 'Cooper', 4, 'Turbocharged', 2.0),
(40, 'Aston Martin', 'DB11', 12, 'Twin Turbocharged', 5.2),
(41, 'Rolls-Royce', 'Phantom', 12, 'Naturally Aspirated', 6.8),
(42, 'Bentley', 'Continental GT', 12, 'Twin Turbocharged', 6.0),
(43, 'Maserati', 'GranTurismo', 8, 'Naturally Aspirated', 4.7),
(44, 'Alfa Romeo', 'Giulia', 4, 'Turbocharged', 2.0),
(45, 'Lotus', 'Evora', 6, 'Supercharged', 3.5),
(46, 'Genesis', 'G70', 4, 'Turbocharged', 2.0),
(47, 'Subaru', 'BRZ', 4, 'Naturally Aspirated', 2.4),
(48, 'Tesla', 'Model S', 0, 'Electric', 0.0),
(49, 'Nissan', 'Leaf', 0, 'Electric', 0.0),
(50, 'Porsche', 'Taycan', 0, 'Electric', 0.0);

-- Sample values for CAR table
INSERT INTO CAR (CAR_ID, MAKE, MODEL, YEAR, VIN, ENGINE_ID)
VALUES
(1, 'Toyota', 'Camry', 2022, '1HGCM82633A123456', 101),
(2, 'Honda', 'Civic', 2021, '2HGFC2F58JH567890', 102),
(3, 'Ford', 'F-150', 2020, '1FTFX1EFXAF678901', 103),
(4, 'Chevrolet', 'Malibu', 2022, '1G1ZD5ST0LF123456', 104),
(5, 'Nissan', 'Altima', 2021, '1N4AL3AP1JC567890', 105),
(6, 'Hyundai', 'Elantra', 2022, '5NPD84LF8NH123456', 106),
(7, 'Kia', 'Sorento', 2020, '5XYPGDA33LG678901', 107),
(8, 'Toyota', 'RAV4', 2021, '2T3H1RFV3MW567890', 108),
(9, 'Honda', 'CR-V', 2020, '7FARW2H54LE678901', 109),
(10, 'Ford', 'Escape', 2022, '1FMCU9H60NU123456', 110),
(11, 'Chevrolet', 'Silverado', 2021, '1GC4YPE78MF567890', 111),
(12, 'Nissan', 'Rogue', 2020, '5N1AT2MV4LC678901', 112),
(13, 'Hyundai', 'Tucson', 2022, 'KM8J3CA46NU123456', 113),
(14, 'Kia', 'Sportage', 2021, 'KNDPMCAC0M567890', 114),
(15, 'Toyota', 'Corolla', 2020, 'JTDEPRAEXL567890', 115),
(16, 'Honda', 'Accord', 2022, '1HGCV2F13MA123456', 116),
(17, 'Ford', 'Explorer', 2021, '1FM5K8GC6M567890', 117),
(18, 'Chevrolet', 'Equinox', 2020, '2GNAXSEV5L678901', 118),
(19, 'Nissan', 'Sentra', 2022, '3N1AB8DV7NY123456', 119),
(20, 'Hyundai', 'Santa Fe', 2021, '5NMS3DAG1NH567890', 120),
(21, 'Kia', 'Optima', 2020, '5XXGT4L39LG678901', 121),
(22, 'Toyota', 'Highlander', 2022, '5TDFZRBH2NS123456', 122),
(23, 'Honda', 'Pilot', 2021, '5FNYF8H99MB567890', 123),
(24, 'Ford', 'Mustang', 2020, '1FA6P8TH5L678901', 124),
(25, 'Chevrolet', 'Cruze', 2022, '3G1BE6SM9NS123456', 125),
(26, 'Nissan', 'Maxima', 2021, '1N4AA6CV9MC567890', 126),
(27, 'Hyundai', 'Sonata', 2020, '5NPE34AF9L678901', 127),
(28, 'Kia', 'Forte', 2022, '3KPF34AD2NE123456', 128),
(29, 'Toyota', 'Sienna', 2021, '5TDRZ3DC7MS567890', 129),
(30, 'Honda', 'Fit', 2020, '3HGGK5H89LM678901', 130),
(31, 'Ford', 'Edge', 2022, '2FMPK4J92NB123456', 131),
(32, 'Chevrolet', 'Traverse', 2021, '1GNEVKKW3MJ567890', 132),
(33, 'Nissan', '370Z', 2020, 'JN1AZ4EH3LM678901', 133),
(34, 'Hyundai', 'Veloster', 2022, 'KMHTH6ABXNU123456', 134),
(35, 'Kia', 'Soul', 2021, 'KNDJP3A57M567890', 135),
(36, 'Toyota', 'Tacoma', 2020, '3TMCZ5AN5LM678901', 136),
(37, 'Honda', 'HR-V', 2022, '3CZRU6H71NM123456', 137),
(38, 'Ford', 'Ranger', 2021, '1FTER4EH9ML567890', 138),
(39, 'Chevrolet', 'Suburban', 2020, '1GNSKHKC3LR678901', 139),
(40, 'Nissan', 'Versa', 2022, '3N1CN8EV5NL123456', 140),
(41, 'Hyundai', 'Kona', 2021, 'KM8K1CAA6MU567890', 141),
(42, 'Kia', 'Telluride', 2020, '5XYP34HC6LG678901', 142),
(43, 'Toyota', '4Runner', 2022, 'JTEBU5JR1N1234567', 143),
(44, 'Honda', 'Insight', 2021, 'JHMZE2H84MS567890', 144),
(45, 'Ford', 'Expedition', 2020, '1FMJK1KT2LE678901', 145),
(46, 'Chevrolet', 'Blazer', 2022, '3GNKBGRS2NS123456', 146),
(47, 'Nissan', 'Frontier', 2021, '1N6ED0E41MN567890', 147),
(48, 'Hyundai', 'Ioniq', 2020, 'KMHC65LC3LU678901', 148),
(49, 'Kia', 'Cadenza', 2022, 'KNALC4J12N123456', 149),
(50, 'Toyota', 'Yaris', 2021, '3MYDLBYV1MS567890', 150);

-- Sample values for LISTING table
INSERT INTO LISTING (LISTING_ID, LISTING_LOT, LISTING_DATE, LISTING_VIN, LISTING_EXT_COLOR, LISTING_INT_COLOR, CAR_ID, ENGINE_ID, LISTING_PARTS_LISTING_ID)
VALUES
(1, 'Lot-001', '2023-09-01', 'ABC123456789XYZ001', 'Blue', 'Beige', 1, 1, 101),
(2, 'Lot-002', '2023-09-02', 'DEF987654321XYZ002', 'Red', 'Black', 2, 2, 102),
(3, 'Lot-003', '2023-09-03', 'GHI456789123XYZ003', 'Silver', 'Gray', 3, 3, 103),
(4, 'Lot-004', '2023-09-04', 'JKL789123456XYZ004', 'White', 'Tan', 4, 4, 104),
(5, 'Lot-005', '2023-09-05', 'MNO321654987XYZ005', 'Black', 'Red', 5, 5, 105),
(6, 'Lot-006', '2023-09-06', 'PQR654987321XYZ006', 'Green', 'Brown', 6, 6, 106),
(7, 'Lot-007', '2023-09-07', 'STU987321654XYZ007', 'Gray', 'Blue', 7, 7, 107),
(8, 'Lot-008', '2023-09-08', 'VWX123654987XYZ008', 'Brown', 'Green', 8, 8, 108),
(9, 'Lot-009', '2023-09-09', 'YZA987456321XYZ009', 'Tan', 'White', 9, 9, 109),
(10, 'Lot-010', '2023-09-10', 'BCD654987321XYZ010', 'Red', 'Silver', 10, 10, 110),
(11, 'Lot-011', '2023-09-11', 'EFG987321654XYZ011', 'Beige', 'Blue', 11, 11, 111),
(12, 'Lot-012', '2023-09-12', 'HIJ321987654XYZ012', 'Blue', 'Gray', 12, 12, 112),
(13, 'Lot-013', '2023-09-13', 'KLM987654321XYZ013', 'Black', 'Tan', 13, 13, 113),
(14, 'Lot-014', '2023-09-14', 'NOP654321987XYZ014', 'Silver', 'Red', 14, 14, 114),
(15, 'Lot-015', '2023-09-15', 'QRS321987654XYZ015', 'Gray', 'Green', 15, 15, 115),
(16, 'Lot-016', '2023-09-16', 'TUV987654321XYZ016', 'Green', 'Blue', 16, 16, 116),
(17, 'Lot-017', '2023-09-17', 'WXY321987654XYZ017', 'Brown', 'Black', 17, 17, 117),
(18, 'Lot-018', '2023-09-18', 'YZA987654321XYZ018', 'Tan', 'White', 18, 18, 118),
(19, 'Lot-019', '2023-09-19', 'BCD321987654XYZ019', 'Red', 'Silver', 19, 19, 119),
(20, 'Lot-020', '2023-09-20', 'EFG987654321XYZ020', 'Beige', 'Blue', 20, 20, 120),
(21, 'Lot-021', '2023-09-21', 'HIJ321987654XYZ021', 'Blue', 'Gray', 21, 21, 121),
(22, 'Lot-022', '2023-09-22', 'KLM987654321XYZ022', 'Black', 'Tan', 22, 22, 122),
(23, 'Lot-023', '2023-09-23', 'NOP321987654XYZ023', 'Silver', 'Red', 23, 23, 123),
(24, 'Lot-024', '2023-09-24', 'QRS987654321XYZ024', 'Gray', 'Green', 24, 24, 124),
(25, 'Lot-025', '2023-09-25', 'TUV321987654XYZ025', 'Green', 'Blue', 25, 25, 125),
(26, 'Lot-026', '2023-09-26', 'WXY987654321XYZ026', 'Brown', 'Black', 26, 26, 126),
(27, 'Lot-027', '2023-09-27', 'YZA321987654XYZ027', 'Tan', 'White', 27, 27, 127),
(28, 'Lot-028', '2023-09-28', 'BCD987654321XYZ028', 'Red', 'Silver', 28, 28, 128),
(29, 'Lot-029', '2023-09-29', 'EFG321987654XYZ029', 'Beige', 'Blue', 29, 29, 129),
(30, 'Lot-030', '2023-09-30', 'HIJ987654321XYZ030', 'Blue', 'Gray', 30, 30, 130),
(31, 'Lot-031', '2023-10-01', 'KLM321987654XYZ031', 'Black', 'Tan', 31, 31, 131),
(32, 'Lot-032', '2023-10-02', 'NOP987654321XYZ032', 'Silver', 'Red', 32, 32, 132),
(33, 'Lot-033', '2023-10-03', 'QRS321987654XYZ033', 'Gray', 'Green', 33, 33, 133),
(34, 'Lot-034', '2023-10-04', 'TUV987654321XYZ034', 'Green', 'Blue', 34, 34, 134),
(35, 'Lot-035', '2023-10-05', 'WXY321987654XYZ035', 'Brown', 'Black', 35, 35, 135),
(36, 'Lot-036', '2023-10-06', 'YZA987654321XYZ036', 'Tan', 'White', 36, 36, 136),
(37, 'Lot-037', '2023-10-07', 'BCD321987654XYZ037', 'Red', 'Silver', 37, 37, 137),
(38, 'Lot-038', '2023-10-08', 'EFG987654321XYZ038', 'Beige', 'Blue', 38, 38, 138),
(39, 'Lot-039', '2023-10-09', 'HIJ321987654XYZ039', 'Blue', 'Gray', 39, 39, 139),
(40, 'Lot-040', '2023-10-10', 'KLM987654321XYZ040', 'Black', 'Tan', 40, 40, 140),
(41, 'Lot-041', '2023-10-11', 'NOP321987654XYZ041', 'Silver', 'Red', 41, 41, 141),
(42, 'Lot-042', '2023-10-12', 'QRS987654321XYZ042', 'Gray', 'Green', 42, 42, 142),
(43, 'Lot-043', '2023-10-13', 'TUV321987654XYZ043', 'Green', 'Blue', 43, 43, 143),
(44, 'Lot-044', '2023-10-14', 'WXY987654321XYZ044', 'Brown', 'Black', 44, 44, 144),
(45, 'Lot-045', '2023-10-15', 'YZA321987654XYZ045', 'Tan', 'White', 45, 45, 145),
(46, 'Lot-046', '2023-10-16', 'BCD987654321XYZ046', 'Red', 'Silver', 46, 46, 146),
(47, 'Lot-047', '2023-10-17', 'EFG321987654XYZ047', 'Beige', 'Blue', 47, 47, 147),
(48, 'Lot-048', '2023-10-18', 'HIJ987654321XYZ048', 'Blue', 'Gray', 48, 48, 148),
(49, 'Lot-049', '2023-10-19', 'KLM321987654XYZ049', 'Black', 'Tan', 49, 49, 149),
(50, 'Lot-050', '2023-10-20', 'NOP987654321XYZ050', 'Silver', 'Red', 50, 50, 150);


-- Sample values for LISTING_PARTS table
INSERT INTO LISTING_PARTS (LISTING_ID, PART_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48),
(49, 49),
(50, 50);
