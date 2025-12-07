# Map2Market - AI Multi-Agent Startup Analysis Platform

A full-stack application that uses multiple AI agents to analyze startup ideas and provide comprehensive market analysis, risk assessment, technical requirements, and financial projections.

## 🚀 Features

- **5 Specialized AI Agents:**
  - 👤 Persona Agent - Structures business personas
  - 📊 Market Research Agent - Real-time market data analysis
  - ⚠️ Risk Analysis Agent - Comprehensive risk assessment
  - 💻 Technical/Marketing Agent - Tech stack or marketing strategy
  - 💰 Finance Agent - Financial projections and cost analysis

- **Real-time Analysis Progress** - Watch agents work in real-time
- **Comprehensive Reports** - Detailed analysis across all dimensions
- **Beautiful UI** - Modern, responsive design with Tailwind CSS

## 🛠️ Tech Stack

### Backend
- FastAPI (Python)
- Groq (Llama 3.3 & 3.1)
- Google Gemini 2.5 Flash
- Tavily Search API

### Frontend
- React 18
- Vite
- Tailwind CSS
- Axios
- React Router

## 📋 Prerequisites

- Python 3.9+
- Node.js 18+
- npm or yarn

## 🔧 Installation

### 1. Clone the repository
```bash
git clone <your-repo-url>
cd map2market
```

### 2. Backend Setup

```bash
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Configure environment variables
# Copy .env.example to .env and add your API keys
cp .env.example .env
# Edit .env with your actual API keys
```

### 3. Frontend Setup

```bash
cd frontend

# Install dependencies
npm install

# Configure environment variables (optional)
# The default API URL is http://localhost:8000
# Create .env file if you need to change it
```

## 🚀 Running the Application

### Start Backend Server

```bash
cd backend
# Make sure virtual environment is activated
uvicorn app.main:app --reload --port 8000
```

The backend will be available at `http://localhost:8000`

### Start Frontend Development Server

```bash
cd frontend
npm run dev
```

The frontend will be available at `http://localhost:5173`

## 🔑 API Keys Required

You need to obtain the following API keys:

1. **Groq API Key** - Get from [console.groq.com](https://console.groq.com)
   - Used for Market Research, Risk Analysis, and Technical agents
   
2. **Tavily API Key** - Get from [tavily.com](https://tavily.com)
   - Used for real-time web search in market research
   
3. **Google Gemini API Key** - Get from [ai.google.dev](https://ai.google.dev)
   - Used for Finance Agent

Add these keys to `backend/.env`:

```env
GROQ_MARKET_RISK_KEY=your_groq_key
GROQ_TECH_KEY=your_groq_key
TAVILY_KEY=your_tavily_key
GEMINI_FINANCE_KEY=your_gemini_key
```

## 📖 Usage

1. Open the frontend at `http://localhost:5173`
2. Click "Get early access" or "Log in" (authentication is simplified for demo)
3. Enter your business idea and target location
4. Click "Run sample analysis"
5. Watch the agents work in real-time
6. View your comprehensive report

## 🏗️ Project Structure

```
map2market/
├── backend/
│   ├── app/
│   │   ├── agents/           # AI agent implementations
│   │   │   ├── main_main.py  # Pipeline orchestrator
│   │   │   ├── user_per.py   # Persona agent
│   │   │   ├── market_risk.py # Market & Risk agents
│   │   │   ├── technical_agent_connection.py
│   │   │   └── finance_agent_connection.py
│   │   ├── clients/          # API clients
│   │   ├── routers/          # API routes
│   │   ├── utils/            # Utilities
│   │   ├── config.py         # Configuration
│   │   ├── models.py         # Data models
│   │   └── main.py           # FastAPI app
│   ├── requirements.txt
│   └── .env
├── frontend/
│   ├── src/
│   │   ├── api/              # API client
│   │   ├── components/       # React components
│   │   ├── context/          # React context
│   │   ├── hooks/            # Custom hooks
│   │   ├── pages/            # Page components
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── package.json
│   └── .env
└── README.md
```

## 🔍 API Endpoints

### POST /api/analyze
Runs the full multi-agent analysis pipeline.

**Request:**
```json
{
  "idea": "AI-powered food delivery app",
  "locations": ["San Francisco", "New York"]
}
```

**Response:**
```json
{
  "idea": "AI-powered food delivery app",
  "locations": ["San Francisco", "New York"],
  "output": {
    "persona": { ... },
    "market": "...",
    "risk": "...",
    "technical": { ... },
    "finance": { ... }
  }
}
```

### GET /
Health check endpoint.

## 🐛 Troubleshooting

### Backend Issues

**Port already in use:**
```bash
# Change port in uvicorn command
uvicorn app.main:app --reload --port 8001
# Update frontend/.env accordingly
```

**Module not found errors:**
```bash
# Make sure virtual environment is activated
# Reinstall dependencies
pip install -r requirements.txt
```

### Frontend Issues

**Cannot connect to backend:**
- Ensure backend is running on port 8000
- Check `frontend/.env` has correct `VITE_API_URL`
- Check CORS settings in `backend/app/main.py`

**Build errors:**
```bash
# Clear node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

## 📝 License

MIT License

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Contact

For questions or support, please open an issue on GitHub.
