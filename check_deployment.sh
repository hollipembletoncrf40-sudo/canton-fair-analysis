#!/bin/bash

# GitHub Pages 部署状态检查脚本

USERNAME="hollipembletoncrf40-sudo"
REPO_NAME="canton-fair-analysis"
SITE_URL="https://$USERNAME.github.io/$REPO_NAME"
REPO_URL="https://github.com/$USERNAME/$REPO_NAME"

echo "🔍 检查 GitHub Pages 部署状态"
echo "=================================="
echo "仓库: $REPO_URL"
echo "网站: $SITE_URL"
echo ""

# 检查网站状态
echo "🌐 检查网站状态..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$SITE_URL")

if [ "$HTTP_CODE" = "200" ]; then
    echo "✅ 网站已成功部署！"
    echo "🌐 访问地址: $SITE_URL"
    echo ""
    echo "🎉 部署完成！您的Canton Fair Analysis网站已经可以访问了！"
elif [ "$HTTP_CODE" = "404" ]; then
    echo "⏳ 网站正在部署中... (HTTP 404)"
    echo ""
    echo "📋 请完成以下步骤:"
    echo "1. 访问: $REPO_URL/settings/pages"
    echo "2. 在 'Source' 部分选择 'GitHub Actions'"
    echo "3. 保存设置"
    echo "4. 等待2-5分钟让部署完成"
    echo ""
    echo "🔄 部署完成后，网站将在以下地址可用:"
    echo "   $SITE_URL"
else
    echo "⚠️  网站状态异常 (HTTP $HTTP_CODE)"
    echo "请检查GitHub Pages设置"
fi

echo ""
echo "📊 检查GitHub Actions状态..."
echo "访问: $REPO_URL/actions"

# 尝试打开相关页面
if command -v open > /dev/null; then
    echo ""
    read -p "是否打开GitHub Pages设置页面? (y/N): " OPEN_SETTINGS
    if [[ $OPEN_SETTINGS =~ ^[Yy]$ ]]; then
        open "$REPO_URL/settings/pages"
    fi
    
    read -p "是否打开GitHub Actions页面? (y/N): " OPEN_ACTIONS
    if [[ $OPEN_ACTIONS =~ ^[Yy]$ ]]; then
        open "$REPO_URL/actions"
    fi
fi
