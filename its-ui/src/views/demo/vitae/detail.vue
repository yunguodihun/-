<template>
  <my-detail :column="2" border size="small">
    <my-detail-item v-for="(col,index) in dynamicTableDataDetailColumns"
                    :key="index" :label="col.dataName" :label-style="{width:'15%'}"
                    :content-style="{width:'35%'}" :span="col.span">
      <span v-if="col.dataItem === 'createTime'">
        {{ parseTime( form[col.dataItem]) }}
      </span>
      <span v-else-if="col.dataItem === 'adeptTechnology'">
        {{ adeptTechnologyFormat(form[col.dataItem]) }}
      </span>
      <span v-else-if="col.dataItem === 'status'">
        {{ statusFormat(form[col.dataItem]) }}
      </span>
      <span v-else-if="col.dataItem === 'sex'">
        {{ sexFormat(form[col.dataItem]) }}
      </span>
      <span v-else-if="col.dataItem === 'avatar'">
        <UploadImage v-model="form.avatar" :readonly="true" />
      </span>
      <span v-else-if="col.dataItem === 'file'">
        <UploadImage v-model="form.file" :readonly="true" />
      </span>
      <span v-else>
        {{ form[col.dataItem] }}
      </span>
    </my-detail-item>
  </my-detail>
</template>

<script>
import { MyDetail, MyDetailItem } from '$ui'
import { getVitae } from '@/api/demo/vitae'
import UploadImage from '@/components/ImageUpload'

export default {
  name: 'VitaeDetail',
  components: {
    MyDetail,
    MyDetailItem,
    UploadImage
  },
  props: {
    vitaeId: {
      type: Number,
      required: true
    },
    dynamicTableDataDetailColumns: {
      type: Array,
      default: []
    },
    timeStamp: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      // 用户性别字典
      sexOptions: [],
      // 在职状态字典
      statusOptions: [],
      // 擅长技术字典
      adeptTechnologyOptions: [],
      // 表单参数
      form: {},
    }
  },
  watch: {
    //监听value的变化，进行相应的操作即可
    timeStamp: function (a, b) {
      this.loadInfo();
    },
  },
  created() {
    this.loadInfo()
    this.getDicts('sys_user_sex').then(response => {
      this.sexOptions = response.data
    })
    this.getDicts('on_job_status').then(response => {
      this.statusOptions = response.data
    })
    this.getDicts('software_technology').then(response => {
      this.adeptTechnologyOptions = response.data
    })
  },
  methods: {
    // 用户性别字典翻译
    sexFormat(value) {
      return this.selectDictLabel(this.sexOptions, value)
    },
    // 在职状态字典翻译
    statusFormat(value) {
      return this.selectDictLabel(this.statusOptions, value)
    },
    // 擅长技术字典翻译
    adeptTechnologyFormat(value) {
      return this.selectDictLabels(this.adeptTechnologyOptions, value)
    },
    // 表单重置
    reset() {
      this.form = {
        vitaeId: null,
        deptId: null,
        code: null,
        birthday: null,
        sort: null,
        name: null,
        position: null,
        email: null,
        phoneNumber: null,
        sex: '0',
        avatar: null,
        password: null,
        status: '0',
        entryStartTime: null,
        entryEndTime: null,
        adeptTechnology: [],
        educationExperience: null,
        file: null,
        score: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      }
      this.resetForm('form')
    },

    /** 加载数据 */
    loadInfo() {
      this.reset()
      getVitae(this.vitaeId).then(response => {
        this.form = response.data
      })
    }
  }
}
</script>
