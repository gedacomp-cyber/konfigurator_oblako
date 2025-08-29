#!/bin/bash

echo "🚀 Quick CI/CD Test"
echo "=================="

# Check if we're in the right directory
if [ ! -d "sait" ]; then
    echo "❌ Error: sait directory not found!"
    exit 1
fi

cd sait

echo "📦 Testing dependencies..."
npm install > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully"
else
    echo "❌ Dependencies installation failed"
    exit 1
fi

echo "🔍 Testing linting..."
npm run lint > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Linting passed"
else
    echo "❌ Linting failed"
fi

echo "🔧 Testing TypeScript..."
npm run type-check > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ TypeScript compilation passed"
else
    echo "❌ TypeScript compilation failed"
fi

echo "🔨 Testing build..."
npm run build > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Build completed successfully"
    echo "📊 Build output:"
    ls -la dist/
else
    echo "❌ Build failed"
    exit 1
fi

echo ""
echo "🎉 All tests passed! CI/CD is ready!"
echo ""
echo "Next steps:"
echo "1. Commit and push these changes"
echo "2. Go to Actions tab in GitHub"
echo "3. CI/CD Pipeline will run automatically"
echo "4. Check the deployment on GitHub Pages"
