<template>
  <my-detail column="10" border size="small">
    <my-detail-item span="2" label="列名称" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.columnName }}</my-detail-item>
    <my-detail-item span="2" label="列描述" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.columnDescription }}</my-detail-item>
    <my-detail-item span="2" label="列类型" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.columnType }}</my-detail-item>
    <my-detail-item span="2" label="列宽" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.columnWidth }}</my-detail-item>
    <my-detail-item span="2" label="归属表编号" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.tableId }}</my-detail-item>
    <my-detail-item span="2" label="归属表名称" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.tableName }}</my-detail-item>
    <my-detail-item span="2" label="JAVA类型" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.javaType }}</my-detail-item>
    <my-detail-item span="2" label="JAVA字段名" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.javaField }}</my-detail-item>
    <my-detail-item span="2" label="是否主键" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.isPk }}</my-detail-item>
    <my-detail-item span="2" label="是否自增" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.isIncrement }}</my-detail-item>
    <my-detail-item span="2" label="是否必填" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.isRequired }}</my-detail-item>
    <my-detail-item span="2" label="是否为插入字段" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.isInsert }}</my-detail-item>
    <my-detail-item span="2" label="是否编辑字段" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.isEdit }}</my-detail-item>
    <my-detail-item span="2" label="是否列表字段" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.isList }}</my-detail-item>
    <my-detail-item span="2" label="是否查询字段" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.isQuery }}</my-detail-item>
    <my-detail-item span="2" label="查询方式" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.queryType }}</my-detail-item>
    <my-detail-item span="2" label="显示类型" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.htmlType }}</my-detail-item>
    <my-detail-item span="2" label="字典类型" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.dictType }}</my-detail-item>
    <my-detail-item span="2" label="排序" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.sort }}</my-detail-item>
    <my-detail-item span="2" label="备注" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.remark }}</my-detail-item>
  </my-detail>
</template>

<script>
import { MyDetail, MyDetailItem } from '$ui'
import { getColumn } from '@/api/system/column'
import { parseTime } from '@/utils/base.js'

export default {
  name: 'ColumnDetail',
  components: {
    MyDetail,
    MyDetailItem
  },
  props: {
    columnId: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      // 表单参数
      form: {}
    }
  },
  watch: { // 监听value的变化，进行相应的操作即可
    columnId: function(a, b) { // a是value的新值，b是旧值
      this.columnId = a
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
        columnId: null,
        columnName: null,
        columnDescription: null,
        columnType: null,
        columnWidth: null,
        tableId: null,
        tableName: null,
        javaType: null,
        javaField: null,
        isPk: null,
        isIncrement: null,
        isRequired: null,
        isInsert: null,
        isEdit: null,
        isList: null,
        isQuery: null,
        queryType: null,
        htmlType: null,
        dictType: null,
        sort: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        delFlag: null,
        remark: null
      }
      this.resetForm('form')
    },

    /** 加载数据 */
    loadInfo() {
      this.reset()
      getColumn(this.columnId).then(response => {
        this.form = response.data
      })
    }
  }
}
</script>
