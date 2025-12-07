# Map2Market - Frontend-Backend Integration Guide

## Overview

This document explains how the frontend and backend are connected and how data flows through the system.

## Architecture

```
User Input (Home Page)
    ↓
Analysis Page (Shows Progress)
    ↓
Backend API (/api/analyze)
    ↓
Multi-Agent Pipeline
    ├── Persona Agent
    ├── Market Research Agent
    ├── Risk Analysis Agent
    ├── Technical/Marketing Agent
    └── Finance Agent
    ↓
Report Page (Display Results)
```

## Data Flow

### 1. User Input (Home.jsx)

User enters:
- Business idea (string)
- Target location(s) (comma-separated string)

```javascript
{
  idea: "AI-powered food delivery app",
  locations: ["San Francisco", "New York"]
}
```

### 2. Analysis Request (analysisApi.js)

Frontend sends POST request to backend:

```javascript
POST http://localhost:8000/api/analyze
Content-Type: application/json

{
  "idea": "AI-powered food delivery app",
  "locations": ["San Francisco", "New York"]
}
```

### 3. Backend Processing (main.py)

FastAPI receives request and calls the pipeline:

```python
@app.post("/api/analyze")
async def analyze(req: AnalysisRequest):
    output = run_pipeline(req.idea, req.locations)
    return AnalysisResponse(
        idea=req.idea,
        locations=req.locations,
        output=output
    )
```

### 4. Multi-Agent Pipeline (main_main.py)

The pipeline runs 5 agents sequentially:

```python
def run_pipeline(idea: str, locations: list):
    # Step 1: Persona Agent
    persona = generate_market_context(user_info)
    
    # Step 2: Market Research Agent
    market_summary = run_market_agent(persona)
    
    # Step 3: Risk Analysis Agent
    risk_summary = run_risk_agent(persona, market_summary)
    
    # Step 4: Technical/Marketing Agent
    tech_output = tech_agent.analyze(persona)
    
    # Step 5: Finance Agent
    finance_output = finance_agent.analyze(persona)
    
    return {
        "persona": persona,
        "market": market_summary,
        "risk": risk_summary,
        "technical": tech_output,
        "finance": finance_output
    }
```

### 5. Backend Response

```json
{
  "idea": "AI-powered food delivery app",
  "locations": ["San Francisco", "New York"],
  "output": {
    "persona": {
      "business_idea": "AI Food Delivery Platform",
      "core_target": "Tech-savvy urban professionals",
      "proper_idea_background": "...",
      "local_context": "San Francisco, New York",
      "primary_pain_point": "Long delivery times",
      "competitive_factor": "AI-powered route optimization"
    },
    "market": "Market analysis text...",
    "risk": "Risk analysis text...",
    "technical": {
      "category": "technical",
      "recommended_stack": "React Native, Node.js, PostgreSQL...",
      "tools": ["VS Code", "GitHub", "Docker"],
      "team": "2 mobile devs, 1 backend dev...",
      "cloud_and_infra": "AWS with ECS...",
      "security_and_scalability": "...",
      "development_roadmap": "..."
    },
    "finance": {
      "estimated_monthly_costs": {
        "rent": 5000,
        "staff": 15000,
        "raw_materials": 3000,
        "total_cost": 23000
      },
      "estimated_revenue": 45000,
      "profitability_summary": "...",
      "financial_risks": ["...", "..."]
    }
  }
}
```

### 6. Frontend Display (Report.jsx)

The Report page renders all sections:
- Business Overview
- Persona Analysis
- Market Research
- Risk Analysis
- Technical/Marketing Requirements
- Financial Analysis

## Key Components

### Frontend

#### API Client (`frontend/src/api/analysisApi.js`)
- Axios-based HTTP client
- Handles API communication
- Error handling and timeout management

#### Custom Hook (`frontend/src/hooks/useRunAnalysis.js`)
- Manages analysis state
- Shows agent progress
- Handles loading and errors

#### Context (`frontend/src/context/AnalysisContext.jsx`)
- Global state management
- Stores idea, locations, and results
- Shared across pages

#### Pages
- **Home.jsx**: Input form
- **Analysis.jsx**: Progress display
- **Report.jsx**: Results display

### Backend

#### Main App (`backend/app/main.py`)
- FastAPI application
- CORS configuration
- API endpoints

#### Pipeline Orchestrator (`backend/app/agents/main_main.py`)
- Coordinates all agents
- Sequential execution
- Returns combined results

#### Individual Agents
- **user_per.py**: Persona generation
- **market_risk.py**: Market research & risk analysis
- **technical_agent_connection.py**: Tech/marketing requirements
- **finance_agent_connection.py**: Financial projections

## Environment Variables

### Frontend (`.env`)
```env
VITE_API_URL=http://localhost:8000
```

### Backend (`.env`)
```env
GROQ_MARKET_RISK_KEY=your_key
GROQ_TECH_KEY=your_key
TAVILY_KEY=your_key
GEMINI_FINANCE_KEY=your_key
```

## Error Handling

### Frontend
- Connection errors: "Cannot connect to backend"
- Timeout errors: 2-minute timeout
- API errors: Display error message from backend

### Backend
- Missing API keys: Runtime error with clear message
- Agent failures: Retry mechanism (3 attempts)
- Rate limiting: Exponential backoff

## Testing the Integration

### 1. Start Backend
```bash
cd backend
venv\Scripts\activate  # Windows
uvicorn app.main:app --reload --port 8000
```

### 2. Start Frontend
```bash
cd frontend
npm run dev
```

### 3. Test Flow
1. Open http://localhost:5173
2. Click "Get early access" (auto-login for demo)
3. Enter business idea and location
4. Click "Run sample analysis"
5. Watch agent progress on Analysis page
6. View complete report on Report page

### 4. Verify Backend
- Check backend logs for agent execution
- Verify API calls in browser DevTools Network tab
- Check response structure matches expected format

## Common Issues

### CORS Errors
**Problem**: Frontend can't connect to backend
**Solution**: Check CORS settings in `backend/app/main.py`

### Timeout Errors
**Problem**: Analysis takes too long
**Solution**: Increase timeout in `frontend/src/api/analysisApi.js`

### Missing Data in Report
**Problem**: Some sections show "N/A"
**Solution**: Check agent outputs in backend logs

### API Key Errors
**Problem**: Agents fail with authentication errors
**Solution**: Verify all API keys in `backend/.env`

## Performance Optimization

### Backend
- Agents run sequentially (can be parallelized)
- Each agent has retry logic
- Tavily search limited to 6 results

### Frontend
- Simulated progress for better UX
- Results cached in context
- Lazy loading of report sections

## Security Considerations

1. **API Keys**: Never commit `.env` files
2. **CORS**: Restrict origins in production
3. **Input Validation**: Backend validates all inputs
4. **Rate Limiting**: Consider adding rate limits
5. **Authentication**: Implement proper auth in production

## Future Enhancements

1. **Parallel Agent Execution**: Run independent agents simultaneously
2. **Streaming Responses**: Show real-time agent outputs
3. **Caching**: Cache results for similar queries
4. **Database**: Store analysis history
5. **Export**: PDF/CSV export functionality
6. **Comparison**: Compare multiple locations side-by-side
