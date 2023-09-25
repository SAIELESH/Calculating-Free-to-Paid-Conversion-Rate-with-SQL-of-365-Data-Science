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

# Creating the Main Query
I’ve created a temporary result set adhering to the Venn diagram and columns: 

student_id – (int) the unique identification of a student
date_registered – (date) the date on which the student registered on the 365 platform
first_date_watched – (date) the date of first-time engagement
first_date_purchased – (date) the date of first-time purchase (NULL if they have no purchases)
date_diff_reg_watch – (int) the difference in days between the registration date and the date of first-time engagement
date_diff_watch_purch – (int) the difference in days between the date of first-time engagement and the date of first-time purchase (NULL if they have no purchases)
In this task, you should use the subquery you’ve created and retrieve the following three metrics.

# Free-to-Paid Conversion Rate:
This metric measures the proportion of engaged students who choose to benefit from full course access on the 365 platform by purchasing a subscription after watching a lecture. It is calculated as the ratio between:

The number of students who watched a lecture and purchased a subscription.
The total number of students who have watched a lecture.
Converted the result to percentages and called the field conversion_rate.

# Average Duration Between Registration and First-Time Engagement:
This metric measures the average duration between the date of registration and the date of first-time engagement. This will tell us how long it takes, on average, for a student to watch a lecture after registration. The metric is calculated by finding the ratio between:

The sum of all such durations.
The number of these durations.
Called the field av_reg_watch.

# Average Duration Between First-Time Engagement and First-Time Purchase:
This metric measures the average time it takes individuals to subscribe to the platform after viewing a lecture. It is calculated by dividing:

The total sum of all these durations
The total number of such durations
Called the field av_watch_purch.

# Interpretation

First, I considered the conversion rate and compared this metric to industry benchmarks or historical data. Second, I examined the duration between the registration date and date of first-time engagement. A short duration—watching on the same or the next day—could indicate that the registration process and initial platform experience are user-friendly. At the same time, a longer duration may suggest that users are hesitant or facing challenges. Third, regarding the time it takes students to convert to paid subscriptions after their first lecture, a shorter span would suggest compelling content or effective up-sell strategies.

Next, using a tool different from SQL (e.g., Excel, Python), I calculated the median and mode values of the date difference between registering and watching a lecture. Did the same for the date difference between watching a lecture and purchasing a subscription. I Compared the two metrics of each set to their respective mean values. To interpret the results even better, I created a distribution graph and tried to understand the relationship between these metrics (mean, median, and mode). Focus on the following key points.

# Distribution Symmetry
The distribution is likely symmetrical when the mean, median, and mode are equal or very close, forming a bell curve. If they differ, the data might be skewed to the left—indicated by a long tail on the left side—or to the right with a long tail on the right side.

# Outliers
If the mean is much higher or lower than the median, it suggests that there are outliers. For instance, if the average time to purchase a subscription is significantly higher than the median, it may imply that a few students took an exceptionally long time to decide.

# Common Patterns
If a specific value or set of values has a high frequency—corresponding to the mode of the dataset—it can spotlight common behaviors. For example, if the mode of the time between registration and watching a lecture is one day, it indicates that many students start watching the day after registration.
