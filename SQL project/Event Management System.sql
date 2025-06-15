CREATE DATABASE TechConfoDB
USE TechConfoDB
/*1sttable*/
CREATE TABLE Conference (
  conference_id INT PRIMARY KEY,
  name VARCHAR(100),
  start_date DATE,
  end_date DATE,
  location VARCHAR(100),
  organizer_id INT,
  theme VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*2ndtable*/
CREATE TABLE Organizer (
  organizer_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(15),
  organization_name VARCHAR(100),
  designation VARCHAR(100),
  website VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*3rdtable*/
CREATE TABLE Venue (
  venue_id INT PRIMARY KEY,
  name VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50),
  capacity INT,
  is_active BOOLEAN,
  created_at TIMESTAMP
);

/*4thtable*/
CREATE TABLE Speaker (
  speaker_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(15),
  topic VARCHAR(100),
  organization VARCHAR(100),
  rating DECIMAL(3,2),
  created_at TIMESTAMP
);

/*5thtable*/
CREATE TABLE Session (
  session_id INT PRIMARY KEY,
  title VARCHAR(100),
  conference_id INT,
  speaker_id INT,
  venue_id INT,
  session_date DATE,
  start_time TIME,
  end_time TIME,
  FOREIGN KEY (conference_id) REFERENCES Conference(conference_id),
  FOREIGN KEY (speaker_id) REFERENCES Speaker(speaker_id),
  FOREIGN KEY (venue_id) REFERENCES Venue(venue_id)
);

/*6thtable*/
CREATE TABLE Attendee (
  attendee_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(15),
  gender VARCHAR(10),
  dob DATE,
  organization VARCHAR(100),
  is_student BOOLEAN
);

/*7thtable*/
CREATE TABLE Registration (
  registration_id INT PRIMARY KEY,
  attendee_id INT,
  session_id INT,
  registration_date TIMESTAMP,
  payment_status VARCHAR(20),
  ticket_type VARCHAR(50),
  amount_paid DECIMAL(8,2),
  checked_in BOOLEAN,
  FOREIGN KEY (attendee_id) REFERENCES Attendee(attendee_id),
  FOREIGN KEY (session_id) REFERENCES Session(session_id)
);

/*8thtable*/
CREATE TABLE Feedback (
  feedback_id INT PRIMARY KEY,
  registration_id INT,
  rating INT,
  comments TEXT,
  submitted_at TIMESTAMP,
  would_recommend BOOLEAN,
  reviewed BOOLEAN,
  is_public BOOLEAN,
  FOREIGN KEY (registration_id) REFERENCES Registration(registration_id)
);

/*9thtable*/
CREATE TABLE Sponsor (
  sponsor_id INT PRIMARY KEY,
  name VARCHAR(100),
  contact_person VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(15),
  address VARCHAR(150),
  sponsorship_amount DECIMAL(10,2),
  conference_id INT,
  FOREIGN KEY (conference_id) REFERENCES Conference(conference_id)
);


SELECT * FROM Organizer
SELECT * FROM Conference
SELECT * FROM Venue
SELECT * FROM Speaker
SELECT * FROM Session
SELECT * FROM Attendee
SELECT * FROM Registration
SELECT * FROM Feedback
SELECT * FROM Sponsor


/*1sttablevalue*/
INSERT INTO Conference (conference_id, name, start_date, end_date, location, organizer_id, theme, created_at)
VALUES
(1, 'TechWorld 2025', '2025-07-01', '2025-07-03', 'Bangalore', 1, 'AI & Innovation', NOW()),
(2, 'CodeSummit', '2025-08-10', '2025-08-12', 'Chennai', 2, 'Full Stack & DevOps', NOW()),
(3, 'AI Conclave', '2025-09-05', '2025-09-07', 'Hyderabad', 3, 'Machine Learning', NOW()),
(4, 'CyberTech', '2025-10-15', '2025-10-17', 'Delhi', 4, 'Cyber Defence', NOW()),
(5, 'DataVerse', '2025-11-01', '2025-11-03', 'Mumbai', 5, 'Data Science', NOW()),
(6, 'FutureTech', '2025-12-01', '2025-12-03', 'Pune', 6, 'AR/VR & Blockchain', NOW()),
(7, 'MobileExpo', '2025-09-10', '2025-09-12', 'Kolkata', 7, 'Mobile Dev', NOW()),
(8, 'TechFusion', '2025-07-20', '2025-07-22', 'Jaipur', 8, 'Mixed Tech', NOW()),
(9, 'GreenTech', '2025-08-15', '2025-08-17', 'Ahmedabad', 9, 'Sustainable Tech', NOW()),
(10, 'IoT Vision', '2025-09-25', '2025-09-27', 'Coimbatore', 10, 'IoT & Embedded', NOW());

/*2ndtablevalue*/
INSERT INTO Organizer (organizer_id, name, email, phone, organization_name, designation, website, created_at)
VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', '9876543210', 'TechEvents Inc.', 'Event Manager', 'https://techevents.com', NOW()),
(2, 'Bob Smith', 'bob.smith@example.com', '9123456780', 'CodeSummit Org', 'Coordinator', 'https://codesummit.org', NOW()),
(3, 'Carol Lee', 'carol.lee@example.com', '9988776655', 'AI Innovators', 'Lead Organizer', 'https://aiinnovators.com', NOW()),
(4, 'David Kim', 'david.kim@example.com', '9876123456', 'CyberSec Ltd.', 'Project Head', 'https://cybersecltd.com', NOW()),
(5, 'Eva Green', 'eva.green@example.com', '8765432109', 'DataVerse Corp', 'Event Planner', 'https://dataverse.com', NOW()),
(6, 'Frank White', 'frank.white@example.com', '9012345678', 'FutureTech', 'Event Organizer', 'https://futuretech.org', NOW()),
(7, 'Grace Park', 'grace.park@example.com', '9123456789', 'MobileExpo Org', 'Coordinator', 'https://mobileexpo.com', NOW()),
(8, 'Henry Adams', 'henry.adams@example.com', '9876543211', 'TechFusion Events', 'Manager', 'https://techfusion.in', NOW()),
(9, 'Isabel Clark', 'isabel.clark@example.com', '9988776654', 'GreenTech Org', 'Coordinator', 'https://greentech.org', NOW()),
(10, 'Jack Wilson', 'jack.wilson@example.com', '9012987654', 'IoT Vision', 'Event Head', 'https://iotvision.org', NOW());

/*3rdtablevalue*/
INSERT INTO Venue (venue_id, name, city, state, country, capacity, is_active, created_at)
VALUES
(1, 'Bangalore Convention Center', 'Bangalore', 'Karnataka', 'India', 1000, TRUE, NOW()),
(2, 'Chennai Expo Center', 'Chennai', 'Tamil Nadu', 'India', 800, TRUE, NOW()),
(3, 'Hyderabad Grand Hall', 'Hyderabad', 'Telangana', 'India', 600, TRUE, NOW()),
(4, 'Delhi Conference Hall', 'Delhi', 'Delhi', 'India', 700, TRUE, NOW()),
(5, 'Mumbai Exhibition Center', 'Mumbai', 'Maharashtra', 'India', 900, TRUE, NOW()),
(6, 'Pune Tech Park', 'Pune', 'Maharashtra', 'India', 500, TRUE, NOW()),
(7, 'Kolkata Convention Center', 'Kolkata', 'West Bengal', 'India', 400, TRUE, NOW()),
(8, 'Jaipur Exhibition Grounds', 'Jaipur', 'Rajasthan', 'India', 450, TRUE, NOW()),
(9, 'Ahmedabad Tech Hub', 'Ahmedabad', 'Gujarat', 'India', 300, TRUE, NOW()),
(10, 'Coimbatore Convention Hall', 'Coimbatore', 'Tamil Nadu', 'India', 350, TRUE, NOW());

/*4thtablevalue*/
INSERT INTO Speaker (speaker_id, name, email, phone, topic, organization, rating, created_at)
VALUES
(1, 'Dr. Alice Johnson', 'alice.johnson@example.com', '9876543210', 'AI and Machine Learning', 'Tech University', 4.8, NOW()),
(2, 'Dr. Bob Smith', 'bob.smith@example.com', '9123456780', 'Cybersecurity', 'CyberSec Ltd.', 4.7, NOW()),
(3, 'Dr. Carol Lee', 'carol.lee@example.com', '9988776655', 'Data Science', 'AI Innovators', 4.6, NOW()),
(4, 'Mr. David Kim', 'david.kim@example.com', '9876123456', 'Blockchain Technology', 'CyberSec Ltd.', 4.5, NOW()),
(5, 'Ms. Eva Green', 'eva.green@example.com', '8765432109', 'Big Data', 'DataVerse Corp', 4.4, NOW()),
(6, 'Mr. Frank White', 'frank.white@example.com', '9012345678', 'Mobile App Development', 'FutureTech', 4.3, NOW()),
(7, 'Ms. Grace Park', 'grace.park@example.com', '9123456789', 'Internet of Things', 'MobileExpo Org', 4.6, NOW()),
(8, 'Mr. Henry Adams', 'henry.adams@example.com', '9876543211', 'Tech Integration', 'TechFusion Events', 4.2, NOW()),
(9, 'Ms. Isabel Clark', 'isabel.clark@example.com', '9988776654', 'Sustainable Technology', 'GreenTech Org', 4.5, NOW()),
(10, 'Mr. Jack Wilson', 'jack.wilson@example.com', '9012987654', 'IoT Devices', 'IoT Vision', 4.1, NOW());

/*5thtablevalue*/
INSERT INTO Session (session_id, title, conference_id, speaker_id, venue_id, session_date, start_time, end_time)
VALUES
(1, 'Opening Keynote', 1, 1, 1, '2025-07-01', '09:00:00', '10:30:00'),
(2, 'AI Innovations', 1, 2, 2, '2025-07-01', '11:00:00', '12:30:00'),
(3, 'Cybersecurity Panel', 4, 4, 4, '2025-10-15', '14:00:00', '15:30:00'),
(4, 'Big Data Analytics', 5, 5, 5, '2025-11-01', '10:00:00', '11:30:00'),
(5, 'Blockchain Future', 6, 6, 6, '2025-12-01', '09:30:00', '11:00:00'),
(6, 'Mobile App Development', 7, 7, 7, '2025-09-10', '13:00:00', '14:30:00'),
(7, 'Tech Integration', 8, 8, 8, '2025-07-20', '10:00:00', '11:30:00'),
(8, 'Sustainable Tech', 9, 9, 9, '2025-08-15', '09:00:00', '10:30:00'),
(9, 'IoT Devices', 10, 10, 10, '2025-09-25', '14:00:00', '15:30:00'),
(10, 'Closing Remarks', 1, 1, 1, '2025-07-03', '16:00:00', '17:00:00');

/*6thtablevalue*/
INSERT INTO Attendee (attendee_id, name, email, phone, gender, dob, organization, is_student)
VALUES
(1, 'Rahul Sharma', 'rahul.sharma@example.com', '9876543210', 'Male', '2000-03-15', 'XYZ University', TRUE),
(2, 'Sneha Patel', 'sneha.patel@example.com', '9123456780', 'Female', '1995-06-10', 'ABC Corp', FALSE),
(3, 'Amit Kumar', 'amit.kumar@example.com', '9988776655', 'Male', '2001-01-25', 'DEF Institute', TRUE),
(4, 'Pooja Singh', 'pooja.singh@example.com', '9876123456', 'Female', '1994-11-02', 'GHI Analytics', FALSE),
(5, 'Karan Mehta', 'karan.mehta@example.com', '8765432109', 'Male', '2000-09-10', 'JKL University', TRUE),
(6, 'Nisha Rao', 'nisha.rao@example.com', '9012345678', 'Female', '1993-07-18', 'MNO Security', FALSE),
(7, 'Vikram Das', 'vikram.das@example.com', '9123456789', 'Male', '2002-05-06', 'PQR College', TRUE),
(8, 'Anita Sharma', 'anita.sharma@example.com', '9876543211', 'Female', '1990-12-30', 'STU Labs', FALSE),
(9, 'Rohit Gupta', 'rohit.gupta@example.com', '9988776654', 'Male', '2001-08-20', 'VWX University', TRUE),
(10, 'Meera Nair', 'meera.nair@example.com', '9012987654', 'Female', '1996-04-12', 'YZA Tech', FALSE);

/*7thtablevalue*/
INSERT INTO Registration (registration_id, attendee_id, session_id, registration_date, payment_status, ticket_type, amount_paid, checked_in)
VALUES
(1, 1, 1, '2025-06-01 10:00:00', 'Confirmed', 'Early bird', 5000.00, TRUE),
(2, 2, 2, '2025-06-05 11:30:00', 'Confirmed', 'Standard', 6000.00, TRUE),
(3, 3, 3, '2025-06-10 09:15:00', 'Pending', 'Student', 4500.00, FALSE),
(4, 4, 4, '2025-06-12 14:45:00', 'Confirmed', 'Professional', 7000.00, TRUE),
(5, 5, 5, '2025-06-15 16:00:00', 'Cancelled', 'Standard', 6000.00, FALSE),
(6, 6, 6, '2025-06-18 13:30:00', 'Confirmed', 'Early bird', 5000.00, TRUE),
(7, 7, 7, '2025-06-20 15:00:00', 'Confirmed', 'Standard', 5500.00, TRUE),
(8, 8, 8, '2025-06-22 10:45:00', 'Pending', 'Student', 4800.00, FALSE),
(9, 9, 9, '2025-06-25 12:15:00', 'Confirmed', 'Professional', 6500.00, TRUE),
(10, 10, 10, '2025-06-28 09:00:00', 'Confirmed', 'VIP', 7000.00, TRUE);

/*8thtablevalue*/
INSERT INTO Feedback (feedback_id, registration_id, rating, comments, submitted_at, would_recommend, reviewed, is_public)
VALUES
(1, 1, 5, 'Excellent keynote and very informative.', '2025-07-02 10:00:00', TRUE, TRUE, TRUE),
(2, 2, 4, 'Great insights on AI innovations.', '2025-07-02 12:00:00', TRUE, TRUE, TRUE),
(3, 3, 3, 'Panel was good but could have been longer.', '2025-07-02 15:00:00', TRUE, TRUE, TRUE),
(4, 4, 5, 'Loved the big data workshop, very useful.', '2025-07-03 09:30:00', TRUE, TRUE, TRUE),
(5, 5, 2, 'Blockchain session was too technical for me.', '2025-07-03 11:00:00', FALSE, TRUE, FALSE),
(6, 6, 4, 'Mobile app development session was practical.', '2025-07-03 14:00:00', TRUE, TRUE, TRUE),
(7, 7, 5, 'Tech integration talk was insightful.', '2025-07-04 10:00:00', TRUE, TRUE, TRUE),
(8, 8, 3, 'Sustainable tech panel had good points.', '2025-07-04 12:30:00', TRUE, TRUE, TRUE),
(9, 9, 4, 'IoT devices session was engaging.', '2025-07-04 15:00:00', TRUE, TRUE, TRUE),
(10, 10, 5, 'Closing remarks nicely summarized the event.', '2025-07-04 17:00:00', TRUE, TRUE, TRUE);

/*9thtablevalue*/
INSERT INTO Sponsor (sponsor_id, name, contact_person, email, phone, address, sponsorship_amount, conference_id) 
VALUES
(1, 'TechCorp', 'Rajiv Kumar', 'contact@techcorp.com', '9876543210', '123 Innovation Drive, Bangalore, Karnataka, India', 50000.00, 1),
(2, 'CodeMasters', 'Sneha Patel', 'info@codemasters.com', '9123456780', '456 Software Blvd, Chennai, Tamil Nadu, India', 30000.00, 1),
(3, 'AI Innovations', 'Amit Singh', 'support@aiinnovations.com', '9988776655', '789 AI Street, Hyderabad, Telangana, India', 20000.00, 1),
(4, 'CyberSafe', 'Pooja Mehta', 'contact@cybersafe.com', '9876123456', '321 Security Rd, Delhi, Delhi, India', 35000.00, 2),
(5, 'DataVerse', 'Karan Sharma', 'hello@dataverse.com', '8765432109', '654 Data Lane, Mumbai, Maharashtra, India', 55000.00, 2),
(6, 'FutureTech', 'Nisha Rao', 'contact@futuretech.com', '9012345678', '987 Future Blvd, Pune, Maharashtra, India', 22000.00, 3),
(7, 'MobileExpo', 'Vikram Das', 'info@mobileexpo.com', '9123456789', '123 Mobile Ave, Kolkata, West Bengal, India', 32000.00, 3),
(8, 'TechFusion', 'Anita Sharma', 'support@techfusion.com', '9876543211', '456 Fusion Rd, Jaipur, Rajasthan, India', 15000.00, 4),
(9, 'GreenTech', 'Rohit Gupta', 'contact@greentech.com', '9988776654', '789 Greenway, Ahmedabad, Gujarat, India', 21000.00, 4),
(10, 'IoTVision', 'Meera Nair', 'hello@iotvision.com', '9012987654', '321 IoT Street, Coimbatore, Tamil Nadu, India', 34000.00, 5);

-- synarioes
DELIMITER $$
/*queries1*/
CREATE PROCEDURE GetAllConferences()
BEGIN
  SELECT * FROM Conference;
END$$

/*queries2*/
CREATE PROCEDURE GetConferenceByID(IN p_conference_id INT)
BEGIN
  SELECT * FROM Conference WHERE conference_id = p_conference_id;
END$$

/*queries3*/
CREATE PROCEDURE GetActiveVenues()
BEGIN
  SELECT * FROM Venue WHERE is_active = TRUE;
END$$

/*queries4*/
CREATE PROCEDURE GetTopSpeakers(IN p_min_rating DECIMAL(3,2))
BEGIN
  SELECT * FROM Speaker WHERE rating >= p_min_rating ORDER BY rating DESC;
END$$

/*queries5*/
CREATE PROCEDURE GetSessionsByConference(IN p_conference_id INT)
BEGIN
  SELECT s.session_id, s.title, s.session_date, s.start_time, s.end_time, sp.name AS speaker_name, v.name AS venue_name
  FROM Session s
  JOIN Speaker sp ON s.speaker_id = sp.speaker_id
  JOIN Venue v ON s.venue_id = v.venue_id
  WHERE s.conference_id = p_conference_id
  ORDER BY s.session_date, s.start_time;
END$$

/*queries6*/
CREATE PROCEDURE GetAttendeesBySession(IN p_session_id INT)
BEGIN
  SELECT a.attendee_id, a.name, a.email, r.payment_status, r.ticket_type, r.checked_in
  FROM Registration r
  JOIN Attendee a ON r.attendee_id = a.attendee_id
  WHERE r.session_id = p_session_id;
END$$

/*queries7*/
CREATE PROCEDURE GetRegistrationsByAttendee(IN p_attendee_id INT)
BEGIN
  SELECT r.registration_id, s.title AS session_title, c.name AS conference_name, r.registration_date, r.payment_status
  FROM Registration r
  JOIN Session s ON r.session_id = s.session_id
  JOIN Conference c ON s.conference_id = c.conference_id
  WHERE r.attendee_id = p_attendee_id;
END$$

/*queries8*/
CREATE PROCEDURE GetFeedbackBySession(IN p_session_id INT)
BEGIN
  SELECT f.feedback_id, f.rating, f.comments, f.submitted_at, a.name AS attendee_name
  FROM Feedback f
  JOIN Registration r ON f.registration_id = r.registration_id
  JOIN Attendee a ON r.attendee_id = a.attendee_id
  JOIN Session s ON r.session_id = s.session_id
  WHERE s.session_id = p_session_id;
END$$

/*queries9*/
CREATE PROCEDURE GetAverageRatingBySpeaker(IN p_speaker_id INT)
BEGIN
  SELECT AVG(f.rating) AS average_rating
  FROM Feedback f
  JOIN Registration r ON f.registration_id = r.registration_id
  JOIN Session s ON r.session_id = s.session_id
  WHERE s.speaker_id = p_speaker_id;
END$$

/*queries10*/
CREATE PROCEDURE GetConferencesByOrganizer(IN p_organizer_id INT)
BEGIN
  SELECT * FROM Conference WHERE organizer_id = p_organizer_id;
END$$

/*queries11*/
CREATE PROCEDURE GetAllOrganizers()
BEGIN
  SELECT * FROM Organizer;
END$$

/*queries12*/
CREATE PROCEDURE GetVenuesByCity(IN p_city VARCHAR(50))
BEGIN
  SELECT * FROM Venue WHERE city = p_city AND is_active = TRUE;
END$$

/*queries13*/
CREATE PROCEDURE GetSpeakersByName(IN p_name_pattern VARCHAR(100))
BEGIN
  SELECT * FROM Speaker WHERE name LIKE CONCAT('%', p_name_pattern, '%');
END$$

/*queries14*/
CREATE PROCEDURE GetSessionsByDate(IN p_date DATE)
BEGIN
  SELECT s.session_id, s.title, c.name AS conference_name, sp.name AS speaker_name, v.name AS venue_name, s.start_time, s.end_time
  FROM Session s
  JOIN Conference c ON s.conference_id = c.conference_id
  JOIN Speaker sp ON s.speaker_id = sp.speaker_id
  JOIN Venue v ON s.venue_id = v.venue_id
  WHERE s.session_date = p_date;
END$$

/*queries15*/
CREATE PROCEDURE GetAttendeeCountPerConference()
BEGIN
  SELECT c.conference_id, c.name AS conference_name, COUNT(DISTINCT r.attendee_id) AS attendee_count
  FROM Conference c
  JOIN Session s ON c.conference_id = s.conference_id
  JOIN Registration r ON s.session_id = r.session_id
  GROUP BY c.conference_id, c.name;
END$$

DELIMITER ;

/*callprocedure*/
-- Call queries1: Get all conferences
CALL GetAllConferences();

-- Call queries2: Get conference by ID (example with conference_id = 1)
CALL GetConferenceByID(1);

-- Call queries3: Get active venues
CALL GetActiveVenues();

-- Call queries4: Get top speakers with min rating 4.5
CALL GetTopSpeakers(4.5);

-- Call queries5: Get sessions by conference ID (example conference_id = 2)
CALL GetSessionsByConference(2);

-- Call queries6: Get attendees by session ID (example session_id = 3)
CALL GetAttendeesBySession(3);

-- Call queries7: Get registrations by attendee ID (example attendee_id = 4)
CALL GetRegistrationsByAttendee(4);

-- Call queries8: Get feedback by session ID (example session_id = 5)
CALL GetFeedbackBySession(5);

-- Call queries9: Get average rating by speaker ID (example speaker_id = 6)
CALL GetAverageRatingBySpeaker(6);

-- Call queries10: Get conferences by organizer ID (example organizer_id = 7)
CALL GetConferencesByOrganizer(7);

-- Call queries11: Get all organizers
CALL GetAllOrganizers();

-- Call queries12: Get venues by city (example city = 'New York')
CALL GetVenuesByCity('New York');

-- Call queries13: Get speakers by name pattern (example pattern = 'John')
CALL GetSpeakersByName('John');

-- Call queries14: Get sessions by date (example date = '2025-06-03')
CALL GetSessionsByDate('2025-06-03');

-- Call queries15: Get attendee count per conference
CALL GetAttendeeCountPerConference();
