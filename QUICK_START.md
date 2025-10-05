# 🚀 快速开始 - GitHub Pages 部署

## 一键部署

### 方法1: 使用部署脚本（推荐）

```bash
# 1. 在GitHub上创建仓库: canton-fair-analysis
# 2. 运行部署脚本
./deploy.sh your-github-username

# 例如:
./deploy.sh john-doe
```

### 方法2: 手动部署

```bash
# 1. 创建GitHub仓库: canton-fair-analysis
# 2. 添加远程仓库
git remote add origin https://github.com/your-username/canton-fair-analysis.git

# 3. 推送代码
git push -u origin main

# 4. 在GitHub仓库设置中启用Pages
```

## 🌐 访问网站

部署完成后，访问: `https://your-username.github.io/canton-fair-analysis`

## 📋 检查清单

- [ ] GitHub仓库已创建
- [ ] 代码已推送到GitHub
- [ ] GitHub Pages已启用
- [ ] 网站可以正常访问

## 🔄 更新网站

```bash
# 修改代码后
git add .
git commit -m "Update: 描述更改"
git push origin main
```

## 🆘 需要帮助？

查看详细说明: [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)
