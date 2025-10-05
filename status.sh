#!/bin/bash

# 简化的部署状态检查

USERNAME="hollipembletoncrf40-sudo"
SITE_URL="https://$USERNAME.github.io/canton-fair-analysis"

echo "🔍 检查部署状态..."
echo "网站地址: $SITE_URL"
echo ""

# 检查网站状态
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$SITE_URL")

case $HTTP_CODE in
    200)
        echo "✅ 网站已成功部署！"
        echo "🌐 访问地址: $SITE_URL"
        echo ""
        echo "🎉 恭喜！您的Canton Fair Analysis网站已经可以访问了！"
        ;;
    404)
        echo "⏳ 网站正在部署中... (HTTP 404)"
        echo "请等待2-5分钟让GitHub Actions完成部署"
        ;;
    403)
        echo "⚠️  网站暂时不可访问 (HTTP 403)"
        echo "可能是GitHub Pages正在处理中"
        ;;
    *)
        echo "⚠️  网站状态异常 (HTTP $HTTP_CODE)"
        echo "请检查GitHub Pages设置"
        ;;
esac

echo ""
echo "📊 GitHub Actions状态:"
echo "https://github.com/$USERNAME/canton-fair-analysis/actions"
