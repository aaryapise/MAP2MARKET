# 🚀 Deployment Checklist

Use this checklist to ensure your Map2Market application is deployment-ready.

## 📋 Pre-Deployment Checklist

### Security
- [ ] All `.env` files are in `.gitignore`
- [ ] No API keys or secrets in code
- [ ] JWT_SECRET_KEY is strong and random (32+ characters)
- [ ] MongoDB password is strong
- [ ] CORS is configured for production domain only
- [ ] All dependencies are up to date

### Code Quality
- [ ] All features work locally
- [ ] No console errors in browser
- [ ] Backend API responds correctly
- [ ] Authentication works (signup/login/logout)
- [ ] Analysis runs successfully
- [ ] Reports display correctly
- [ ] Mobile responsive design works

### Documentation
- [ ] README.md is complete
- [ ] DEPLOYMENT.md has deployment steps
- [ ] CONTRIBUTING.md has contribution guidelines
- [ ] API endpoints are documented
- [ ] Environment variables are documented

### Git & GitHub
- [ ] Code is committed to Git
- [ ] Repository is on GitHub
- [ ] `.env` files are NOT in repository
- [ ] `.env.example` files ARE in repository
- [ ] `.gitignore` is working correctly
- [ ] Repository has a license (MIT recommended)

---

## 🔧 Backend Deployment Checklist

### MongoDB Atlas Setup
- [ ] MongoDB Atlas account created
- [ ] Cluster created (Free tier is fine)
- [ ] Database user created with password
- [ ] Network access configured (allow all IPs for cloud deployment)
- [ ] Connection string copied
- [ ] Database name set to `map2market`

### API Keys
- [ ] Groq API key obtained (free tier available)
- [ ] Tavily API key obtained (optional)
- [ ] Gemini API key obtained (optional)
- [ ] All keys tested and working

### Render.com Deployment
- [ ] Render account created
- [ ] New Web Service created
- [ ] GitHub repository connected
- [ ] Build command set: `pip install -r requirements.txt`
- [ ] Start command set: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`
- [ ] Root directory set to `backend`
- [ ] All environment variables added
- [ ] Service deployed successfully
- [ ] Backend URL copied

### Backend Testing
- [ ] Health check endpoint works: `GET /`
- [ ] API documentation accessible: `GET /docs`
- [ ] Signup endpoint works: `POST /api/auth/signup`
- [ ] Login endpoint works: `POST /api/auth/login`
- [ ] Analysis endpoint works: `POST /api/analyze` (with auth)
- [ ] No errors in deployment logs

---

## 🎨 Frontend Deployment Checklist

### Vercel Deployment
- [ ] Vercel account created
- [ ] New project created
- [ ] GitHub repository connected
- [ ] Framework preset set to `Vite`
- [ ] Root directory set to `frontend`
- [ ] Build command set: `npm run build`
- [ ] Output directory set: `dist`
- [ ] Environment variable `VITE_API_URL` set to backend URL
- [ ] Project deployed successfully
- [ ] Frontend URL copied

### Frontend Testing
- [ ] Home page loads correctly
- [ ] Signup page works
- [ ] Login page works
- [ ] Analysis page works
- [ ] Report page displays correctly
- [ ] Logout works
- [ ] No console errors
- [ ] Mobile view works
- [ ] All links work

---

## 🔗 Integration Testing

### End-to-End Flow
- [ ] User can sign up
- [ ] User receives JWT token
- [ ] User can log in
- [ ] User can submit business idea
- [ ] Analysis runs successfully
- [ ] All 5 agents execute
- [ ] Report displays with data
- [ ] User can log out
- [ ] Logged out user cannot access protected pages

### Cross-Origin Testing
- [ ] Frontend can call backend API
- [ ] CORS headers are correct
- [ ] Authentication tokens are sent
- [ ] API responses are received

---

## 📊 Monitoring Setup

### Render Monitoring
- [ ] Check deployment logs for errors
- [ ] Monitor response times
- [ ] Check for rate limit errors
- [ ] Monitor database connections

### Vercel Monitoring
- [ ] Check build logs
- [ ] Monitor page load times
- [ ] Check for JavaScript errors
- [ ] Monitor bandwidth usage

### Optional: Advanced Monitoring
- [ ] Set up Sentry for error tracking
- [ ] Configure uptime monitoring (UptimeRobot)
- [ ] Set up log aggregation (Logtail)
- [ ] Configure performance monitoring

---

## 🔐 Security Hardening

### Production Security
- [ ] Change all default passwords
- [ ] Rotate all API keys
- [ ] Generate new JWT secret
- [ ] Enable HTTPS only
- [ ] Set secure cookie flags
- [ ] Configure rate limiting
- [ ] Enable CORS for specific domain only
- [ ] Set up MongoDB IP whitelist (if not using cloud)

### Update CORS in Production

In `backend/app/main.py`, update:
```python
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "https://your-frontend-domain.vercel.app",  # Your actual domain
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

---

## 📝 Post-Deployment Tasks

### Documentation
- [ ] Update README with live URLs
- [ ] Add deployment date to CHANGELOG
- [ ] Document any deployment issues
- [ ] Update API documentation

### Communication
- [ ] Notify team of deployment
- [ ] Share live URLs
- [ ] Provide login credentials for testing
- [ ] Schedule demo/walkthrough

### Monitoring
- [ ] Check application daily for first week
- [ ] Monitor error logs
- [ ] Track user signups
- [ ] Monitor API usage and rate limits

---

## 🐛 Troubleshooting

### Backend Issues

**Issue**: Backend won't start
- Check all environment variables are set
- Verify MongoDB connection string
- Check Python version (3.11+)
- Review deployment logs

**Issue**: Database connection fails
- Verify MongoDB Atlas IP whitelist
- Check connection string format
- Verify database user credentials
- Check network access settings

**Issue**: API returns 500 errors
- Check backend logs for stack traces
- Verify all API keys are valid
- Check for rate limit errors
- Verify all dependencies are installed

### Frontend Issues

**Issue**: Frontend can't connect to backend
- Verify `VITE_API_URL` is correct
- Check CORS settings in backend
- Verify backend is running
- Check browser console for errors

**Issue**: Authentication fails
- Verify JWT_SECRET_KEY is set
- Check token expiration time
- Verify MongoDB connection
- Check browser localStorage

**Issue**: Build fails
- Check Node version (18+)
- Verify all dependencies are installed
- Check for TypeScript errors
- Review build logs

---

## 💰 Cost Tracking

### Free Tier Limits

**Render (Backend)**
- Free tier sleeps after 15 min inactivity
- 750 hours/month free
- Upgrade to $7/month for always-on

**Vercel (Frontend)**
- 100GB bandwidth/month free
- Unlimited deployments
- Upgrade to $20/month for Pro features

**MongoDB Atlas**
- 512MB storage free
- Shared cluster
- Upgrade to $9/month for dedicated

**Groq API**
- Free tier with rate limits
- Check current limits at groq.com

### Monthly Cost Estimate

**Free Tier**: $0/month
- Render Free
- Vercel Free
- MongoDB Free
- Groq Free

**Production Tier**: $16-36/month
- Render: $7/month
- Vercel: $0-20/month
- MongoDB: $9/month
- Groq: $0 (or paid tier)

---

## ✅ Final Verification

Before announcing your deployment:

- [ ] All checklist items above are complete
- [ ] Application works end-to-end
- [ ] No errors in logs
- [ ] Performance is acceptable
- [ ] Security measures are in place
- [ ] Monitoring is configured
- [ ] Team is notified
- [ ] Documentation is updated

---

## 🎉 Deployment Complete!

Congratulations! Your Map2Market application is now live!

**Live URLs:**
- Frontend: `https://your-app.vercel.app`
- Backend: `https://your-app.onrender.com`
- API Docs: `https://your-app.onrender.com/docs`

**Next Steps:**
1. Share with users
2. Gather feedback
3. Monitor performance
4. Plan next features
5. Iterate and improve

---

**Need help?** Check:
- [DEPLOYMENT.md](DEPLOYMENT.md) - Detailed deployment guide
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - Common issues
- [GitHub Issues](https://github.com/yourusername/map2market/issues) - Report bugs
