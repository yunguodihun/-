<template>
  <div id="map" class="app-container" style="min-height: calc(100vh - 100px);" />
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'
import '@supermap/iclient-leaflet'
import '@ansur/leaflet-pulse-icon/src/L.Icon.Pulse'
import '@ansur/leaflet-pulse-icon/src/L.Icon.Pulse.css'
import markerPng from '@/assets/map/image/markerbig_select.png'

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
      // 自定义图标
      const icon = L.icon({
        iconUrl: markerPng,
        iconSize: [30, 30]
      })
      const NJ = L.marker([32.04, 118.78], { icon: icon }).bindPopup('南京')
      const LYG = L.marker([34.59, 119.16], { icon: icon }).bindPopup('连云港')
      const cities = L.layerGroup([NJ, LYG])
      const gongLu = L.supermap.tiledMapLayer('http://10.1.30.121:8080/proxy/api/iserver/services/map-JSGISTGL2020/rest/maps/GL2020', { noWrap: true })
      const luLu = L.supermap.tiledMapLayer('http://10.1.30.121:8080/proxy/api/iserver/services/map-JSGISTLL2020/rest/maps/LL2020', { noWrap: true })
      const map = L.map('map', {
        crs: L.CRS.EPSG4326,
        center: { lon: 118.8921, lat: 33.1073 },
        attributionControl: false,
        maxZoom: 18,
        zoom: 7,
        zoomControl: false,
        layers: [gongLu, cities]
      })
      var baseMaps = {
        'gongLu': gongLu,
        'luLu': luLu
      }
      var overlayMaps = {
        'Cities': cities
      }
      L.control.layers(baseMaps, overlayMaps).addTo(map)
    }
  }
}
</script>

<style scoped>

</style>
