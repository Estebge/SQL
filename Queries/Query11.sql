-- 11. Pour un gaz donne, listez les rapports qui contiennent des donnees qui le concernent. Le nom du gaz se regle ici :
SET @gaz_name := 'NH3';

SELECT DISTINCT report.report_name, report.date_report
FROM report
INNER JOIN give ON give.id_report = report.id_report
INNER JOIN record ON record.id_record = give.id_record
INNER JOIN sensor ON sensor.id_sensor = record.id_sensor
INNER JOIN gaz ON gaz.id_gaz = sensor.id_gaz
WHERE gaz.gaz_name = @gaz_name
ORDER BY report.date_report;
