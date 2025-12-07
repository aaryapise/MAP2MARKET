# GitHub Setup & Collaboration Guide

## 🚀 Initial GitHub Setup

### Step 1: Create GitHub Repository

1. **Go to GitHub**
   - Visit [github.com](https://github.com)
   - Log in to your account

2. **Create New Repository**
   - Click the "+" icon → "New repository"
   - Repository name: `map2market`
   - Description: `AI-powered multi-agent startup feasibility analysis platform`
   - Choose: **Public** (for collaboration) or **Private**
   - ✅ Add README file (skip if you already have one)
   - ✅ Add .gitignore: None (we already have one)
   - Choose License: MIT License (recommended)
   - Click "Create repository"

### Step 2: Initialize Local Git Repository

Open terminal in your project root directory:

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit: Map2Market multi-agent platform"

# Add remote repository (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/map2market.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 3: Verify Upload

1. Refresh your GitHub repository page
2. You should see all your files uploaded
3. Verify `.env` files are NOT uploaded (they should be in .gitignore)

---

## 👥 Adding Collaborators

### Method 1: Direct Collaborators (Private Repo)

1. **Go to Repository Settings**
   - Click "Settings" tab
   - Click "Collaborators" in left sidebar
   - Click "Add people"

2. **Add Collaborator**
   - Enter their GitHub username or email
   - Select the person
   - Choose permission level:
     - **Read**: Can view and clone
     - **Write**: Can push changes
     - **Admin**: Full access
   - Click "Add [username] to this repository"

3. **Collaborator Accepts**
   - They'll receive an email invitation
   - Must accept to get access

### Method 2: Fork & Pull Request (Public Repo - Recommended)

1. **Collaborators Fork Your Repo**
   - They click "Fork" button on your repository
   - Creates a copy in their account

2. **They Clone Their Fork**
   ```bash
   git clone https://github.com/THEIR_USERNAME/map2market.git
   cd map2market
   ```

3. **They Make Changes**
   ```bash
   git checkout -b feature/new-feature
   # Make changes
   git add .
   git commit -m "Add new feature"
   git push origin feature/new-feature
   ```

4. **They Create Pull Request**
   - Go to their fork on GitHub
   - Click "Compare & pull request"
   - Fill in description
   - Submit PR

5. **You Review & Merge**
   - Review the changes
   - Comment if needed
   - Click "Merge pull request"

---

## 🔐 Protecting Sensitive Information

### Files to NEVER Commit

✅ Already in `.gitignore`:
- `backend/.env`
- `frontend/.env`
- `node_modules/`
- `__pycache__/`
- `.vscode/`

### If You Accidentally Committed Secrets

1. **Remove from Git History**
   ```bash
   # Remove file from git but keep locally
   git rm --cached backend/.env
   
   # Commit the removal
   git commit -m "Remove .env file from tracking"
   
   # Push changes
   git push origin main
   ```

2. **Rotate All Secrets**
   - Generate new API keys
   - Update MongoDB password
   - Create new JWT secret
   - Update all environment variables

3. **Use GitHub Secrets** (for CI/CD)
   - Go to Settings → Secrets and variables → Actions
   - Add secrets for automated deployments

---

## 🌿 Git Workflow for Teams

### Branch Strategy

```
main (production)
  ├── develop (development)
  │   ├── feature/user-dashboard
  │   ├── feature/export-pdf
  │   └── fix/authentication-bug
```

### Creating Feature Branch

```bash
# Update main branch
git checkout main
git pull origin main

# Create feature branch
git checkout -b feature/user-dashboard

# Make changes and commit
git add .
git commit -m "feat: add user dashboard"

# Push to GitHub
git push origin feature/user-dashboard
```

### Merging Changes

```bash
# Update your branch with latest main
git checkout feature/user-dashboard
git pull origin main

# Resolve any conflicts
# Then push
git push origin feature/user-dashboard

# Create Pull Request on GitHub
# After approval, merge via GitHub UI
```

---

## 📋 GitHub Project Management

### Setting Up Project Board

1. **Create Project**
   - Go to "Projects" tab
   - Click "New project"
   - Choose "Board" template
   - Name it "Map2Market Development"

2. **Create Columns**
   - 📋 Backlog
   - 🔄 In Progress
   - 👀 In Review
   - ✅ Done

3. **Add Issues as Cards**
   - Create issues for features/bugs
   - Drag to appropriate column
   - Assign to team members

### Creating Issues

1. **Go to Issues Tab**
   - Click "New issue"

2. **Issue Template**
   ```markdown
   **Title**: Add user profile page
   
   **Description**
   We need a user profile page where users can:
   - View their account info
   - See analysis history
   - Update settings
   
   **Acceptance Criteria**
   - [ ] Profile page displays user info
   - [ ] Shows list of past analyses
   - [ ] Settings can be updated
   
   **Labels**: enhancement, frontend
   **Assignees**: @username
   **Milestone**: v1.1
   ```

### Using Labels

Create these labels:
- 🐛 `bug` - Something isn't working
- ✨ `enhancement` - New feature
- 📚 `documentation` - Documentation updates
- 🎨 `design` - UI/UX improvements
- 🔥 `priority-high` - High priority
- 🔧 `backend` - Backend related
- 💻 `frontend` - Frontend related

---

## 🔄 Keeping Forks Synced

### For Collaborators Using Forks

```bash
# Add upstream remote (original repo)
git remote add upstream https://github.com/ORIGINAL_OWNER/map2market.git

# Fetch upstream changes
git fetch upstream

# Merge upstream main into your main
git checkout main
git merge upstream/main

# Push to your fork
git push origin main
```

---

## 🤖 GitHub Actions (CI/CD)

### Create Workflow File

Create `.github/workflows/test.yml`:

```yaml
name: Run Tests

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  backend-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      - name: Install dependencies
        run: |
          cd backend
          pip install -r requirements.txt
      - name: Run tests
        run: |
          cd backend
          pytest

  frontend-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Node
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      - name: Install dependencies
        run: |
          cd frontend
          npm install
      - name: Run tests
        run: |
          cd frontend
          npm test
```

---

## 📊 GitHub Insights

### Useful GitHub Features

1. **Insights Tab**
   - View contributor activity
   - See commit frequency
   - Track code additions/deletions

2. **Network Graph**
   - Visualize branch structure
   - See all forks and branches

3. **Pulse**
   - Weekly summary of activity
   - PRs merged, issues closed

4. **Contributors**
   - See who contributed what
   - Contribution statistics

---

## 🎯 Best Practices

### Commit Messages

✅ Good:
```
feat: add user authentication
fix: resolve MongoDB connection issue
docs: update deployment guide
refactor: simplify agent pipeline
```

❌ Bad:
```
update
fixed stuff
changes
asdfasdf
```

### Pull Requests

✅ Good PR:
- Clear title and description
- Links to related issues
- Screenshots if UI changes
- Tests added/updated
- Documentation updated

❌ Bad PR:
- No description
- Hundreds of files changed
- Unrelated changes mixed together
- No testing

### Code Reviews

When reviewing:
- ✅ Be constructive and kind
- ✅ Explain why changes are needed
- ✅ Suggest alternatives
- ✅ Approve when ready

Avoid:
- ❌ Harsh criticism
- ❌ Nitpicking style without reason
- ❌ Blocking without explanation

---

## 🆘 Common Git Issues

### Merge Conflicts

```bash
# Pull latest changes
git pull origin main

# If conflicts occur, Git will mark them in files
# Open conflicted files and resolve manually
# Look for <<<<<<< HEAD markers

# After resolving
git add .
git commit -m "Resolve merge conflicts"
git push
```

### Undo Last Commit

```bash
# Undo commit but keep changes
git reset --soft HEAD~1

# Undo commit and discard changes
git reset --hard HEAD~1
```

### Discard Local Changes

```bash
# Discard all local changes
git reset --hard HEAD

# Discard changes in specific file
git checkout -- filename.py
```

---

## 📞 Getting Help

- **Git Documentation**: [git-scm.com/doc](https://git-scm.com/doc)
- **GitHub Docs**: [docs.github.com](https://docs.github.com)
- **Git Cheat Sheet**: [education.github.com/git-cheat-sheet](https://education.github.com/git-cheat-sheet-education.pdf)

---

## ✅ Checklist Before Pushing

- [ ] Code works locally
- [ ] No `.env` files included
- [ ] No sensitive data in code
- [ ] Meaningful commit message
- [ ] Code follows style guidelines
- [ ] Documentation updated if needed
- [ ] Tests pass (if applicable)

---

Happy collaborating! 🚀
