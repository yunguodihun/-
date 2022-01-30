<template>
  <div class="app-container">
    <el-form :inline="true" label-width="100px">
      <el-form-item label="TSP">
        <el-input
          v-model="valueTsp"
          clearable
          size="small"
        />
      </el-form-item>
      <el-form-item label="PM2.5">
        <el-input
          v-model="valuePM25"
          clearable
          size="small"
        />
      </el-form-item>
      <el-form-item label="PM10">
        <el-input
          v-model="valuePM10"
          clearable
          size="small"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-plus" size="mini">保存设置</el-button>
      </el-form-item>

    </el-form>
  </div>
</template>

<script>
export default {
  name: 'PollutantReceivingDevice',
  data() {
    return {
      valueTsp: '30.0',
      valuePM25: '30.0',
      valuePM10: '40.0',
      receiveList: [
        {
          name: '生活垃圾接收设施（套）'
        },
        {
          name: '油污水接收设施（套）'
        },
        {
          name: '生活污水接收设施（套）'
        }
      ]
    }
  },
  created() {

  },
  methods: {

  }
}

</script>

<style scoped>

</style>

