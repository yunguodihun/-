<template>
  <el-form ref="genInfoForm" :model="info" :rules="rules" label-width="150px">
    <el-row>
      <el-col :span="12">
        <el-form-item>
          <span slot="label">
            绑定模块
            <el-tooltip content="分配到指定模块下，例如 站点管理" placement="top">
              <i class="el-icon-question"></i>
            </el-tooltip>
          </span>
          <treeselect
            :append-to-body="true"
            v-model="info.parentMenuId"
            :options="menus"
            :normalizer="normalizer"
            :show-count="true"
            placeholder="请选择系统模块"
          />
        </el-form-item>
      </el-col>

      <el-col :span="12">
        <el-form-item prop="requestPath">
          <span slot="label">
            绑定请求路径
            <el-tooltip content="包路径+模块名+业务名" placement="top">
              <i class="el-icon-question"></i>
            </el-tooltip>
          </span>
          <el-input v-model="info.requestPath" />
        </el-form-item>
      </el-col>

    </el-row>

  </el-form>
</template>
<script>
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";

  export default {
    name: "BasicInfoForm",
    components: { Treeselect },
    props: {
      info: {
        type: Object,
        default: null
      },
      menus: {
        type: Array,
        default: []
      },
    },
    data() {
      return {
        rules: {
          tplCategory: [
            { required: true, message: "请选择生成模板", trigger: "blur" }
          ],
          packageName: [
            { required: true, message: "请输入生成包路径", trigger: "blur" }
          ],
          moduleName: [
            { required: true, message: "请输入生成模块名", trigger: "blur" }
          ],
          businessName: [
            { required: true, message: "请输入生成业务名", trigger: "blur" }
          ],
          functionName: [
            { required: true, message: "请输入生成功能名", trigger: "blur" }
          ],
          requestPath: [
            { required: true, message: "请输入请求路径", trigger: "blur" }
          ],
        }
      };
    },
    created() {},
    methods: {
      /** 转换菜单数据结构 */
      normalizer(node) {
        if (node.children && !node.children.length) {
          delete node.children;
        }
        return {
          id: node.menuId,
          label: node.menuName,
          children: node.children
        };
      }
    }
  };
</script>
