# 🚀 Map2Market - Startup Feasibility Analyzer

> **AI-powered multi-agent platform for startup market analysis and feasibility assessment**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.11+](https://img.shields.io/badge/python-3.11+-blue.svg)](https://www.python.org/downloads/)
[![Node 18+](https://img.shields.io/badge/node-18+-green.svg)](https://nodejs.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.104+-009688.svg)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/React-18+-61DAFB.svg)](https://reactjs.org/)

Map2Market uses 5 specialized AI agents to analyze your business idea across multiple dimensions: market research, persona analysis, risk assessment, technical requirements, and financial projections.

![Map2Market Demo](https://via.placeholder.com/800x400?text=Map2Market+Demo)

## ✨ Features

### 🤖 5 Specialized AI Agents
- **👤 Persona Agent** - Identifies target customers and pain points
- **📊 Market Research Agent** - Analyzes demand, competition, and trends
- **⚠️ Risk Analysis Agent** - Evaluates market, financial, and competitive risks
- **💻 Technical/Marketing Agent** - Determines tech stack or marketing strategy
- **💰 Finance Agent** - Calculates costs, revenue, and profitability

### 🔐 Secure Authentication
- JWT-based authentication
- Bcrypt password hashing
- Protected API endpoints
- Session management

### 📊 Comprehensive Reports
- Real-time analysis progress tracking
- Detailed multi-dimensional insights
- Export-ready format
- Mobile-responsive design

### 🎨 Modern UI/UX
- Beautiful gradient design
- Dark theme optimized
- Smooth animations
- Intuitive navigation

## 🛠️ Tech Stack

### Backend
- **FastAPI** - Modern Python web framework
- **MongoDB Atlas** - Cloud NoSQL database
- **Groq API** - Ultra-fast LLM inference
- **Llama 3.1** - Open-source language model
- **Python-Jose** - JWT token handling
- **Bcrypt** - Password hashing
- **Motor** - Async MongoDB driver

### Frontend
- **React 18** - UI library
- **Vite** - Build tool
- **React Router** - Navigation
- **Tailwind CSS** - Styling
- **Axios** - HTTP client
- **Context API** - State management

### AI/ML
- **Groq API** - LLM inference
- **Llama 3.1-8B** - Language model
- **Tavily API** - Web search
- **Gemini API** - Additional AI capabilities

## 🚀 Quick Start

### Prerequisites
- Python 3.11+
- Node.js 18+
- MongoDB Atlas account
- Groq API key
- Tavily API key (optional)
- Gemini API key (optional)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/map2market.git
   cd map2market
   ```

2. **Backend Setup**
   ```bash
   cd backend
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -r requirements.txt
   cp .env.example .env
   # Edit .env with your API keys
   ```

3. **Frontend Setup**
   ```bash
   cd frontend
   npm install
   cp .env.example .env
   # Edit .env with backend URL
   ```

4. **Run the Application**
   
   Terminal 1 (Backend):
   ```bash
   cd backend
   python -m uvicorn app.main:app --reload --port 8000
   ```
   
   Terminal 2 (Frontend):
   ```bash
   cd frontend
   npm run dev
   ```

5. **Open in Browser**
   ```
   http://localhost:5173
   ```

## 📝 Environment Variables

### Backend (.env)
```env
# AI API Keys
GROQ_MARKET_RISK_KEY=your_groq_api_key
TAVILY_KEY=your_tavily_api_key
GROQ_TECH_KEY=your_groq_api_key
GEMINI_FINANCE_KEY=your_gemini_api_key

# Database
MONGODB_URL=mongodb+srv://username:password@cluster.mongodb.net/
DATABASE_NAME=map2market

# JWT Authentication
JWT_SECRET_KEY=your-super-secret-random-key-min-32-chars
JWT_ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=1440
```

### Frontend (.env)
```env
VITE_API_URL=http://localhost:8000
```

## 📖 Usage

1. **Sign Up / Login**
   - Create an account or log in
   - Secure JWT authentication

2. **Enter Business Idea**
   - Describe your startup idea
   - Specify target location(s)

3. **Run Analysis**
   - Watch 5 AI agents work in real-time
   - Each agent analyzes a different dimension

4. **View Report**
   - Comprehensive analysis report
   - Market insights, risks, financials
   - Export or print ready

## 🏗️ Project Structure

```
map2market/
├── backend/
│   ├── app/
│   │   ├── agents/          # AI agent implementations
│   │   ├── routers/         # API endpoints
│   │   ├── auth.py          # Authentication logic
│   │   ├── database.py      # MongoDB connection
│   │   ├── models.py        # Data models
│   │   └── main.py          # FastAPI app
│   ├── requirements.txt     # Python dependencies
│   └── .env.example         # Environment template
├── frontend/
│   ├── src/
│   │   ├── api/             # API client
│   │   ├── components/      # React components
│   │   ├── context/         # State management
│   │   ├── hooks/           # Custom hooks
│   │   ├── pages/           # Page components
│   │   └── main.jsx         # Entry point
│   ├── package.json         # Node dependencies
│   └── .env.example         # Environment template
├── DEPLOYMENT.md            # Deployment guide
├── CONTRIBUTING.md          # Contribution guidelines
├── GITHUB_SETUP.md          # GitHub collaboration guide
└── README.md                # This file
```

## 🚢 Deployment

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed deployment instructions for:
- Render.com (Backend)
- Vercel (Frontend)
- Railway.app
- Heroku

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Quick Contribution Steps
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📋 Roadmap

- [ ] User dashboard with analysis history
- [ ] Export reports as PDF
- [ ] Email notifications
- [ ] Team collaboration features
- [ ] Advanced analytics
- [ ] Multi-language support
- [ ] Mobile app

## 🐛 Known Issues

- Rate limits on free Groq API tier
- Demo mode available for testing without API calls

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Your Name** - *Initial work* - [YourGitHub](https://github.com/yourusername)

See also the list of [contributors](https://github.com/yourusername/map2market/contributors) who participated in this project.

## 🙏 Acknowledgments

- Groq for ultra-fast LLM inference
- Meta for Llama 3.1 model
- FastAPI for excellent documentation
- React and Vite communities

## 📞 Support

- **Documentation**: [Wiki](https://github.com/yourusername/map2market/wiki)
- **Issues**: [GitHub Issues](https://github.com/yourusername/map2market/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/map2market/discussions)

## 🌟 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=yourusername/map2market&type=Date)](https://star-history.com/#yourusername/map2market&Date)

---

Made with ❤️ by the Map2Market team
