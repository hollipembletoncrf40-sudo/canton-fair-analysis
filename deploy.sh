#!/bin/bash

# Canton Fair Analysis - GitHub Pages 部署脚本
# 使用方法: ./deploy.sh your-github-username

if [ $# -eq 0 ]; then
    echo "使用方法: ./deploy.sh your-github-username"
    echo "例如: ./deploy.sh john-doe"
    exit 1
fi

USERNAME=$1
REPO_NAME="canton-fair-analysis"
REPO_URL="https://github.com/$USERNAME/$REPO_NAME.git"

echo "🚀 开始部署 Canton Fair Analysis 到 GitHub Pages"
echo "用户名: $USERNAME"
echo "仓库名: $REPO_NAME"
echo "仓库URL: $REPO_URL"
echo ""

# 检查是否已经初始化Git仓库
if [ ! -d ".git" ]; then
    echo "❌ 错误: 当前目录不是Git仓库"
    echo "请先运行: git init"
    exit 1
fi

# 检查是否有远程仓库
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "📡 添加远程仓库..."
    git remote add origin $REPO_URL
else
    echo "📡 更新远程仓库URL..."
    git remote set-url origin $REPO_URL
fi

# 检查文件是否存在
if [ ! -f "index.html" ]; then
    echo "❌ 错误: index.html 文件不存在"
    exit 1
fi

if [ ! -f "README.md" ]; then
    echo "❌ 错误: README.md 文件不存在"
    exit 1
fi

# 添加所有文件
echo "📁 添加文件到Git..."
git add .

# 提交更改
echo "💾 提交更改..."
git commit -m "Deploy Canton Fair Analysis to GitHub Pages"

# 推送到GitHub
echo "🚀 推送到GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 部署成功！"
    echo ""
    echo "🌐 你的网站将在以下地址可用:"
    echo "   https://$USERNAME.github.io/$REPO_NAME"
    echo ""
    echo "📋 下一步操作:"
    echo "1. 访问 https://github.com/$USERNAME/$REPO_NAME"
    echo "2. 点击 'Settings' 标签"
    echo "3. 在左侧菜单中找到 'Pages'"
    echo "4. 在 'Source' 部分选择 'GitHub Actions'"
    echo "5. 保存设置并等待部署完成"
    echo ""
    echo "⏱️  部署通常需要2-5分钟完成"
    echo "🔄 如果需要更新，只需运行: git push origin main"
else
    echo ""
    echo "❌ 推送失败！"
    echo ""
    echo "🔧 可能的解决方案:"
    echo "1. 检查GitHub用户名是否正确"
    echo "2. 确认仓库已创建: https://github.com/$USERNAME/$REPO_NAME"
    echo "3. 检查网络连接"
    echo "4. 确认GitHub认证信息"
    echo ""
    echo "📖 详细说明请查看 DEPLOYMENT_GUIDE.md"
fi
