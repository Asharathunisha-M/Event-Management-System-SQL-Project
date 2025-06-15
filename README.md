# 🎟️ Event Management System – SQL Project

A complete SQL-based backend system for managing tech conferences and events. This project is built using **MySQL** and includes multiple entities such as Conferences, Organizers, Attendees, Sessions, Sponsors, and Feedback. It supports advanced data retrieval using stored procedures.

---

## 📌 Features

- ✅ 9 Normalized relational tables with primary and foreign key constraints
- ✅ 90+ rows of realistic sample data
- ✅ 15 Advanced stored procedures for analytics and operations
- ✅ Covers real-world event workflows: session booking, attendee registration, speaker management, etc.
- ✅ Ready to be used as backend for a web/mobile conference management app

---

## 🗃️ Database Structure

| Table Name     | Description                            |
|---------------|----------------------------------------|
| Conference     | Stores conference details              |
| Organizer      | Stores info about event organizers     |
| Venue          | Locations where events are hosted      |
| Speaker        | Guest speakers with ratings            |
| Session        | Scheduled sessions and talks           |
| Attendee       | People attending the sessions          |
| Registration   | Bookings and ticketing details         |
| Feedback       | Session reviews by attendees           |
| Sponsor        | Event sponsors and funding             |

---

## 🛠️ Technologies Used

- 💾 MySQL 8.x
- 📄 SQL Scripts
- 📊 Stored Procedures

---

## 🧪 Sample Stored Procedures

- `GetTopSpeakers(min_rating)` – Fetch high-rated speakers
- `GetSessionsByConference(conference_id)` – Sessions under an event
- `GetAttendeeCountPerConference()` – Total attendees per event
- `GetFeedbackBySession(session_id)` – Feedback with attendee names

---

## ▶️ How to Use

1. Clone or download the repo
2. Open `event_management_system.sql` in MySQL Workbench
3. Run the script to:
   - Create tables
   - Insert sample data
   - Define stored procedures
4. Use the sample `CALL` statements at the bottom of the script to test features

---

## 📸 Screenshots (Optional)

> *(Add ER diagrams, table relationships, sample outputs, etc. here)*

---

## 👤 Author

**Aishu Sami**  
🎓 BCA Graduate | Full Stack Developer Trainee  
🌐 [GitHub](https://github.com/yourusername) | [LinkedIn](https://linkedin.com/in/yourlinkedin)

---

## 📄 License

This project is for educational purposes only. Free to use and extend.

