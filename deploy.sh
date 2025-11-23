#!/bin/bash
set -e

# === CONFIGURATION ===
DEPLOY_PATH="/Users/andyibanez/Developer/Websites/Deployed/fairese.github.io-app-showcase-hugo-theme-sample-site-public"
SOURCE_PATH="/Users/andyibanez/Developer/Websites/Static/appshowcasesample.fairese.app"

# === STORE ORIGINAL DIRECTORY ===
ORIGINAL_DIR="$(pwd)"

# === BUILD DIRECTLY INTO DEPLOY PATH ===
echo "📦 Building Hugo site into deploy repo..."
hugo --minify --destination "$DEPLOY_PATH"

# === COMMIT & PUSH ===
cd "$DEPLOY_PATH"
echo "📤 Committing and pushing to deploy repo..."
git add .
git commit -m "Deploy Fairese App Showcase Site site - $(date '+%Y-%m-%d %H:%M:%S')" || echo "⚠️ Nothing to commit."
git push origin master

# === RETURN TO ORIGINAL DIRECTORY ===
cd "$ORIGINAL_DIR"
echo "🔙 Returned to original directory: $ORIGINAL_DIR"

echo "✅ Deployment complete!"