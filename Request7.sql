-- 7. Classez les rapports concernant des émissions de NH3 par ordre chronologique.
SELECT report_name
FROM report
INNER JOIN give ON report.id_report = give.id_report
INNER JOIN record ON give.id_record = record.id_record
INNER JOIN sensor ON record.id_sensor = sensor.id_sensor
INNER JOIN gaz ON sensor.id_gaz = gaz.id_gaz
WHERE gaz.gaz_name = 'NH3'
GROUP BY report.report_name, report.date_report
ORDER BY report.date_report;
