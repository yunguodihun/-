<template>
  <my-detail :column="2" border size="small">
    <my-detail-item v-for="(col,index) in dynamicTableDataDetailColumns" :key="index" :label="col.dataName" :label-style="{width:'15%'}" :content-style="{width:'35%'}">
      <span v-if="col.dataItem === 'createTime'">
        {{ parseTime( form[col.dataItem]) }}
      </span>
      <span v-if="col.dataItem === 'type'">
        {{ typeFormat(form[col.dataItemF]) }}
      </span>
      <span v-else>
        {{ form[col.dataItem] }}
      </span>
    </my-detail-item>
  </my-detail>
</template>

<script>
import { MyDetail, MyDetailItem } from '$ui'
import { getArea } from '@/api/system/area'

export default {
  name: 'AreaDetail',
  components: {
    MyDetail,
    MyDetailItem
  },
  props: {
    id: {
      type: String,
      required: true
    },
    dynamicTableDataDetailColumns: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      // 类型字典
      typeOptions: [],
      // 表单参数
      form: {}
    }
  },
  watch: { // 监听value的变化，进行相应的操作即可
    id: function(a, b) { // a是value的新值，b是旧值
      this.id = a
      this.loadInfo()
    }
  },
  created() {
    this.loadInfo()
    this.getDicts('site_point_type').then(response => {
      this.typeOptions = response.data
    })
  },
  methods: {
    // 类型字典翻译
    typeFormat(value) {
      return this.selectDictLabel(this.typeOptions, value)
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        parentId: null,
        parentIds: null,
        name: null,
        sort: null,
        parentCode: null,
        code: null,
        type: null,
        createBy: null,
        createDate: null,
        updateBy: null,
        updateDate: null,
        remarks: null,
        delFlag: null
      }
      this.resetForm('form')
    },

    /** 加载数据 */
    loadInfo() {
      this.reset()
      getArea(this.id).then(response => {
        this.form = response.data
      })
    }
  }
}
</script>
