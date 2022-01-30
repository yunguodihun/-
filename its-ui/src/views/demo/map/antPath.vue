<template>
  <div id="map" class="app-container" style="min-height: calc(100vh - 100px);" />
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'
import '@supermap/iclient-leaflet'
// eslint-disable-next-line no-unused-vars
import antPath from 'leaflet-ant-path'
export default {
  name: 'Index',
  data() {
    return {

    }
  },
  mounted() {
    this.initMap()
  },
  methods: {
    // 初始化地图
    initMap() {
      const base = L.supermap.tiledMapLayer('http://10.1.30.121:8080/proxy/api/iserver/services/map-JSGISTGL2020/rest/maps/GL2020')
      const map = L.map('map', {
        crs: L.CRS.EPSG4326,
        center: { lon: 118.8921, lat: 33.1073 },
        attributionControl: false,
        maxZoom: 18,
        zoom: 7,
        zoomControl: false
      })
      map.addLayer(base)

      const coords = [[32.04, 118.78], [33.59, 118.16], [34.59, 119.16]]
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
      path.addTo(map)
    }
  }
}
</script>

<style scoped>

</style>
