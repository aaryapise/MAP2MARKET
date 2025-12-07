# Map2Market Deployment Guide

## 🚀 Deployment Options

### Option 1: Deploy Backend on Render.com (Recommended)

#### Backend Deployment (Render)

1. **Create Render Account**
   - Go to [render.com](https://render.com)
   - Sign up with GitHub

2. **Create New Web Service**
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select the repository

3. **Configure Service**
   ```
   Name: map2market-backend
   Region: Choose closest to your users
   Branch: main
   Root Directory: backend
   Runtime: Python 3
   Build Command: pip install -r requirements.txt
   Start Command: uvicorn app.main:app --host 0.0.0.0 --port $PORT
   ```

4. **Add Environment Variables**
   Go to "Environment" tab and add:
   ```
   GROQ_MARKET_RISK_KEY=your_groq_key
   TAVILY_KEY=your_tavily_key
   GROQ_TECH_KEY=your_groq_key
   GEMINI_FINANCE_KEY=your_gemini_key
   MONGODB_URL=your_mongodb_atlas_url
   DATABASE_NAME=map2market
   JWT_SECRET_KEY=generate_random_secret_key_here
   JWT_ALGORITHM=HS256
   ACCESS_TOKEN_EXPIRE_MINUTES=1440
   ```

5. **Deploy**
   - Click "Create Web Service"
   - Wait for deployment (5-10 minutes)
   - Copy your backend URL: `https://map2market-backend.onrender.com`

#### Frontend Deployment (Vercel)

1. **Create Vercel Account**
   - Go to [vercel.com](https://vercel.com)
   - Sign up with GitHub

2. **Import Project**
   - Click "Add New" → "Project"
   - Import your GitHub repository
   - Select the repository

3. **Configure Project**
   ```
   Framework Preset: Vite
   Root Directory: frontend
   Build Command: npm run build
   Output Directory: dist
   Install Command: npm install
   ```

4. **Add Environment Variable**
   ```
   VITE_API_URL=https://map2market-backend.onrender.com
   ```

5. **Deploy**
   - Click "Deploy"
   - Wait for deployment (2-3 minutes)
   - Your app will be live at: `https://map2market.vercel.app`

---

### Option 2: Deploy on Railway.app

#### Backend on Railway

1. **Create Railway Account**
   - Go to [railway.app](https://railway.app)
   - Sign up with GitHub

2. **New Project**
   - Click "New Project" → "Deploy from GitHub repo"
   - Select your repository

3. **Configure**
   - Root Directory: `backend`
   - Start Command: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`

4. **Add Environment Variables** (same as Render)

5. **Generate Domain**
   - Go to Settings → Generate Domain
   - Copy the URL

#### Frontend on Vercel (same as above)

---

### Option 3: Deploy on Heroku

#### Backend on Heroku

1. **Create Procfile** (already created below)

2. **Create Heroku App**
   ```bash
   heroku login
   heroku create map2market-backend
   ```

3. **Set Environment Variables**
   ```bash
   heroku config:set GROQ_MARKET_RISK_KEY=your_key
   heroku config:set MONGODB_URL=your_mongodb_url
   # ... add all other env vars
   ```

4. **Deploy**
   ```bash
   git subtree push --prefix backend heroku main
   ```

---

## 🔐 Security Checklist

Before deploying:

- [ ] Change `JWT_SECRET_KEY` to a strong random string
- [ ] Never commit `.env` files to GitHub
- [ ] Use environment variables for all secrets
- [ ] Enable CORS only for your frontend domain in production
- [ ] Set up MongoDB Atlas IP whitelist (or allow all for cloud deployment)
- [ ] Use HTTPS for all API calls
- [ ] Set strong passwords for MongoDB users

---

## 🔧 Environment Variables Reference

### Backend (.env)
```env
# AI API Keys
GROQ_MARKET_RISK_KEY=your_groq_api_key
TAVILY_KEY=your_tavily_api_key
GROQ_TECH_KEY=your_groq_api_key
GEMINI_FINANCE_KEY=your_gemini_api_key

# Database
MONGODB_URL=mongodb+srv://username:password@cluster.mongodb.net/?retryWrites=true&w=majority
DATABASE_NAME=map2market

# JWT Authentication
JWT_SECRET_KEY=your-super-secret-random-key-min-32-chars
JWT_ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=1440
```

### Frontend (.env)
```env
VITE_API_URL=https://your-backend-url.com
```

---

## 📝 Post-Deployment Steps

1. **Test Authentication**
   - Sign up with a test account
   - Verify JWT tokens are working
   - Test login/logout

2. **Test Analysis**
   - Run a sample analysis
   - Verify all 5 agents execute
   - Check report generation

3. **Monitor Logs**
   - Check backend logs for errors
   - Monitor API rate limits
   - Watch database connections

4. **Set Up Monitoring** (Optional)
   - Use Render/Railway built-in monitoring
   - Set up Sentry for error tracking
   - Configure uptime monitoring

---

## 🐛 Troubleshooting

### Backend won't start
- Check all environment variables are set
- Verify MongoDB connection string
- Check Python version (3.9+)

### Frontend can't connect to backend
- Verify VITE_API_URL is correct
- Check CORS settings in backend
- Ensure backend is running

### Authentication fails
- Verify JWT_SECRET_KEY is set
- Check MongoDB connection
- Verify bcrypt is installed correctly

### Analysis fails
- Check Groq API keys are valid
- Verify rate limits haven't been exceeded
- Check backend logs for specific errors

---

## 🔄 Continuous Deployment

Both Vercel and Render support automatic deployments:

1. **Push to GitHub**
   ```bash
   git add .
   git commit -m "Update feature"
   git push origin main
   ```

2. **Auto-Deploy**
   - Vercel and Render will automatically detect changes
   - Build and deploy new version
   - Usually takes 2-5 minutes

---

## 💰 Cost Estimate

### Free Tier (Recommended for MVP)
- **Render**: Free (with sleep after inactivity)
- **Vercel**: Free (100GB bandwidth/month)
- **MongoDB Atlas**: Free (512MB storage)
- **Total**: $0/month

### Production Tier
- **Render**: $7/month (always on)
- **Vercel**: Free or $20/month (Pro)
- **MongoDB Atlas**: $9/month (Shared cluster)
- **Total**: $16-36/month

---

## 📚 Additional Resources

- [Render Documentation](https://render.com/docs)
- [Vercel Documentation](https://vercel.com/docs)
- [MongoDB Atlas Setup](https://www.mongodb.com/docs/atlas/)
- [FastAPI Deployment](https://fastapi.tiangolo.com/deployment/)
- [Vite Deployment](https://vitejs.dev/guide/static-deploy.html)
