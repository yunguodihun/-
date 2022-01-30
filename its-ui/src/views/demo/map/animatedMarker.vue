<template>
  <div id="map" className="app-container" style="min-height: calc(100vh - 100px);">
    <div style="position: absolute;z-index:1999;top: 0px; left: 53em;">
      <el-row>
        <el-button type="success" plain @click="startClick">开始</el-button>
        <el-button type="warning" plain @click="pauseClick">暂停</el-button>
        <el-button type="danger" plain @click="stopClick">停止</el-button>
      </el-row>
    </div>
  </div>
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'
import '@supermap/iclient-leaflet'
import { animatedMarker } from '@/assets/map/js/AnimatedMarker'
import carPng from '@/assets/map/image/car.png'
import 'leaflet-polylinedecorator'
var line, realRouteLine
export default {
  name: 'Index',
  data() {
    return {
      latlngs: [
        [32.898457, 118.391844],
        [32.898595, 118.377947],
        [32.898341, 118.368001],
        [32.898063, 118.357144],
        [32.899095, 118.351934],
        [32.905871, 118.350670],
        [32.922329, 118.349800],
        [32.931017, 118.349671],
        [32.939104, 118.349225],
        [32.942233, 118.349910],
        [32.947263, 118.366892],
        [32.947568, 118.387537],
        [32.947764, 118.401988],
        [32.947929, 118.410824],
        [32.947558, 118.426740],
        [32.939700, 118.427338],
        [32.932404, 118.427919],
        [32.923109, 118.428377],
        [32.907094, 118.429583],
        [32.906858, 118.414040],
        [32.906622, 118.405321],
        [32.906324, 118.394954],
        [32.906308, 118.391264],
        [32.916611, 118.390748]
      ],
      newLatlngs: []
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
        center: { lon: 118.391844, lat: 32.898457 },
        attributionControl: false,
        maxZoom: 18,
        zoom: 12,
        zoomControl: false
      })
      map.addLayer(base)

      var routeLine = L.polyline(this.latlngs, {
        weight: 8
      }).addTo(map)

      // 实时轨迹线
      realRouteLine = L.polyline([], {
        weight: 8,
        color: '#FF9900'
      })
      realRouteLine.addTo(map)

      // 轨迹箭头
      var decorator = L.polylineDecorator(routeLine, {
        patterns: [{
          repeat: 50,
          symbol: L.Symbol.arrowHead({
            pixelSize: 5,
            headAngle: 75,
            polygon: false,
            pathOptions: {
              stroke: true,
              weight: 2,
              color: '#FFFFFF'
            }
          })
        }]
      })
      decorator.addTo(map)

      var carIcon = L.icon({
        iconSize: [37, 26],
        iconAnchor: [19, 13],
        iconUrl: carPng
      })

      line = animatedMarker(routeLine.getLatLngs(), {
        icon: carIcon,
        isRotate: true,
        playCall: this.updateRealLine
      }).addTo(map)
    },
    updateRealLine(latlng) {
      const arr = this.newLatlngs
      arr.push(latlng)
      realRouteLine.setLatLngs(arr)
    },
    startClick() {
      line.start()
    },
    pauseClick() {
      line.pause()
    },
    stopClick() {
      this.newLatlngs = []
      line.stop()
    }
  }
}
</script>

<style scoped>

</style>
