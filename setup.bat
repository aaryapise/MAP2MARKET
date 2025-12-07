@echo off
echo ========================================
echo Map2Market - Setup Script
echo ========================================
echo.

REM Backend Setup
echo [1/3] Setting up Backend...
cd backend

REM Check if venv exists
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
) else (
    echo Virtual environment already exists.
)

echo Activating virtual environment...
call venv\Scripts\activate

echo Installing Python dependencies...
pip install -r requirements.txt

echo.
echo Backend setup complete!
echo.

REM Frontend Setup
echo [2/3] Setting up Frontend...
cd ..\frontend

echo Installing Node.js dependencies...
call npm install

echo.
echo Frontend setup complete!
echo.

REM Final Instructions
echo [3/3] Setup Complete!
echo ========================================
echo.
echo IMPORTANT: Configure your API keys
echo Edit backend\.env with your API keys:
echo   - GROQ_MARKET_RISK_KEY
echo   - GROQ_TECH_KEY
echo   - TAVILY_KEY
echo   - GEMINI_FINANCE_KEY
echo.
echo To start the application:
echo   Run: start-dev.bat
echo.
echo Or manually:
echo   Backend:  cd backend ^&^& venv\Scripts\activate ^&^& uvicorn app.main:app --reload
echo   Frontend: cd frontend ^&^& npm run dev
echo.
echo ========================================
pause
