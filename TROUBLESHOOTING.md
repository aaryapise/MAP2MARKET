# Troubleshooting Guide

Common issues and their solutions.

## Backend Issues

### 1. "Module not found" errors

**Error:**
```
ModuleNotFoundError: No module named 'fastapi'
```

**Solution:**
```bash
cd backend
# Make sure virtual environment is activated
venv\Scripts\activate  # Windows
source venv/bin/activate  # macOS/Linux

# Reinstall dependencies
pip install -r requirements.txt
```

### 2. "GROQ_MARKET_RISK_KEY is missing"

**Error:**
```
RuntimeError: GROQ_MARKET_RISK_KEY missing — cannot run persona agent.
```

**Solution:**
1. Check `backend/.env` file exists
2. Verify all API keys are set:
   ```env
   GROQ_MARKET_RISK_KEY=gsk_...
   GROQ_TECH_KEY=gsk_...
   TAVILY_KEY=tvly-...
   GEMINI_FINANCE_KEY=AIza...
   ```
3. Restart the backend server

### 3. Port 8000 already in use

**Error:**
```
ERROR: [Errno 10048] error while attempting to bind on address ('127.0.0.1', 8000)
```

**Solution:**
```bash
# Option 1: Use different port
uvicorn app.main:app --reload --port 8001

# Then update frontend/.env
VITE_API_URL=http://localhost:8001

# Option 2: Kill process using port 8000
# Windows:
netstat -ano | findstr :8000
taskkill /PID <PID> /F

# macOS/Linux:
lsof -ti:8000 | xargs kill -9
```

### 4. Import errors with app modules

**Error:**
```
ModuleNotFoundError: No module named 'app'
```

**Solution:**
```bash
# Make sure you're running from the backend directory
cd backend
uvicorn app.main:app --reload

# NOT from project root
```

### 5. API rate limit errors

**Error:**
```
groq.RateLimitError: Rate limit exceeded
```

**Solution:**
- Wait a few minutes and try again
- Check your API key quota
- The agents have built-in retry logic with exponential backoff

## Frontend Issues

### 1. "Cannot connect to backend"

**Error in browser:**
```
Cannot connect to backend. Make sure the server is running on port 8000.
```

**Solution:**
1. Verify backend is running:
   ```bash
   # Open http://localhost:8000 in browser
   # Should see: {"status": "Backend Running 🚀", ...}
   ```

2. Check backend status indicator (bottom-right of page)
   - Green = Connected
   - Red = Disconnected

3. Verify `.env` file:
   ```env
   VITE_API_URL=http://localhost:8000
   ```

4. Check CORS settings in `backend/app/main.py`

5. Restart both servers

### 2. "npm: command not found"

**Error:**
```
'npm' is not recognized as an internal or external command
```

**Solution:**
1. Install Node.js from https://nodejs.org
2. Restart terminal
3. Verify installation:
   ```bash
   node --version
   npm --version
   ```

### 3. Port 5173 already in use

**Error:**
```
Port 5173 is in use, trying another one...
```

**Solution:**
- Vite will automatically use next available port
- Just press 'y' when prompted
- Or manually specify port:
  ```bash
  npm run dev -- --port 3000
  ```

### 4. Blank page or white screen

**Solution:**
1. Check browser console for errors (F12)
2. Verify all dependencies installed:
   ```bash
   cd frontend
   rm -rf node_modules package-lock.json
   npm install
   ```
3. Clear browser cache
4. Try different browser

### 5. "Failed to fetch" errors

**Solution:**
1. Check backend is running
2. Verify API URL in `.env`
3. Check browser console for CORS errors
4. Disable browser extensions (ad blockers)

## Integration Issues

### 1. Analysis hangs/never completes

**Symptoms:**
- Progress bar stuck on one agent
- No error message
- Timeout after 2 minutes

**Solution:**
1. Check backend terminal for errors
2. Verify all API keys are valid
3. Check internet connection
4. Try with simpler business idea
5. Check backend logs:
   ```bash
   # Look for agent-specific errors
   # Each agent should log "Retrying..." if failing
   ```

### 2. Report shows "N/A" or missing data

**Symptoms:**
- Some sections empty
- "N/A" displayed
- Incomplete report

**Solution:**
1. Check backend response in browser DevTools:
   - Network tab → `/api/analyze` → Response
   - Verify all agent outputs present

2. Check backend logs for agent failures

3. Verify API keys have sufficient quota

4. Try analysis again (agents may have timed out)

### 3. CORS errors in browser console

**Error:**
```
Access to XMLHttpRequest at 'http://localhost:8000/api/analyze' from origin 'http://localhost:5173' has been blocked by CORS policy
```

**Solution:**
1. Check `backend/app/main.py` CORS settings:
   ```python
   app.add_middleware(
       CORSMiddleware,
       allow_origins=["http://localhost:5173", "*"],
       allow_credentials=True,
       allow_methods=["*"],
       allow_headers=["*"],
   )
   ```

2. Restart backend server

3. Clear browser cache

### 4. Agents show wrong order or skip

**Solution:**
- This is visual only (simulated progress)
- Actual agents run in correct order on backend
- Check backend logs to verify execution

## Environment Issues

### 1. Virtual environment not activating

**Windows:**
```bash
# If activation fails, try:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Then activate:
venv\Scripts\activate
```

**macOS/Linux:**
```bash
# Make sure script is executable
chmod +x venv/bin/activate
source venv/bin/activate
```

### 2. Python version issues

**Error:**
```
Python 3.9+ required
```

**Solution:**
```bash
# Check Python version
python --version

# If too old, install Python 3.9+
# Then recreate virtual environment
cd backend
rm -rf venv
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Node version issues

**Solution:**
```bash
# Check Node version
node --version

# If < 18, install Node 18+ from nodejs.org
# Then reinstall dependencies
cd frontend
rm -rf node_modules package-lock.json
npm install
```

## API Key Issues

### 1. Invalid Groq API key

**Error:**
```
groq.AuthenticationError: Invalid API key
```

**Solution:**
1. Verify key format: `gsk_...`
2. Check key is active in Groq console
3. Generate new key if needed
4. Update `backend/.env`
5. Restart backend

### 2. Invalid Tavily API key

**Error:**
```
tavily.TavilyError: Invalid API key
```

**Solution:**
1. Verify key format: `tvly-...`
2. Check Tavily dashboard
3. Ensure free tier hasn't expired
4. Generate new key if needed

### 3. Invalid Gemini API key

**Error:**
```
google.api_core.exceptions.PermissionDenied
```

**Solution:**
1. Verify key format: `AIza...`
2. Check Google AI Studio
3. Ensure API is enabled
4. Check quota limits
5. Generate new key if needed

## Performance Issues

### 1. Analysis takes too long (>2 minutes)

**Solution:**
1. Check internet connection
2. Verify API services are operational:
   - Groq status page
   - Tavily status
   - Google AI status
3. Try during off-peak hours
4. Simplify business idea description

### 2. Frontend feels slow

**Solution:**
1. Clear browser cache
2. Close other tabs
3. Check browser console for errors
4. Try different browser
5. Disable browser extensions

### 3. Backend uses too much memory

**Solution:**
1. Restart backend server periodically
2. Check for memory leaks in logs
3. Limit concurrent requests
4. Consider adding caching

## Data Issues

### 1. Unexpected analysis results

**Solution:**
1. Check input data:
   - Business idea clear and specific?
   - Location properly formatted?
2. Try different phrasing
3. Check backend logs for agent outputs
4. Verify agents are using correct prompts

### 2. Financial numbers seem wrong

**Solution:**
- Finance agent makes estimates based on:
  - Business type
  - Location
  - Market context
- Numbers are AI-generated estimates
- Use as starting point, not exact figures

### 3. Technical vs Marketing category wrong

**Solution:**
- Agent uses keyword detection
- Keywords in `technical_agent_connection.py`
- Add more specific tech keywords to idea
- Or accept marketing strategy for non-tech ideas

## Debugging Tips

### Enable Verbose Logging

**Backend:**
```python
# In backend/app/main.py
import logging
logging.basicConfig(level=logging.DEBUG)
```

**Frontend:**
```javascript
// In frontend/src/api/analysisApi.js
console.log('Request:', data)
console.log('Response:', response)
```

### Check API Response

1. Open browser DevTools (F12)
2. Go to Network tab
3. Submit analysis
4. Click on `/api/analyze` request
5. Check:
   - Request payload
   - Response data
   - Status code
   - Timing

### Test Backend Directly

```bash
# Using curl (Windows PowerShell)
curl -X POST http://localhost:8000/api/analyze `
  -H "Content-Type: application/json" `
  -d '{"idea":"test","locations":["test"]}'

# Using curl (macOS/Linux)
curl -X POST http://localhost:8000/api/analyze \
  -H "Content-Type: application/json" \
  -d '{"idea":"test","locations":["test"]}'
```

### Check Logs

**Backend logs:**
- Look in terminal where backend is running
- Check for agent execution messages
- Look for error stack traces

**Frontend logs:**
- Browser console (F12)
- Look for network errors
- Check for React errors

## Still Having Issues?

1. **Check documentation:**
   - README.md
   - INTEGRATION_GUIDE.md
   - QUICKSTART.md

2. **Verify setup:**
   - Run `setup.bat` again
   - Ensure all dependencies installed
   - Check all API keys valid

3. **Clean install:**
   ```bash
   # Backend
   cd backend
   rm -rf venv
   python -m venv venv
   venv\Scripts\activate
   pip install -r requirements.txt

   # Frontend
   cd frontend
   rm -rf node_modules package-lock.json
   npm install
   ```

4. **Check versions:**
   ```bash
   python --version  # Should be 3.9+
   node --version    # Should be 18+
   npm --version
   ```

5. **Test minimal setup:**
   - Start backend only
   - Visit http://localhost:8000
   - Should see status message
   - If this fails, issue is with backend setup

6. **Create GitHub issue:**
   - Include error messages
   - Include steps to reproduce
   - Include versions (Python, Node, OS)
   - Include relevant logs
