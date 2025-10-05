# Canton Fair Exhibitor Analysis - Dynamic Visualization

## 📊 项目简介

这是一个基于JavaScript的动态数据可视化应用，用于分析广交会参展商的行业分布和地区分布规律。项目提供了丰富的交互功能和美观的可视化效果。

## 🚀 在线演示

**GitHub Pages**: [https://your-username.github.io/canton-fair-analysis](https://your-username.github.io/canton-fair-analysis)

## 🎨 功能特性

### 交互式标签页
- **概览**: 数据总览和核心指标
- **行业分析**: 行业分布可视化，支持柱状图、饼图、环形图切换
- **地区分析**: 地区分布可视化，支持柱状图、饼图、折线图切换
- **潜力分析**: 气泡图展示行业和城市潜力评分
- **热力图**: 行业-地区交叉分布热力图

### 动态图表类型
- **柱状图**: 展示数量对比
- **饼图**: 展示占比分布
- **环形图**: 现代化饼图样式
- **折线图**: 展示趋势变化
- **气泡图**: 多维度数据展示
- **热力图**: 交叉分析可视化

### 动画效果
- 页面切换淡入淡出动画
- 图表加载渐进式动画
- 悬停交互反馈效果
- 数据更新平滑过渡

## 🛠️ 技术栈

- **HTML5**: 页面结构
- **CSS3**: 样式设计和动画
- **JavaScript**: 交互逻辑
- **D3.js**: 数据可视化
- **Chart.js**: 图表库
- **响应式设计**: 适配不同设备

## 📊 数据概览

- **总参展商数量**: 31,990家
- **有效数据量**: 15,085家
- **涉及行业数量**: 12,231个
- **涉及地区数量**: 31个

## 🎯 主要发现

### 行业分布特点
- 行业分布高度分散，前10大行业仅占3.2%
- 制造业占主导地位（通用机械、五金制品、化工产品等）
- 消费品行业丰富（礼品、家居用品、服装等）

### 地区分布特点
- 东部沿海地区集中，前5大地区占比68.3%
- 浙江省最多（19.85%），广东省次之（18.11%）
- 长三角地区优势明显（浙江+江苏+上海=35.7%）

## 📱 使用方法

### 直接访问
在浏览器中打开 `index.html` 文件即可使用。

### 本地服务器
```bash
# 使用Python启动本地服务器
python -m http.server 8000

# 或使用Node.js
npx http-server

# 然后访问 http://localhost:8000
```

## 🔧 自定义配置

### 数据更新
修改JavaScript中的`data`对象来更新数据：

```javascript
const data = {
    industries: [
        { name: "行业名称", count: 数量, percentage: 百分比 },
        // ... 更多数据
    ],
    regions: [
        { name: "地区名称", count: 数量, percentage: 百分比 },
        // ... 更多数据
    ],
    // ... 其他数据
};
```

### 颜色主题
```javascript
// 修改配色方案
const colors = {
    primary: '#2E86AB',
    secondary: '#A23B72',
    accent: '#F18F01',
    danger: '#C73E1D'
};
```

## 📈 项目结构

```
canton-fair-analysis/
├── index.html          # 主页面文件
├── README.md           # 项目说明文档
└── .github/
    └── workflows/
        └── deploy.yml  # GitHub Pages部署配置
```

## 🌐 浏览器兼容性

- Chrome 80+
- Firefox 75+
- Safari 13+
- Edge 80+

## 📄 许可证

MIT License

## 🤝 贡献

欢迎提交Issue和Pull Request来改进这个项目。

## 📞 联系方式

如有问题或建议，请通过GitHub Issues联系。

---

**数据来源**: Canton Fair 136th Session Exhibitor Database  
**生成时间**: 2024年  
**技术栈**: HTML5 + CSS3 + JavaScript + D3.js + Chart.js
