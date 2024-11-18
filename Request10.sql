SET @gaz_name := 'N2O';

SELECT DISTINCT report.report_name
FROM report
INNER JOIN give ON give.id_report = report.id_report
INNER JOIN record ON record.id_record = give.id_record
INNER JOIN sensor ON sensor.id_sensor = record.id_sensor
INNER JOIN gaz ON gaz.id_gaz = sensor.id_gaz
WHERE gaz.gaz_name = @gaz_name;
