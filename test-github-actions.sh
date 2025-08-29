#!/bin/bash

echo "🧪 Testing GitHub Actions locally..."
echo "=================================="

# Check if we're in the right directory
if [ ! -d ".github/workflows" ]; then
    echo "❌ Error: .github/workflows directory not found!"
    echo "Make sure you're in the project root directory."
    exit 1
fi

echo "✅ Found .github/workflows directory"

# Check workflow files
echo ""
echo "📋 Checking workflow files:"
for file in .github/workflows/*.yml; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    fi
done

# Check if Node.js is available
echo ""
echo "🔍 Checking Node.js:"
if command -v node &> /dev/null; then
    echo "✅ Node.js version: $(node --version)"
else
    echo "❌ Node.js not found!"
fi

if command -v npm &> /dev/null; then
    echo "✅ npm version: $(npm --version)"
else
    echo "❌ npm not found!"
fi

# Check project structure
echo ""
echo "📁 Checking project structure:"
if [ -d "sait" ]; then
    echo "✅ sait/ directory found"
    if [ -f "sait/package.json" ]; then
        echo "✅ sait/package.json found"
    else
        echo "❌ sait/package.json not found!"
    fi
else
    echo "❌ sait/ directory not found!"
fi

echo ""
echo "🎯 Next steps:"
echo "1. Commit and push these changes to GitHub"
echo "2. Go to your repository → Actions tab"
echo "3. You should see workflows running automatically"
echo "4. Check the 'Test Workflow' first - it should work immediately"

echo ""
echo "🚀 GitHub Actions should start working now!"
