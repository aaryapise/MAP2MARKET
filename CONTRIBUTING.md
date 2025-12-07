# Contributing to Map2Market

Thank you for your interest in contributing to Map2Market! This document provides guidelines for collaboration.

## 🤝 How to Contribute

### 1. Fork the Repository

1. Click the "Fork" button at the top right of the repository
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/map2market.git
   cd map2market
   ```

### 2. Set Up Development Environment

#### Backend Setup
```bash
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env
# Edit .env with your API keys
python -m uvicorn app.main:app --reload --port 8000
```

#### Frontend Setup
```bash
cd frontend
npm install
cp .env.example .env
# Edit .env with backend URL
npm run dev
```

### 3. Create a Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/bug-description
```

Branch naming conventions:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `refactor/` - Code refactoring
- `test/` - Adding tests

### 4. Make Your Changes

- Write clean, readable code
- Follow existing code style
- Add comments for complex logic
- Test your changes thoroughly

### 5. Commit Your Changes

```bash
git add .
git commit -m "feat: add new feature description"
```

Commit message format:
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting)
- `refactor:` - Code refactoring
- `test:` - Adding tests
- `chore:` - Maintenance tasks

### 6. Push and Create Pull Request

```bash
git push origin feature/your-feature-name
```

Then:
1. Go to your fork on GitHub
2. Click "Compare & pull request"
3. Fill in the PR template
4. Submit the pull request

## 📋 Pull Request Guidelines

### PR Title Format
```
[Type] Brief description
```

Examples:
- `[Feature] Add user profile page`
- `[Fix] Resolve authentication bug`
- `[Docs] Update deployment guide`

### PR Description Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Code refactoring

## Testing
- [ ] Tested locally
- [ ] All tests pass
- [ ] No console errors

## Screenshots (if applicable)
Add screenshots here

## Related Issues
Closes #issue_number
```

## 🎯 Areas for Contribution

### High Priority
- [ ] Add unit tests for agents
- [ ] Improve error handling
- [ ] Add loading states
- [ ] Implement user dashboard
- [ ] Add analysis history
- [ ] Export reports as PDF

### Medium Priority
- [ ] Add more AI models support
- [ ] Improve UI/UX
- [ ] Add dark/light theme toggle
- [ ] Implement email notifications
- [ ] Add analytics tracking

### Low Priority
- [ ] Add more languages
- [ ] Improve documentation
- [ ] Add code examples
- [ ] Create video tutorials

## 🐛 Reporting Bugs

### Before Reporting
1. Check if the bug has already been reported
2. Try to reproduce the bug
3. Gather relevant information

### Bug Report Template
```markdown
**Describe the bug**
A clear description of the bug

**To Reproduce**
Steps to reproduce:
1. Go to '...'
2. Click on '...'
3. See error

**Expected behavior**
What you expected to happen

**Screenshots**
If applicable, add screenshots

**Environment:**
- OS: [e.g., Windows 10]
- Browser: [e.g., Chrome 120]
- Node version: [e.g., 18.0.0]
- Python version: [e.g., 3.11.0]

**Additional context**
Any other relevant information
```

## 💡 Suggesting Features

### Feature Request Template
```markdown
**Is your feature request related to a problem?**
A clear description of the problem

**Describe the solution you'd like**
A clear description of what you want to happen

**Describe alternatives you've considered**
Alternative solutions or features

**Additional context**
Any other context or screenshots
```

## 📝 Code Style Guidelines

### Python (Backend)
- Follow PEP 8
- Use type hints
- Write docstrings for functions
- Keep functions small and focused
- Use meaningful variable names

Example:
```python
def generate_market_context(user_data: dict) -> dict:
    """
    Generate market context from user input.
    
    Args:
        user_data: Dictionary containing business idea and locations
        
    Returns:
        Dictionary with persona analysis
    """
    # Implementation
    pass
```

### JavaScript/React (Frontend)
- Use functional components
- Use hooks for state management
- Keep components small and reusable
- Use meaningful component names
- Add PropTypes or TypeScript

Example:
```javascript
export default function AnalysisCard({ title, description, icon }) {
  return (
    <div className="card">
      <span>{icon}</span>
      <h3>{title}</h3>
      <p>{description}</p>
    </div>
  )
}
```

## 🧪 Testing Guidelines

### Backend Tests
```bash
cd backend
pytest
```

### Frontend Tests
```bash
cd frontend
npm test
```

### Manual Testing Checklist
- [ ] Sign up works
- [ ] Login works
- [ ] Analysis runs successfully
- [ ] Report displays correctly
- [ ] Logout works
- [ ] No console errors
- [ ] Mobile responsive

## 📚 Documentation

When adding features:
1. Update README.md if needed
2. Add inline code comments
3. Update API documentation
4. Add examples if applicable

## 🔍 Code Review Process

1. **Automated Checks**
   - Code must pass linting
   - All tests must pass
   - No merge conflicts

2. **Manual Review**
   - Code quality
   - Follows guidelines
   - Proper documentation
   - Security considerations

3. **Approval**
   - At least 1 approval required
   - Address all review comments
   - Maintainer will merge

## 🎉 Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes
- Credited in documentation

## 📞 Getting Help

- **Questions**: Open a GitHub Discussion
- **Bugs**: Open a GitHub Issue
- **Chat**: Join our Discord (if available)
- **Email**: Contact maintainers

## 📜 Code of Conduct

### Our Pledge
We pledge to make participation in our project a harassment-free experience for everyone.

### Our Standards
- Be respectful and inclusive
- Accept constructive criticism
- Focus on what's best for the community
- Show empathy towards others

### Unacceptable Behavior
- Harassment or discrimination
- Trolling or insulting comments
- Personal or political attacks
- Publishing others' private information

## 📄 License

By contributing, you agree that your contributions will be licensed under the same license as the project.

---

Thank you for contributing to Map2Market! 🚀
