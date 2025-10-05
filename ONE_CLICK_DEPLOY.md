# 🚀 一键部署指南

## 📋 部署步骤

### 1. 创建GitHub仓库

**方法1: 通过网页创建**
1. 访问 [https://github.com/new](https://github.com/new)
2. 填写仓库信息：
   - **Repository name**: `canton-fair-analysis`
   - **Description**: `Canton Fair Exhibitor Analysis - Dynamic Visualization`
   - **Visibility**: ✅ Public
   - **不要勾选** "Add a README file"
   - **不要勾选** "Add .gitignore"
   - **不要勾选** "Choose a license"
3. 点击 "Create repository"

**方法2: 通过GitHub CLI创建**
```bash
# 如果安装了GitHub CLI
gh repo create canton-fair-analysis --public --description "Canton Fair Exhibitor Analysis - Dynamic Visualization"
```

### 2. 执行一键部署

```bash
# 运行自动部署脚本
./auto_deploy.sh
```

### 3. 启用GitHub Pages

1. 访问您的仓库: `https://github.com/hollipembletoncrf40/canton-fair-analysis`
2. 点击 "Settings" 标签
3. 在左侧菜单中找到 "Pages"
4. 在 "Source" 部分选择 "GitHub Actions"
5. 保存设置

### 4. 访问您的网站

部署完成后，访问: `https://hollipembletoncrf40.github.io/canton-fair-analysis`

## 🔧 故障排除

### 如果推送失败
1. **检查仓库是否存在**: 访问 `https://github.com/hollipembletoncrf40/canton-fair-analysis`
2. **检查用户名是否正确**: 确认GitHub用户名是 `hollipembletoncrf40`
3. **检查网络连接**: 确保可以访问GitHub
4. **检查认证**: 确保GitHub认证有效

### 如果仓库不存在
请按照上述步骤1创建仓库，然后重新运行部署脚本。

## 📊 项目文件

当前项目包含以下文件：
- `index.html` - 主页面文件
- `README.md` - 项目说明
- `DEPLOYMENT_GUIDE.md` - 详细部署指南
- `QUICK_START.md` - 快速开始指南
- `auto_deploy.sh` - 自动部署脚本
- `.github/workflows/deploy.yml` - GitHub Actions配置

## 🎯 下一步

1. 创建GitHub仓库
2. 运行 `./auto_deploy.sh`
3. 启用GitHub Pages
4. 访问您的网站

## 📞 需要帮助？

如果遇到问题，请查看：
- `DEPLOYMENT_GUIDE.md` - 详细部署指南
- `QUICK_START.md` - 快速开始指南
- GitHub仓库的Actions标签页查看部署状态
