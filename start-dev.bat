@echo off
echo Starting Map2Market Development Servers...
echo.

REM Start backend in new window
echo Starting Backend Server...
start "Map2Market Backend" cmd /k "cd backend && venv\Scripts\activate && uvicorn app.main:app --reload --port 8000"

REM Wait a bit for backend to start
timeout /t 3 /nobreak > nul

REM Start frontend in new window
echo Starting Frontend Server...
start "Map2Market Frontend" cmd /k "cd frontend && npm run dev"

echo.
echo Both servers are starting...
echo Backend: http://localhost:8000
echo Frontend: http://localhost:5173
echo.
echo Press any key to exit this window (servers will keep running)
pause > nul
