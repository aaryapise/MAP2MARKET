# Quick Start Guide

Get Map2Market running in 5 minutes!

## Prerequisites

- Python 3.9+ installed
- Node.js 18+ installed
- API keys ready (see below)

## Step 1: Get API Keys (5 minutes)

### Groq API Key
1. Go to https://console.groq.com
2. Sign up/login
3. Create API key
4. Copy the key (starts with `gsk_`)

### Tavily API Key
1. Go to https://tavily.com
2. Sign up for free account
3. Get API key from dashboard
4. Copy the key (starts with `tvly-`)

### Google Gemini API Key
1. Go to https://ai.google.dev
2. Sign in with Google account
3. Get API key
4. Copy the key (starts with `AIza`)

## Step 2: Setup (2 minutes)

### Option A: Automated Setup (Windows)
```bash
# Run the setup script
setup.bat
```

### Option B: Manual Setup

**Backend:**
```bash
cd backend
python -m venv venv
venv\Scripts\activate  # Windows
# source venv/bin/activate  # macOS/Linux
pip install -r requirements.txt
```

**Frontend:**
```bash
cd frontend
npm install
```

## Step 3: Configure API Keys (1 minute)

Edit `backend/.env` and add your API keys:

```env
GROQ_MARKET_RISK_KEY=gsk_your_key_here
GROQ_TECH_KEY=gsk_your_key_here
TAVILY_KEY=tvly-your_key_here
GEMINI_FINANCE_KEY=AIza_your_key_here
```

**Note:** You can use the same Groq key for both `GROQ_MARKET_RISK_KEY` and `GROQ_TECH_KEY`.

## Step 4: Start the Application (1 minute)

### Option A: Automated Start (Windows)
```bash
# Run from project root
start-dev.bat
```

This will open two terminal windows:
- Backend server on http://localhost:8000
- Frontend server on http://localhost:5173

### Option B: Manual Start

**Terminal 1 - Backend:**
```bash
cd backend
venv\Scripts\activate  # Windows
# source venv/bin/activate  # macOS/Linux
uvicorn app.main:app --reload --port 8000
```

**Terminal 2 - Frontend:**
```bash
cd frontend
npm run dev
```

## Step 5: Use the Application

1. Open browser to http://localhost:5173
2. Click "Get early access" or "Log in"
3. Enter your business idea (e.g., "AI-powered coffee shop")
4. Enter target location (e.g., "San Francisco")
5. Click "Run sample analysis"
6. Watch the agents work!
7. View your comprehensive report

## Verify Everything Works

### Check Backend
Open http://localhost:8000 in browser. You should see:
```json
{
  "status": "Backend Running 🚀",
  "message": "Map2Market Multi-Agent Backend Ready",
  "version": "2.0.0"
}
```

### Check Frontend
Open http://localhost:5173. You should see the Map2Market homepage.

### Test Analysis
1. Submit a business idea
2. You should see 5 agents running:
   - 👤 Persona Agent
   - 📊 Market Research Agent
   - ⚠️ Risk Analysis Agent
   - 💻 Technical/Marketing Agent
   - 💰 Finance Agent
3. After ~10-30 seconds, you'll see the complete report

## Troubleshooting

### "Cannot connect to backend"
- Make sure backend is running on port 8000
- Check if `backend/.env` has all API keys
- Try restarting the backend server

### "Module not found" (Backend)
```bash
cd backend
venv\Scripts\activate
pip install -r requirements.txt
```

### "Command not found: npm" (Frontend)
- Install Node.js from https://nodejs.org
- Restart your terminal
- Try again

### Agents failing
- Check your API keys are correct
- Verify you have internet connection
- Check backend terminal for error messages

### Port already in use
**Backend:**
```bash
# Use different port
uvicorn app.main:app --reload --port 8001

# Update frontend/.env
VITE_API_URL=http://localhost:8001
```

**Frontend:**
```bash
# Vite will automatically suggest next available port
# Just press 'y' when prompted
```

## Example Business Ideas to Try

1. **Tech Startup**: "AI-powered task management app for remote teams"
2. **Food Business**: "Healthy meal prep delivery service"
3. **Retail**: "Sustainable fashion boutique"
4. **Service**: "Mobile car detailing service"
5. **Education**: "Online coding bootcamp for kids"

## What to Expect

### Analysis Time
- Typical analysis: 15-30 seconds
- Depends on API response times
- Progress shown in real-time

### Report Sections
1. **Business Overview**: Your idea and locations
2. **Persona Analysis**: Target audience and positioning
3. **Market Research**: Demand, competition, trends
4. **Risk Analysis**: Market, financial, location risks
5. **Technical/Marketing**: Requirements based on business type
6. **Financial Analysis**: Costs, revenue, profitability

## Next Steps

- Try different business ideas
- Compare multiple locations
- Export reports (print functionality)
- Customize the UI in `frontend/src/pages/`
- Add more agents in `backend/app/agents/`

## Need Help?

- Check `README.md` for detailed documentation
- See `INTEGRATION_GUIDE.md` for technical details
- Open an issue on GitHub
- Check backend logs for errors

## Success! 🎉

You now have a fully functional AI-powered startup analysis platform!

Try analyzing your own business idea and see what insights the agents provide.
