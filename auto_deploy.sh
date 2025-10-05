#!/bin/bash

# Canton Fair Analysis - 自动检测部署脚本
# 自动检测GitHub配置并执行部署

echo "🚀 Canton Fair Analysis - 自动部署到GitHub Pages"
echo "================================================"
echo ""

# 检查Git仓库状态
if [ ! -d ".git" ]; then
    echo "❌ 错误: 当前目录不是Git仓库"
    exit 1
fi

# 检查必要文件
if [ ! -f "index.html" ]; then
    echo "❌ 错误: index.html 文件不存在"
    exit 1
fi

echo "✅ Git仓库检查通过"
echo "✅ 必要文件检查通过"
echo ""

# 尝试从Git配置中获取用户名
GIT_USERNAME=$(git config --global user.name 2>/dev/null)
GIT_EMAIL=$(git config --global user.email 2>/dev/null)

if [ -n "$GIT_USERNAME" ]; then
    echo "🔍 检测到Git配置:"
    echo "   用户名: $GIT_USERNAME"
    echo "   邮箱: $GIT_EMAIL"
    echo ""
    
    # 尝试从邮箱推断GitHub用户名
    if [[ $GIT_EMAIL == *"@"* ]]; then
        EMAIL_USERNAME=$(echo $GIT_EMAIL | cut -d'@' -f1)
        echo "💡 建议的GitHub用户名: $EMAIL_USERNAME"
        echo ""
        
        read -p "使用建议的用户名 '$EMAIL_USERNAME' 进行部署? (Y/n): " USE_SUGGESTED
        if [[ ! $USE_SUGGESTED =~ ^[Nn]$ ]]; then
            USERNAME=$EMAIL_USERNAME
        else
            read -p "请输入您的GitHub用户名: " USERNAME
        fi
    else
        read -p "请输入您的GitHub用户名: " USERNAME
    fi
else
    echo "⚠️  未检测到Git配置"
    read -p "请输入您的GitHub用户名: " USERNAME
fi

if [ -z "$USERNAME" ]; then
    echo "❌ 错误: 用户名不能为空"
    exit 1
fi

echo ""
echo "🎯 部署信息:"
echo "   GitHub用户名: $USERNAME"
echo "   仓库名: canton-fair-analysis"
echo "   网站地址: https://$USERNAME.github.io/canton-fair-analysis"
echo ""

# 确认部署
read -p "确认开始部署? (Y/n): " CONFIRM
if [[ $CONFIRM =~ ^[Nn]$ ]]; then
    echo "❌ 部署已取消"
    exit 0
fi

echo ""
echo "🚀 开始自动部署..."

# 设置仓库URL
REPO_URL="https://github.com/$USERNAME/canton-fair-analysis.git"

# 检查是否已有远程仓库
if git remote get-url origin > /dev/null 2>&1; then
    echo "📡 更新远程仓库URL..."
    git remote set-url origin $REPO_URL
else
    echo "📡 添加远程仓库..."
    git remote add origin $REPO_URL
fi

# 检查是否有未提交的更改
if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "📁 发现未提交的更改，正在添加..."
    git add .
    git commit -m "Update: 准备部署到GitHub Pages"
fi

# 推送到GitHub
echo "🚀 推送到GitHub..."
if git push -u origin main; then
    echo ""
    echo "🎉 部署成功！"
    echo ""
    echo "📋 完成以下步骤以启用GitHub Pages:"
    echo "1. 访问: https://github.com/$USERNAME/canton-fair-analysis"
    echo "2. 点击 'Settings' 标签"
    echo "3. 在左侧菜单中找到 'Pages'"
    echo "4. 在 'Source' 部分选择 'GitHub Actions'"
    echo "5. 保存设置"
    echo ""
    echo "⏱️  部署通常需要2-5分钟完成"
    echo "🌐 部署完成后，您的网站将在以下地址可用:"
    echo "   https://$USERNAME.github.io/canton-fair-analysis"
    echo ""
    echo "🔄 更新网站命令:"
    echo "   git push origin main"
    echo ""
    
    # 尝试打开GitHub仓库页面
    if command -v open > /dev/null; then
        echo "🌐 正在打开GitHub仓库页面..."
        sleep 2
        open "https://github.com/$USERNAME/canton-fair-analysis"
    fi
    
else
    echo ""
    echo "❌ 推送失败！"
    echo ""
    echo "🔧 请检查以下项目:"
    echo "1. GitHub用户名是否正确: $USERNAME"
    echo "2. 仓库是否已创建: https://github.com/$USERNAME/canton-fair-analysis"
    echo "3. 网络连接是否正常"
    echo "4. GitHub认证是否有效"
    echo ""
    echo "📋 如果仓库不存在，请先创建:"
    echo "1. 访问 https://github.com/new"
    echo "2. 仓库名: canton-fair-analysis"
    echo "3. 设置为公开仓库"
    echo "4. 不要添加README"
    echo "5. 点击 'Create repository'"
    echo ""
    echo "创建完成后，再次运行此脚本"
fi
