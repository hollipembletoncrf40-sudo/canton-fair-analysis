#!/bin/bash

# Canton Fair Analysis - 交互式一键部署脚本
# 自动引导用户完成GitHub Pages部署

echo "🚀 Canton Fair Analysis - 一键部署到GitHub Pages"
echo "=================================================="
echo ""

# 检查Git仓库状态
if [ ! -d ".git" ]; then
    echo "❌ 错误: 当前目录不是Git仓库"
    echo "请先运行: git init"
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

# 获取GitHub用户名
echo "📝 请输入您的GitHub用户名:"
read -p "GitHub用户名: " USERNAME

if [ -z "$USERNAME" ]; then
    echo "❌ 错误: 用户名不能为空"
    exit 1
fi

echo ""
echo "🔍 验证信息:"
echo "   用户名: $USERNAME"
echo "   仓库名: canton-fair-analysis"
echo "   网站地址: https://$USERNAME.github.io/canton-fair-analysis"
echo ""

# 确认部署
read -p "确认开始部署? (y/N): " CONFIRM
if [[ ! $CONFIRM =~ ^[Yy]$ ]]; then
    echo "❌ 部署已取消"
    exit 0
fi

echo ""
echo "🚀 开始部署..."

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
    echo "✅ 代码推送成功！"
    echo ""
    echo "🌐 下一步操作:"
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
    echo "🔄 如果需要更新网站，只需运行:"
    echo "   git push origin main"
    echo ""
    echo "📖 详细说明请查看: DEPLOYMENT_GUIDE.md"
    
    # 尝试打开GitHub仓库页面
    if command -v open > /dev/null; then
        echo ""
        read -p "是否现在打开GitHub仓库页面? (y/N): " OPEN_GITHUB
        if [[ $OPEN_GITHUB =~ ^[Yy]$ ]]; then
            open "https://github.com/$USERNAME/canton-fair-analysis"
        fi
    fi
    
else
    echo ""
    echo "❌ 推送失败！"
    echo ""
    echo "🔧 可能的解决方案:"
    echo "1. 检查GitHub用户名是否正确: $USERNAME"
    echo "2. 确认仓库已创建: https://github.com/$USERNAME/canton-fair-analysis"
    echo "3. 检查网络连接"
    echo "4. 确认GitHub认证信息"
    echo ""
    echo "📋 手动创建仓库步骤:"
    echo "1. 访问 https://github.com/new"
    echo "2. 仓库名: canton-fair-analysis"
    echo "3. 描述: Canton Fair Exhibitor Analysis - Dynamic Visualization"
    echo "4. 设置为公开仓库"
    echo "5. 不要添加README（我们已经有了）"
    echo "6. 点击 'Create repository'"
    echo ""
    echo "创建完成后，再次运行此脚本"
fi
