<template>
  <div id="map" class="app-container" style="min-height: calc(100vh - 100px);" />
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'
import '@supermap/iclient-leaflet'
import markerPng from '@/assets/map/image/markerbig_select.png'
import * as echarts from 'echarts5'

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

      // 自定义图标
      const icon = L.icon({
        iconUrl: markerPng,
        iconSize: [30, 30]
      })

      const NJ = L.marker([32.04, 118.78], { icon: icon }).bindPopup(this.getDom('南京一周流量'), { maxWidth: 700 })

      const LYG = L.marker([34.59, 119.16], { icon: icon }).bindPopup(this.getDom('连云港一周流量'), { maxWidth: 700 })
      const cities = L.layerGroup([NJ, LYG])
      map.addLayer(cities)
    },
    // 定义图表属性
    getDom(title) {
      var option = {
        title: {
          subtext: title
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          // data:["最高气温"]
          data: ['最高流量', '最低流量']
        },
        toolbox: {
          show: true,
          feature: {
            dataZoom: {
              yAxisIndex: 'none'
            },
            magicType: { type: ['line', 'bar'] },
            restore: {},
            saveAsImage: {}
          }
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日']
        },
        yAxis: {
          type: 'value',
          axisLabel: {
            formatter: '{value}'
          }
        },
        series: [
          {
            name: '最大流量',
            type: 'line',
            data: [11, 11, 15, 13, 12, 13, 10],
            markPoint: {
              data: [
                { type: 'max', name: '最大值' },
                { type: 'min', name: '最低值' }
              ]
            },
            markLine: {
              data: [
                { type: 'average', name: '平均值' },
                [{
                  symbol: 'none',
                  x: '90%',
                  yAxis: 'max'
                }, {
                  symbol: 'circle',
                  label: {
                    normal: {
                      position: 'start',
                      formatter: '最高'
                    }
                  },
                  type: 'max',
                  name: '最大值'
                }]
              ]
            }
          },
          {
            name: '最小流量',
            type: 'line',
            data: [1, 2, 2, 5, 3, 2, 0],
            markPoint: {
              data: [
                { type: 'max', name: 'max' },
                { type: 'min', name: 'min' }
              ]
            },
            markLine: {
              data: [
                { type: 'average', name: 'average' },
                [{
                  symbol: 'none',
                  x: '90%',
                  yAxis: 'min'
                }, {
                  symbol: 'circle',
                  label: {
                    normal: {
                      position: 'start',
                      formatter: '最低'
                    }
                  },
                  type: 'min',
                  name: 'min'
                }]
              ]
            }
          }
        ]
      }
      // 定义容器
      var div = L.DomUtil.create('div')
      var chart = echarts.init(div, '', {
        width: 600,
        height: 400
      })
      chart.setOption(option)
      return chart.getDom()
    }
  }
}
</script>

<style scoped>

</style>
