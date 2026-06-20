# Profile Management System - CSC584 Assignment 2

## Student Information
* **Name:** Nurul Adriana Farisha Binti Elfian
* **Student ID:** 2024275054

---

## Project Overview
This project is a web-based Personal Profile Management System developed using the Model-View-Controller (MVC) architecture, Java Servlets, JSP, and a MySQL database. The system allows users to view and update profile information through a web interface.

### MVC Architecture Structure
1. **View (JSP & HTML):** Located in the `web` folder (e.g., `editProfile.jsp`, `viewProfiles.jsp`, `profile.jsp`). This handles the user interface and forms.
2. **Controller (Java Servlets):** Located in the `src/java` folder. This processes requests from the JSP views, handles the business logic, and directs the responses.
3. **Model (DAO & Database):** Handles data persistence and database connectivity via Java Data Access Object (DAO) classes interacting with the `studentprofilesdb.sql` script.

---

## Requirements and Environment Setup
Ensure the following development environment is ready before running the project:
* **IDE:** NetBeans IDE
* **Java Enterprise:** Java Web Application (Servlets & JSP)
* **Database:** MySQL (XAMPP phpMyAdmin)
* **Server:** Apache Tomcat or GlassFish Server

### Main Repository Contents
* `PersonalProfileWeb/` - The core NetBeans project directory.
* `src/` - Contains the Java backend source code (Servlets, DAO, Beans).
* `web/` - Contains the frontend web pages (.jsp and .html files).
* `studentprofilesdb.sql` - The database script to initialize tables.

---

## How to Run the Application

1. **Database Setup:**
   * Open XAMPP and start both **Apache** and **MySQL**.
   * Open your browser and navigate to `http://localhost/phpmyadmin`.
   * Create a new database, then **Import** the `studentprofilesdb.sql` file provided in this repository.

2. **Open and Build the Project:**
   * Launch NetBeans IDE.
   * Go to **File > Open Project** and select the `PersonalProfileWeb` folder.
   * Right-click on the project name in the Projects tab and select **Clean and Build**.

3. **Run the Project:**
   * Right-click on the project name again and select **Run**.
   * The web application will launch automatically in your default browser at the landing page.
