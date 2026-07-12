-- 4. Listez les rapports publiés entre 2018 et 2022
SELECT report_name 
FROM report
WHERE YEAR(date_report) BETWEEN 2018 AND 2022;
