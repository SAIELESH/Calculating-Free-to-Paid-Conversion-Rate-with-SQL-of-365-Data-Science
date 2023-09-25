SELECT 
    ROUND(COUNT(first_date_purchased) / COUNT(first_date_watched),
            2) * 100 AS conversion_rate,
    ROUND(SUM(date_diff_reg_watch) / COUNT(date_diff_reg_watch),
            2) AS av_reg_watch,
    ROUND(SUM(date_diff_watch_purch) / COUNT(date_diff_watch_purch),
            2) AS av_watch_purch
FROM
    (SELECT 
        se.student_id,
            si.date_registered,
            MIN(se.date_watched) AS first_date_watched,
            MIN(sp.date_purchased) AS first_date_purchased,
            DATEDIFF(MIN(se.date_watched), si.date_registered) AS date_diff_reg_watch,
            DATEDIFF(MIN(sp.date_purchased), MIN(se.date_watched)) AS date_diff_watch_purch
    FROM
        student_engagement se
    JOIN student_info si ON se.student_id = si.student_id
    LEFT JOIN student_purchases sp ON se.student_id = sp.student_id
    GROUP BY se.student_id
    HAVING first_date_watched <= first_date_purchased
        OR first_date_purchased IS NULL) a; 