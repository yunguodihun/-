<template>
  <div id="map" class="app-container" style="min-height: calc(100vh - 100px);" />
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'
import '@supermap/iclient-leaflet'
// 引入 leaflet.markercluster
import 'leaflet.markercluster/dist/MarkerCluster.css'
import 'leaflet.markercluster/dist/MarkerCluster.Default.css'
import 'leaflet.markercluster'
import antPath from 'leaflet-ant-path'
import $ from 'jquery'
const esri = require('esri-leaflet')
// eslint-disable-next-line no-unused-vars
const proj4 = require('proj4')
// eslint-disable-next-line no-unused-vars
const proj4leaflet = require('proj4leaflet')
let map, tileMapLayer, markerLayer, lineLayer

export default {
  name: 'Index',
  data() {
    return {

    }
  },
  mounted() {
    this.initMap()
    this.addMarker()
    this.addLine()
  },
  methods: {
    // 初始化地图
    initMap() {
      $.ajax({
        url: process.env.VUE_APP_MAP_TOKEN_SERVER_URL,
        jsonp: 'callback',
        dataType: 'jsonp',
        data: {
          request: process.env.VUE_APP_MAP_TOKEN_SERVER_REQUEST,
          username: process.env.VUE_APP_MAP_USER_NAME,
          password: process.env.VUE_APP_MAP_PASSWORD,
          clientid: process.env.VUE_APP_MAP_CLIENTID,
          expiration: process.env.VUE_APP_MAP_EXPIRATION,
          format: 'json'
        }
      }).then(function(data) {
        console.log(JSON.stringify(data))

        // Cookies.set('token', data.token);
        const tileMapUrl = process.env.VUE_APP_MAP_REST_URL + '?token=' + data.token
        const res = [0.7031250000000002,
          0.3515625000000001,
          0.17578125000000006,
          0.08789062500000003,
          0.043945312500000014,
          0.021972656250000007,
          0.010986328125000003,
          0.005493164062500002,
          0.002746582031250001,
          0.0013732910156250004,
          6.866455078125002E-4,
          3.433227539062501E-4,
          1.7166137695312505E-4,
          8.583068847656253E-5,
          4.2915344238281264E-5,
          2.1457672119140632E-5,
          1.0728836059570316E-5,
          5.364418029785158E-6,
          2.682209014892579E-6,
          1.3411045074462895E-6]
        const CRS_4490 = new L.Proj.CRS('EPSG:4490', '+proj=longlat +ellps=GRS80 +no_defs', {
          resolutions: res,
          origin: [-180.0, 90],
          bounds: L.bounds([119.88648578524601, 31.243155151605585], [121.43454417586338, 32.39251390099523])
        })

        this.map = L.map('map', {
          crs: CRS_4490,
          minZoom: 10,
          maxZoom: 18
        }).setView([31.908854, 120.583403], 10)

        const tileMapLayer = esri.tiledMapLayer({
          url: tileMapUrl
        })
        this.map.addLayer(tileMapLayer)
        this.map.addLayer(markerLayer)
        this.map.addLayer(lineLayer)
      })
    },

    // 初始化地图(外网测试使用)
    initMap2() {
      map = L.map('map', {
        minZoom: 3,
        maxZoom: 14,
        center: [31.876479, 120.558969],
        zoom: 12,
        zoomControl: false,
        attributionControl: false,
        crs: L.CRS.EPSG3857
      })
      L.tileLayer(
        'http://webrd01.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=7&x={x}&y={y}&z={z}'
      ).addTo(map)
      markerLayer = L.markerClusterGroup()
      map.addLayer(markerLayer)
      lineLayer = L.markerClusterGroup()
      map.addLayer(lineLayer)
    },
    // 添加点标记
    addMarker() {
      markerLayer = L.markerClusterGroup()

      // 创建图标

      const icon = L.icon({
        iconUrl: require('./img/truck.png'),
        iconSize: [20, 15]
      })
      const data = [
        {
          lng: 120.539134,
          lat: 31.908609,
          name: '测试点位1'
        },
        {
          lng: 120.689187,
          lat: 31.851209,
          name: '测试点位2'
        }
      ]
      const markers = []
      // 遍历
      for (let i = 0; i < data.length; i++) {
        // 点位组(   [[纬度，经度],...]    )
        const point = []
        // 添加经纬度到点位组
        point.push(data[i].lat)
        point.push(data[i].lng)
        console.log(JSON.stringify(point))
        const marker = new L.marker(point, { icon: icon }).bindPopup('南京')
        markers.push(marker)
      }
      const markerLayerGroup = L.layerGroup(markers)
      markerLayer.addLayer(markerLayerGroup)
      // map.addLayer(markerLayer);
      // pointFeature.on("click", function() {
      //   alert(row.name);
      // });
    },

    addLine() {
      lineLayer = L.markerClusterGroup()
      const coords = [[31.948816, 120.53741], [31.774621, 120.512688], [31.77413, 120.747254]]
      // ==================使用antPath插件的写法========================
      const antPath = L.polyline.antPath
      const path = antPath(coords, {
        'paused': false, // 暂停  初始化状态
        'reverse': false, // 方向反转
        'delay': 3000, // 延迟，数值越大效果越缓慢
        'dashArray': [10, 20], // 间隔样式
        'weight': 5, // 线宽
        'opacity': 0.5, // 透明度
        'color': '#0000FF', // 颜色
        'pulseColor': '#FFFFFF' // 块颜色
      })
      // path.addTo(map);
      path.addTo(lineLayer)
      // =====================================================================
      // ==================使用leaflet的写法========================
      // lineLayer = L.markerClusterGroup();
      // const coordinates = [[31.948816, 120.53741], [31.774621, 120.512688], [31.77413, 120.747254]];
      // var polyRoadline = L.polyline(coordinates, {
      //   opacity: 1,
      //   color: '#FF0000'
      // });
      // polyRoadline.addTo(lineLayer);
      // =====================================================================
    }
  }
}

</script>

<style scoped>

</style>
