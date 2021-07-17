SELECT table_schema AS 'DB Name', ROUND(SUM(data_length + index_length) / 1024 / 1024 / 1024, 1) AS 'DB Size in GB' FROM information_schema.tables WHERE table_schema = 'testdb' GROUP BY table_schema;
