@echo off
echo Stopping and removing containers and volumes...
docker-compose down

echo.
echo Rebuilding and starting application...
docker-compose up -d --build

echo.
echo Done! Please wait 30 seconds for MySQL to initialize before checking logs.
pause
