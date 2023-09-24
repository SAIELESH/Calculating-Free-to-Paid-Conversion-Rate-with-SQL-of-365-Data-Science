# Calculating-Free-to-Paid-Conversion-Rate-with-SQL-of-365-Data-Science

# Creating the Subquery
This project allows me to apply my SQL knowledge to a real-world dataset. Once i complete all tasks, i will have found the answer to the following questions:

What is the free-to-paid conversion rate of students who have watched a lecture on the 365 platform?
What is the average duration between the registration date and when a student has watched a lecture for the first time (date of first-time engagement)?
What is the average duration between the date of first-time engagement and when a student purchases a subscription for the first time (date of first-time purchase)?
How can we interpret these results, and what are their implications?
First, i imported the db_course_conversions database—stored in the db_course_conversions.sql file—into my schemas and studied its content. Then, by appropriately joining and aggregating the tables, created a new result dataset comprising the following columns:

student_id – (int) the unique identification of a student
date_registered – (date) the date on which the student registered on the 365 platform
first_date_watched – (date) the date of the first engagement
first_date_purchased – (date) the date of first-time purchase (NULL if they have no purchases)
date_diff_reg_watch – (int) the difference in days between the registration date and the date of first-time engagement
date_diff_watch_purch – (int) the difference in days between the date of first-time engagement and the date of first-time purchase (NULL if they have no purchases)
Hint: Research the DATEDIFF function in MySQL.

Note the Venn diagram below.

![image](https://github.com/SAIELESH/Calculating-Free-to-Paid-Conversion-Rate-with-SQL-of-365-Data-Science/assets/107880771/a21407cb-c11f-4e4f-ae92-6ff5b9ec3b42)


The resulting set I retrieve should include the student IDs of students entering the diagram’s shaded region. Additionally, my objective is to determine the conversion rate of students who have already watched a lecture. Therefore, I filtered the result dataset so that the date of first-time engagement comes before (or is equal to) the date of first-time purchase.

Note: To ensure an engagement occurs before the purchase, we need the timestamp of both events. But this information is not in the dataset we’re working with.
