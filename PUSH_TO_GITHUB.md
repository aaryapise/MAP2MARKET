# 🚀 Push to GitHub - Step by Step Guide

## ⚠️ IMPORTANT: Before You Start

### 1. Verify .env Files Are NOT Tracked

Run this command to check:
```bash
git status
```

**Make sure you DO NOT see:**
- `backend/.env`
- `frontend/.env`

If you see them, they will be uploaded! **STOP and remove them first:**
```bash
git rm --cached backend/.env
git rm --cached frontend/.env
```

### 2. Check .gitignore Exists

Verify `.gitignore` file exists in root directory and contains:
```
.env
*.env
.env.local
.env.production
```

---

## 📋 Step-by-Step GitHub Upload

### Step 1: Create GitHub Repository

1. Go to [github.com](https://github.com)
2. Click "+" icon → "New repository"
3. Fill in details:
   ```
   Repository name: map2market
   Description: AI-powered multi-agent startup feasibility analysis platform
   Visibility: Public (recommended for collaboration)
   ✅ Add a README file: NO (we already have one)
   ✅ Add .gitignore: None (we already have one)
   ✅ Choose a license: MIT License
   ```
4. Click "Create repository"
5. **Copy the repository URL** (you'll need this)

### Step 2: Initialize Git (If Not Already Done)

Open terminal in your project root directory:

```bash
# Check if git is initialized
git status

# If you see "not a git repository", initialize it:
git init
```

### Step 3: Add All Files

```bash
# Add all files to staging
git add .

# Verify what will be committed
git status

# You should see:
# - All your code files (green)
# - .env files should NOT appear (they're ignored)
```

### Step 4: Create First Commit

```bash
git commit -m "Initial commit: Map2Market AI multi-agent platform

- Add FastAPI backend with 5 AI agents
- Add React frontend with authentication
- Add MongoDB integration
- Add comprehensive documentation
- Add deployment guides"
```

### Step 5: Connect to GitHub

Replace `YOUR_USERNAME` with your actual GitHub username:

```bash
# Add remote repository
git remote add origin https://github.com/YOUR_USERNAME/map2market.git

# Verify remote was added
git remote -v
```

### Step 6: Push to GitHub

```bash
# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

**If you get an error about authentication:**

#### Option A: Use Personal Access Token (Recommended)

1. Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token (classic)"
3. Give it a name: "Map2Market Development"
4. Select scopes: `repo` (full control)
5. Click "Generate token"
6. **Copy the token** (you won't see it again!)
7. When pushing, use token as password:
   ```
   Username: your_github_username
   Password: paste_your_token_here
   ```

#### Option B: Use SSH Key

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Copy public key
cat ~/.ssh/id_ed25519.pub

# Add to GitHub: Settings → SSH and GPG keys → New SSH key
# Paste the key and save

# Change remote to SSH
git remote set-url origin git@github.com:YOUR_USERNAME/map2market.git

# Push again
git push -u origin main
```

### Step 7: Verify Upload

1. Go to your GitHub repository page
2. Refresh the page
3. You should see all your files!

**Verify these files are PRESENT:**
- ✅ README.md
- ✅ DEPLOYMENT.md
- ✅ CONTRIBUTING.md
- ✅ GITHUB_SETUP.md
- ✅ LICENSE
- ✅ .gitignore
- ✅ backend/ folder
- ✅ frontend/ folder
- ✅ backend/.env.example
- ✅ frontend/.env.example

**Verify these files are ABSENT:**
- ❌ backend/.env (should NOT be there)
- ❌ frontend/.env (should NOT be there)
- ❌ node_modules/ (should NOT be there)
- ❌ __pycache__/ (should NOT be there)

---

## 👥 Adding Collaborators

### Method 1: Direct Access (For Team Members)

1. Go to your repository on GitHub
2. Click "Settings" tab
3. Click "Collaborators" in left sidebar
4. Click "Add people"
5. Enter their GitHub username or email
6. Select permission level:
   - **Write**: Can push changes (recommended for team)
   - **Admin**: Full access
7. Click "Add [username] to this repository"
8. They'll receive an email invitation

### Method 2: Fork & Pull Request (For Open Source Contributors)

1. **They fork your repository**
   - Click "Fork" button on your repo
   - Creates a copy in their account

2. **They clone their fork**
   ```bash
   git clone https://github.com/THEIR_USERNAME/map2market.git
   cd map2market
   ```

3. **They create a branch and make changes**
   ```bash
   git checkout -b feature/new-feature
   # Make changes
   git add .
   git commit -m "feat: add new feature"
   git push origin feature/new-feature
   ```

4. **They create a Pull Request**
   - Go to their fork on GitHub
   - Click "Compare & pull request"
   - Fill in description
   - Submit PR

5. **You review and merge**
   - Review the changes
   - Comment if needed
   - Click "Merge pull request"

---

## 🔄 Daily Workflow for Team

### Pulling Latest Changes

```bash
# Before starting work, always pull latest changes
git checkout main
git pull origin main

# Create a new branch for your feature
git checkout -b feature/your-feature-name
```

### Making Changes

```bash
# Make your changes to files

# Check what changed
git status
git diff

# Add changes
git add .

# Commit with meaningful message
git commit -m "feat: add user profile page"

# Push to GitHub
git push origin feature/your-feature-name
```

### Creating Pull Request

1. Go to GitHub repository
2. You'll see a banner "Compare & pull request"
3. Click it
4. Fill in:
   ```
   Title: Add user profile page
   
   Description:
   - Added profile page component
   - Integrated with backend API
   - Added tests
   
   Closes #123
   ```
5. Click "Create pull request"
6. Wait for review and approval
7. Merge when approved

### After Merge

```bash
# Switch back to main
git checkout main

# Pull the merged changes
git pull origin main

# Delete your feature branch
git branch -d feature/your-feature-name
```

---

## 🆘 Common Issues & Solutions

### Issue 1: "Permission denied"

**Solution**: Use Personal Access Token or SSH key (see Step 6 above)

### Issue 2: ".env file is being tracked"

**Solution**:
```bash
# Remove from git tracking
git rm --cached backend/.env
git rm --cached frontend/.env

# Commit the removal
git commit -m "Remove .env files from tracking"

# Push
git push origin main
```

### Issue 3: "Merge conflict"

**Solution**:
```bash
# Pull latest changes
git pull origin main

# Git will mark conflicts in files with <<<<<<< markers
# Open files and resolve conflicts manually

# After resolving
git add .
git commit -m "Resolve merge conflicts"
git push origin main
```

### Issue 4: "Large files rejected"

**Solution**:
```bash
# Remove large files from git
git rm --cached path/to/large/file

# Add to .gitignore
echo "path/to/large/file" >> .gitignore

# Commit
git commit -m "Remove large files"
git push origin main
```

### Issue 5: "Accidentally committed secrets"

**Solution**:
1. **Immediately rotate all secrets** (generate new API keys)
2. Remove from git history:
   ```bash
   git rm --cached backend/.env
   git commit -m "Remove secrets"
   git push origin main --force
   ```
3. Update all environment variables in deployment

---

## 📊 Repository Settings

### Recommended Settings

1. **Branch Protection Rules**
   - Go to Settings → Branches
   - Add rule for `main` branch:
     - ✅ Require pull request reviews before merging
     - ✅ Require status checks to pass
     - ✅ Require branches to be up to date

2. **GitHub Actions**
   - Go to Actions tab
   - Enable workflows
   - CI/CD will run automatically on push

3. **Issues & Projects**
   - Enable Issues for bug tracking
   - Create Project board for task management

4. **Security**
   - Enable Dependabot alerts
   - Enable secret scanning
   - Review security advisories

---

## ✅ Final Checklist

Before sharing your repository:

- [ ] All code is pushed to GitHub
- [ ] .env files are NOT in repository
- [ ] .env.example files ARE in repository
- [ ] README.md is complete and accurate
- [ ] DEPLOYMENT.md has deployment instructions
- [ ] CONTRIBUTING.md has contribution guidelines
- [ ] LICENSE file is present
- [ ] .gitignore is working correctly
- [ ] Repository is public (if you want collaboration)
- [ ] Collaborators are added
- [ ] Branch protection rules are set (optional)
- [ ] GitHub Actions are enabled (optional)

---

## 🎉 You're Done!

Your Map2Market project is now on GitHub and ready for collaboration!

**Share your repository:**
```
https://github.com/YOUR_USERNAME/map2market
```

**Next steps:**
1. Share the link with your team
2. Add collaborators
3. Create issues for features/bugs
4. Set up project board
5. Deploy to production (see DEPLOYMENT.md)

---

Need help? Check [GITHUB_SETUP.md](GITHUB_SETUP.md) for more details!
