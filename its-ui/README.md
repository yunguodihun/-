np## 开发

```bash
# 进入项目目录
cd its-ui

# 安装依赖
npm install

# 建议不要直接使用 cnpm 安装依赖，会有各种诡异的 bug。可以通过如下操作解决 npm 下载速度慢的问题
npm install --registry=https://registry.npm.taobao.org

# 启动服务
npm run dev
```

浏览器访问 http://localhost:1024

## 发布

```bash
# 构建测试环境
npm run build:stage

# 构建生产环境
npm run build:prod
```

:::tip 前端构建报错，需要注意
1、import XLSX from "xlsx-style"可能会报cpexcel.js的错误，要修改源码:

将node_ modules/xlsx-style/dist/cpexcel.js 中的var cpt = require('./cpt' + 'able );修改为var cpt = cptable;


2、To install them, you can run: npm install --save echarts5 leaflet-polylinedecorator leaflet-side-by-side，执行下面的语句

npm install echarts5@npm:echarts@5
npm i leaflet-side-by-side --save
npm install leaflet-polylinedecorator

3、集成张家港超图所需依赖的文件
npm install leaflet --save
npm install @supermap/iclient-leaflet
npm i leaflet.markercluster
npm i jquery -s
npm install esri-leaflet
npm install proj4
npm install proj4leaflet
:::

