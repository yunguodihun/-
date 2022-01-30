<template>
  <div id="map" class="app-container" style="min-height: calc(100vh - 100px);" />
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'
import '@supermap/iclient-leaflet'
import 'leaflet-side-by-side'

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
      // const gonglu = L.supermap.tiledMapLayer('http://10.1.30.121:8080/proxy/api/iserver/services/map-JSGISTGL2020/rest/maps/GL2020')
      const map = L.map('map', {
        crs: L.CRS.EPSG4326,
        center: { lon: 118.8921, lat: 33.1073 },
        attributionControl: false,
        maxZoom: 18,
        zoom: 7,
        zoomControl: false
      })
      L.control.zoom().addTo(map)// 缩放
      L.control.scale().addTo(map)// 比例尺

      const gongluLayer = L.supermap.tiledMapLayer('http://10.1.30.121:8080/proxy/api/iserver/services/map-JSGISTGL2020/rest/maps/GL2020', { noWrap: true }).addTo(map)
      const luluLayer = L.supermap.tiledMapLayer('http://10.1.30.121:8080/proxy/api/iserver/services/map-JSGISTLL2020/rest/maps/LL2020', { noWrap: true }).addTo(map)
      L.control.sideBySide(gongluLayer, luluLayer).addTo(map)// 卷帘控件-需注释掉map.addLayer()

      // map.addLayer(gonglu)
    }
  }
}
</script>

<style scoped>

</style>
