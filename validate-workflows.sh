#!/bin/bash

echo "🔍 GitHub Actions Workflow Validator"
echo "===================================="

# Check if we're in the right directory
if [ ! -d ".github/workflows" ]; then
    echo "❌ Error: .github/workflows directory not found!"
    echo "Make sure you're in the project root directory."
    exit 1
fi

echo "✅ Found .github/workflows directory"
echo ""

# Validate each workflow file
for file in .github/workflows/*.yml; do
    if [ -f "$file" ]; then
        echo "📋 Checking: $(basename "$file")"

        # Check if file is valid YAML
        if command -v python3 &> /dev/null; then
            python3 -c "import yaml; yaml.safe_load(open('$file'))" 2>/dev/null
            if [ $? -eq 0 ]; then
                echo "   ✅ Valid YAML syntax"
            else
                echo "   ❌ Invalid YAML syntax"
            fi
        else
            echo "   ⚠️  Python3 not found - skipping YAML validation"
        fi

        # Check for workflow_dispatch placement
        if grep -q "workflow_dispatch:" "$file"; then
            # Check if workflow_dispatch is the last trigger
            triggers=$(grep -E "^  [a-zA-Z_]+:" "$file" | grep -v "branches:\|paths:\|- cron:\|tags:" | wc -l)
            dispatch_line=$(grep -n "workflow_dispatch:" "$file" | cut -d: -f1)
            last_trigger_line=$(grep -n -E "^  [a-zA-Z_]+:" "$file" | tail -1 | cut -d: -f1)

            if [ "$dispatch_line" = "$last_trigger_line" ] && [ "$triggers" -gt 1 ]; then
                echo "   ✅ workflow_dispatch is correctly placed last"
            elif [ "$triggers" -eq 1 ]; then
                echo "   ✅ Single trigger workflow (workflow_dispatch only)"
            else
                echo "   ❌ workflow_dispatch should be the last trigger"
            fi
        else
            echo "   ℹ️  No workflow_dispatch trigger"
        fi

        # Check for common issues
        if grep -q "npm ci" "$file"; then
            echo "   ⚠️  Uses 'npm ci' - ensure package-lock.json exists"
        fi

        echo ""
    fi
done

echo "🎯 Validation completed!"
echo "💡 Remember: workflow_dispatch should always be the LAST trigger in the 'on:' section"
