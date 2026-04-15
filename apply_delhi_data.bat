@echo off
echo Applying Delhi Data to local database...
docker exec -i insurance-mysql mysql -uroot -proot insurance_renewal < delhi_data_insert.sql
echo Done! Data has been appended without affecting existing data.
pause
