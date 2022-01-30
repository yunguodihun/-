<template>
  <my-detail column="10" border size="small">
    <my-detail-item v-if="detailColumns.deptId" span="2" label="部门ID" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.deptId }}</my-detail-item>
    <my-detail-item v-if="detailColumns.code" span="2" label="编号" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.code }}</my-detail-item>
    <my-detail-item v-if="detailColumns.birthday" span="2" label="生日" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ parseTime(form.birthday, '{y}-{m}-{d}') }}</my-detail-item>
    <my-detail-item v-if="detailColumns.sort" span="2" label="排序" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.sort }}</my-detail-item>
    <my-detail-item v-if="detailColumns.name" span="2" label="姓名" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.name }}</my-detail-item>
    <my-detail-item v-if="detailColumns.position" span="2" label="职位" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.position }}</my-detail-item>
    <my-detail-item v-if="detailColumns.email" span="2" label="邮箱" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.email }}</my-detail-item>
    <my-detail-item v-if="detailColumns.phoneNumber" span="2" label="手机号码" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.phoneNumber }}</my-detail-item>
    <my-detail-item v-if="detailColumns.sex"  span="2" label="用户性别" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ sexFormat(form.sex) }}</my-detail-item>
    <my-detail-item v-if="detailColumns.avatar" span="3" label="头像地址" :label-style="{width:'15%'}" :content-style="{width:'35%'}">
      <UploadImage v-model="form.avatar" readonly="true" />
    </my-detail-item>
    <my-detail-item v-if="detailColumns.password" span="2" label="密码" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.password }}</my-detail-item>
    <my-detail-item v-if="detailColumns.status" span="2" label="在职状态" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ statusFormat(form.status) }}</my-detail-item>
    <my-detail-item v-if="detailColumns.entryStartTime" span="2" label="入职开始时间" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ parseTime(form.entryStartTime, '{y}-{m}-{d}') }}</my-detail-item>
    <my-detail-item v-if="detailColumns.entryEndTime" span="2" label="入职结束时间" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ parseTime(form.entryEndTime, '{y}-{m}-{d}') }}</my-detail-item>
    <my-detail-item v-if="detailColumns.adeptTechnology" span="2" label="擅长技术" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ adeptTechnologyFormat(form.adeptTechnology) }}</my-detail-item>
    <my-detail-item v-if="detailColumns.educationExperience" span="2" label="教育经历" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.educationExperience }}</my-detail-item>
    <my-detail-item v-if="detailColumns.file" span="3" label="附件" :label-style="{width:'15%'}" :content-style="{width:'35%'}">
      <UploadImage v-model="form.file" readonly="true" />
    </my-detail-item>
    <my-detail-item v-if="detailColumns.score" span="2" label="评分" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.score }}</my-detail-item>
    <my-detail-item v-if="detailColumns.remark" span="2" label="备注" :label-style="{width:'15%'}" :content-style="{width:'35%'}">{{ form.remark }}</my-detail-item>
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
    detailColumns: {
      type: Object,
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
      form: {}
    }
  },
  watch: { // 监听value的变化，进行相应的操作即可
    vitaeId: function(a, b) { // a是value的新值，b是旧值
      this.vitaeId = a
      this.loadInfo()
    }
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
