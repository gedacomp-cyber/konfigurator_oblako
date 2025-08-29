#!/bin/bash

echo "🔍 GitHub Actions Workflow Checker"
echo "=================================="

WORKFLOW_DIR=".github/workflows"

if [ ! -d "$WORKFLOW_DIR" ]; then
    echo "❌ Error: $WORKFLOW_DIR directory not found!"
    exit 1
fi

echo "✅ Found workflows directory"
echo ""

# Check each workflow file
for file in $WORKFLOW_DIR/*.yml; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        echo "📋 Checking: $filename"

        # Check if it has push trigger
        if grep -q "push:" "$file"; then
            echo "   ✅ Has push trigger (will run automatically)"
        else
            echo "   ℹ️  No push trigger (manual only)"
        fi

        # Check if it has workflow_dispatch
        if grep -q "workflow_dispatch:" "$file"; then
            echo "   ✅ Has workflow_dispatch (manual trigger)"
        else
            echo "   ℹ️  No workflow_dispatch"
        fi

        # Check if it has schedule
        if grep -q "schedule:" "$file"; then
            echo "   ✅ Has schedule trigger"
        fi

        echo ""
    fi
done

echo "🎯 Summary:"
echo "- Push Status: Should run on every push"
echo "- Simple Status: Should run on every push"
echo "- Test Workflow: Manual + push trigger"
echo "- CI/CD Pipeline: Full automation"
echo "- Others: Manual or scheduled"
echo ""
echo "💡 Push any small change to test automatic workflows!"
