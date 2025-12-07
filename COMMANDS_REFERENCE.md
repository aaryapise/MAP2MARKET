# 📝 Commands Reference

Quick reference for all commands used in Map2Market development.

## 🐍 Backend Commands

### Setup
```bash
# Navigate to backend
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# Windows:
venv\Scripts\activate
# Mac/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Create .env file
cp .env.example .env
```

### Running
```bash
# Start development server
python -m uvicorn app.main:app --reload --port 8000

# Start without reload
python -m uvicorn app.main:app --port 8000

# Start on different port
python -m uvicorn app.main:app --reload --port 8080
```

### Testing
```bash
# Run tests (when implemented)
pytest

# Run with coverage
pytest --cov=app

# Run specific test file
pytest tests/test_auth.py
```

### Dependencies
```bash
# Install new package
pip install package-name

# Update requirements.txt
pip freeze > requirements.txt

# Install from requirements.txt
pip install -r requirements.txt

# Upgrade package
pip install --upgrade package-name
```

---

## ⚛️ Frontend Commands

### Setup
```bash
# Navigate to frontend
cd frontend

# Install dependencies
npm install

# Create .env file
cp .env.example .env
```

### Running
```bash
# Start development server
npm run dev

# Start on different port
npm run dev -- --port 3000

# Build for production
npm run build

# Preview production build
npm run preview
```

### Testing
```bash
# Run tests (when implemented)
npm test

# Run tests in watch mode
npm test -- --watch

# Run tests with coverage
npm test -- --coverage
```

### Dependencies
```bash
# Install new package
npm install package-name

# Install dev dependency
npm install --save-dev package-name

# Update package
npm update package-name

# Remove package
npm uninstall package-name

# Check for outdated packages
npm outdated

# Update all packages
npm update
```

### Linting & Formatting
```bash
# Run linter
npm run lint

# Fix linting issues
npm run lint -- --fix

# Format code (if prettier is configured)
npm run format
```

---

## 🗄️ MongoDB Commands

### MongoDB Atlas (Web Interface)
- Create cluster: https://cloud.mongodb.com
- View data: Database → Browse Collections
- Manage users: Database Access
- Network access: Network Access

### MongoDB Shell (if installed locally)
```bash
# Connect to MongoDB Atlas
mongosh "mongodb+srv://cluster.mongodb.net/map2market" --username your_username

# Show databases
show dbs

# Use database
use map2market

# Show collections
show collections

# Find all users
db.users.find()

# Find specific user
db.users.findOne({email: "user@example.com"})

# Count documents
db.users.countDocuments()

# Delete user
db.users.deleteOne({email: "user@example.com"})

# Drop collection
db.users.drop()
```

---

## 🔧 Git Commands

### Initial Setup
```bash
# Initialize git repository
git init

# Check git status
git status

# Add all files
git add .

# Add specific file
git add filename.py

# Commit changes
git commit -m "Your commit message"

# Add remote repository
git remote add origin https://github.com/username/repo.git

# Push to GitHub
git push -u origin main
```

### Daily Workflow
```bash
# Check current branch
git branch

# Create new branch
git checkout -b feature/new-feature

# Switch to existing branch
git checkout main

# Pull latest changes
git pull origin main

# Push changes
git push origin feature/new-feature

# View commit history
git log

# View changes
git diff
```

### Branching
```bash
# List all branches
git branch -a

# Create new branch
git branch feature/new-feature

# Switch to branch
git checkout feature/new-feature

# Create and switch in one command
git checkout -b feature/new-feature

# Delete branch
git branch -d feature/new-feature

# Force delete branch
git branch -D feature/new-feature

# Rename current branch
git branch -m new-branch-name
```

### Merging
```bash
# Merge branch into current branch
git merge feature/new-feature

# Abort merge
git merge --abort

# Continue merge after resolving conflicts
git merge --continue
```

### Undoing Changes
```bash
# Discard changes in file
git checkout -- filename.py

# Discard all changes
git reset --hard HEAD

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1

# Revert specific commit
git revert commit-hash
```

### Stashing
```bash
# Stash current changes
git stash

# List stashes
git stash list

# Apply latest stash
git stash apply

# Apply and remove latest stash
git stash pop

# Clear all stashes
git stash clear
```

---

## 🚀 Deployment Commands

### Render.com (via Web Interface)
- No CLI commands needed
- Deploy via GitHub integration
- View logs in dashboard

### Vercel
```bash
# Install Vercel CLI
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
vercel

# Deploy to production
vercel --prod

# View logs
vercel logs
```

### Heroku
```bash
# Install Heroku CLI
# Download from: https://devcenter.heroku.com/articles/heroku-cli

# Login to Heroku
heroku login

# Create new app
heroku create app-name

# Add remote
heroku git:remote -a app-name

# Deploy
git push heroku main

# View logs
heroku logs --tail

# Run command on Heroku
heroku run python manage.py migrate

# Set environment variable
heroku config:set KEY=value

# View environment variables
heroku config
```

---

## 🔍 Debugging Commands

### Backend Debugging
```bash
# Check Python version
python --version

# Check pip version
pip --version

# List installed packages
pip list

# Check if package is installed
pip show package-name

# Test MongoDB connection
python -c "from pymongo import MongoClient; print(MongoClient('your_connection_string').server_info())"

# Check environment variables
python -c "import os; print(os.getenv('GROQ_MARKET_RISK_KEY'))"
```

### Frontend Debugging
```bash
# Check Node version
node --version

# Check npm version
npm --version

# List installed packages
npm list

# Check package version
npm list package-name

# Clear npm cache
npm cache clean --force

# Remove node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

### Network Debugging
```bash
# Test backend is running
curl http://localhost:8000

# Test specific endpoint
curl http://localhost:8000/api/auth/signup -X POST -H "Content-Type: application/json" -d '{"email":"test@test.com","password":"test123","full_name":"Test"}'

# Check port usage (Windows)
netstat -ano | findstr :8000

# Check port usage (Mac/Linux)
lsof -i :8000

# Kill process on port (Windows)
taskkill /PID <PID> /F

# Kill process on port (Mac/Linux)
kill -9 <PID>
```

---

## 📦 Package Management

### Python (pip)
```bash
# Upgrade pip
python -m pip install --upgrade pip

# Install specific version
pip install package-name==1.2.3

# Install from GitHub
pip install git+https://github.com/user/repo.git

# Uninstall package
pip uninstall package-name

# Show package info
pip show package-name
```

### Node (npm)
```bash
# Initialize new project
npm init

# Install all dependencies
npm install

# Install and save to package.json
npm install package-name --save

# Install dev dependency
npm install package-name --save-dev

# Install globally
npm install -g package-name

# Update npm
npm install -g npm@latest
```

---

## 🧹 Cleanup Commands

### Backend Cleanup
```bash
# Remove Python cache
find . -type d -name __pycache__ -exec rm -r {} +

# Remove .pyc files
find . -type f -name "*.pyc" -delete

# Deactivate virtual environment
deactivate

# Remove virtual environment
rm -rf venv
```

### Frontend Cleanup
```bash
# Remove node_modules
rm -rf node_modules

# Remove build files
rm -rf dist

# Remove package-lock.json
rm package-lock.json

# Clean install
rm -rf node_modules package-lock.json && npm install
```

### Git Cleanup
```bash
# Remove untracked files
git clean -fd

# Remove ignored files
git clean -fdX

# Remove all untracked and ignored files
git clean -fdx

# Prune remote branches
git remote prune origin
```

---

## 🔐 Security Commands

### Generate Secrets
```bash
# Generate random secret (Python)
python -c "import secrets; print(secrets.token_urlsafe(32))"

# Generate random secret (Node)
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"

# Generate random secret (OpenSSL)
openssl rand -hex 32
```

### Check for Secrets in Code
```bash
# Search for potential secrets
grep -r "api_key" .
grep -r "password" .
grep -r "secret" .

# Check git history for secrets
git log -p | grep -i "password"
```

---

## 📊 Monitoring Commands

### System Monitoring
```bash
# Check disk space
df -h

# Check memory usage
free -h

# Check CPU usage
top

# Check running processes
ps aux | grep python
ps aux | grep node
```

### Application Monitoring
```bash
# Follow backend logs
tail -f backend/logs/app.log

# Count errors in logs
grep -c "ERROR" backend/logs/app.log

# View last 100 lines of logs
tail -n 100 backend/logs/app.log
```

---

## 🆘 Emergency Commands

### Kill All Processes
```bash
# Kill all Python processes (use with caution!)
pkill python

# Kill all Node processes (use with caution!)
pkill node

# Kill specific process by PID
kill -9 <PID>
```

### Reset Everything
```bash
# Backend reset
cd backend
deactivate
rm -rf venv __pycache__
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install -r requirements.txt

# Frontend reset
cd frontend
rm -rf node_modules dist package-lock.json
npm install

# Git reset (DANGEROUS - loses all uncommitted changes)
git reset --hard HEAD
git clean -fdx
```

---

## 📚 Help Commands

### Get Help
```bash
# Python help
python --help

# Pip help
pip --help

# Node help
node --help

# npm help
npm --help

# Git help
git --help
git <command> --help

# Uvicorn help
uvicorn --help
```

---

**Pro Tip**: Save this file for quick reference during development!
