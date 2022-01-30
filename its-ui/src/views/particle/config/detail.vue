<template>
  <my-detail :column="2" border size="small">
    <my-detail-item v-for="(col,index) in dynamicTableDataDetailColumns" :key="index" :label="col.dataName" :label-style="{width:'15%'}" :content-style="{width:'35%'}">
      <span v-if="col.dataItem === 'createTime'">
        {{ parseTime( form[col.dataItem]) }}
      </span>
      <span v-else>
        {{ form[col.dataItem] }}
      </span>
    </my-detail-item>
  </my-detail>
</template>

<script>
import { MyDetail, MyDetailItem } from '$ui'
import { getConfig } from '@/api/particle/config'
import { parseTime } from '@/utils/base.js'

export default {
  name: 'ConfigDetail',
  components: {
    MyDetail,
    MyDetailItem
  },
  props: {
    configId: {
      type: Number,
      required: true
    },
    dynamicTableDataDetailColumns: {
      type: Array,
      default: []
    }
  },
  data() {
    return {
      // 表单参数
      form: {}
    }
  },
  watch: { // 监听value的变化，进行相应的操作即可
    configId: function(a, b) { // a是value的新值，b是旧值
      this.configId = a
      this.loadInfo()
    }
  },
  created() {
    this.loadInfo()
  },
  methods: {
    // 表单重置
    reset() {
      this.form = {
        configId: null,
        configName: null,
        requestPath: null,
        params: null,
        status: '0',
        tableId: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        delFlag: null
      }
      this.resetForm('form')
    },

    /** 加载数据 */
    loadInfo() {
      this.reset()
      getConfig(this.configId).then(response => {
        this.form = response.data
      })
    }
  }
}
</script>
