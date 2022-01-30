<template>
  <el-form ref="configEditForm" :model="info" :rules="rules" label-width="80px">
    <el-form-item label="参数名称" prop="configName">
      <el-input v-model="info.configName" placeholder="请输入参数名称" />
    </el-form-item>
    <el-form-item label="参数键名" prop="configKey">
      <el-input v-model="info.configKey" placeholder="请输入参数键名" />
    </el-form-item>
    <el-form-item label="参数键值" prop="configValue">
      <el-input v-model="info.configValue" placeholder="请输入参数键值" />
    </el-form-item>
    <el-form-item label="系统内置" prop="configType">
      <el-radio-group v-model="info.configType">
        <el-radio
          v-for="dict in typeOptions"
          :key="dict.dictValue"
          :label="dict.dictValue"
        >{{dict.dictLabel}}</el-radio>
      </el-radio-group>
    </el-form-item>
    <el-form-item label="备注" prop="remark">
      <el-input v-model="info.remark" type="textarea" placeholder="请输入内容" />
    </el-form-item>
  </el-form>
</template>
<script>

  export default {
    name: "ConfigEditForm",
    props: {
      info: {
        type: Object,
        default: null
      },
    },
    data() {
      return {
        // 类型数据字典
        typeOptions: [],
        // 表单校验
        rules: {
          configName: [
            { required: true, message: "参数名称不能为空", trigger: "blur" }
          ],
          configKey: [
            { required: true, message: "参数键名不能为空", trigger: "blur" }
          ],
          configValue: [
            { required: true, message: "参数键值不能为空", trigger: "blur" }
          ]
        }
      };
    },
    created() {},
    methods: {
    }
  };
</script>
