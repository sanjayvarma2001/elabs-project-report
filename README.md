Student Grade Management System

A simple SQL-based database system designed to manage student academic records including grades, GPA, and CGPA calculations using stored procedures.

Project Overview

This project simulates a relational database system for handling student records, course enrollment, semester tracking, grade storage, and automatic GPA/CGPA computation using MySQL. It showcases how normalized schema design and SQL procedures can be used to efficiently manage academic data.

Tools & Technologies

MySQL (RDBMS) – For schema design, data insertion, and stored procedures
MySQL Workbench / CLI – Used for writing and testing queries
Markdown – For documentation

Database Schema

The project includes the following interconnected tables:

students – Holds student personal and academic data
courses – Contains course details and credits
semesters – Tracks semester sessions
grades – Stores student grades per course and semester
grades_points – Maps letter grades to grade points
semester_gpa – Stores GPA calculated for each semester
Stored Procedure – update_cgpa() calculates cumulative GPA

How It Works

1. Database Creation
   ```sql
   CREATE DATABASE studentgradesys;
   USE studentgradesys;
