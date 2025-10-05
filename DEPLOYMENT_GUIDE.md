# GitHub Pages 部署指南

## 🚀 快速部署步骤

### 1. 创建GitHub仓库

1. 登录 [GitHub](https://github.com)
2. 点击右上角的 "+" 号，选择 "New repository"
3. 填写仓库信息：
   - **Repository name**: `canton-fair-analysis`
   - **Description**: `Canton Fair Exhibitor Analysis - Dynamic Visualization`
   - **Visibility**: Public (GitHub Pages免费版需要公开仓库)
   - **不要**勾选 "Add a README file"（我们已经有了）

### 2. 推送代码到GitHub

```bash
# 添加远程仓库（替换your-username为你的GitHub用户名）
git remote add origin https://github.com/your-username/canton-fair-analysis.git

# 推送代码到GitHub
git push -u origin main
```

### 3. 启用GitHub Pages

1. 进入你的GitHub仓库页面
2. 点击 "Settings" 标签
3. 在左侧菜单中找到 "Pages"
4. 在 "Source" 部分选择 "GitHub Actions"
5. 保存设置

### 4. 自动部署

GitHub Actions会自动部署你的网站。部署完成后，你的网站将在以下地址可用：

```
https://your-username.github.io/canton-fair-analysis
```

## 🔧 手动部署（备选方案）

如果GitHub Actions不工作，可以使用传统的GitHub Pages部署：

### 1. 修改GitHub Pages设置

1. 进入仓库的 "Settings" > "Pages"
2. 在 "Source" 部分选择 "Deploy from a branch"
3. 选择 "main" 分支和 "/ (root)" 文件夹
4. 点击 "Save"

### 2. 等待部署

GitHub会自动部署你的网站，通常需要几分钟时间。

## 📁 项目文件说明

```
canton-fair-analysis/
├── index.html              # 主页面文件（重命名的dynamic_charts.html）
├── README.md               # 项目说明文档
└── .github/
    └── workflows/
        └── deploy.yml      # GitHub Actions部署配置
```

## 🌐 访问你的网站

部署成功后，你可以通过以下方式访问：

1. **GitHub Pages URL**: `https://your-username.github.io/canton-fair-analysis`
2. **自定义域名**: 可以在GitHub Pages设置中添加自定义域名

## 🔄 更新网站

每次你推送代码到main分支时，GitHub Actions会自动重新部署网站：

```bash
# 修改代码后
git add .
git commit -m "Update: 描述你的更改"
git push origin main
```

## 🛠️ 故障排除

### 常见问题

1. **网站无法访问**
   - 检查GitHub Pages设置是否正确
   - 确认仓库是公开的
   - 等待几分钟让部署完成

2. **GitHub Actions失败**
   - 检查 `.github/workflows/deploy.yml` 文件是否正确
   - 查看Actions标签页的错误信息

3. **页面显示空白**
   - 检查 `index.html` 文件是否存在
   - 确认文件路径正确

### 调试步骤

1. 检查仓库的 "Actions" 标签页查看部署状态
2. 检查 "Settings" > "Pages" 确认配置正确
3. 查看浏览器控制台是否有JavaScript错误

## 📊 网站功能

部署成功后，你的网站将包含：

- **交互式标签页**: 概览、行业分析、地区分析、潜力分析、热力图
- **动态图表**: 支持多种图表类型切换
- **响应式设计**: 适配桌面和移动设备
- **动画效果**: 平滑的过渡和加载动画

## 🎯 下一步

1. **自定义域名**: 在GitHub Pages设置中添加你的域名
2. **SEO优化**: 添加meta标签和结构化数据
3. **性能优化**: 压缩图片和代码
4. **分析工具**: 添加Google Analytics等分析工具

## 📞 获取帮助

如果遇到问题，可以：

1. 查看 [GitHub Pages文档](https://docs.github.com/en/pages)
2. 在GitHub仓库中创建Issue
3. 查看GitHub Actions的日志信息

---

**注意**: 请将上述所有 `your-username` 替换为你的实际GitHub用户名。
