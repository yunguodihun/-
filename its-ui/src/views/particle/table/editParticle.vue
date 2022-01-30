<template>
  <el-card>
    <el-tabs v-model="activeName">
      <el-tab-pane label="基本信息" name="basic">
        <basic-info-form ref="basicInfo" :info="info" />
      </el-tab-pane>
      <el-tab-pane label="字段信息" name="cloum">
        <el-table ref="dragTable" :data="cloumns" row-key="columnId" :max-height="tableHeight">
          <el-table-column label="排序" min-width="10%">
            <template slot-scope="scope">
              <el-input v-model="scope.row.sort" />
            </template>
          </el-table-column>
          <el-table-column label="列名" min-width="10%">
            <template slot-scope="scope">
              <el-input v-model="scope.row.columnComment"/>
            </template>
          </el-table-column>

          <el-table-column label="列表项" min-width="5%">
            <template slot-scope="scope">
              <el-checkbox v-model="scope.row.isList" true-label="1" />
            </template>
          </el-table-column>
          <el-table-column label="查询项" min-width="5%">
            <template slot-scope="scope">
              <el-checkbox v-model="scope.row.isQuery" true-label="1" />
            </template>
          </el-table-column>
          <el-table-column label="详情项" min-width="5%">
            <template slot-scope="scope">
              <el-checkbox v-model="scope.row.isDetail" true-label="1" />
            </template>
          </el-table-column>
          <el-table-column label="跨距占比" min-width="5%">
            <template slot-scope="scope">
              <el-select v-model="scope.row.span" placeholder="跨距行占比">
                <el-option
                  v-for="dict in spanRatioOptions"
                  :key="dict.dictValue"
                  :label="dict.dictLabel"
                  :value="dict.dictValue"
                />
              </el-select>
            </template>
          </el-table-column>

          <el-form-item label="权限范围">
            <el-select v-model="info.span" >
              <el-option
                v-for="item in spanRatioOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              />
            </el-select>
          </el-form-item>
        </el-table>
      </el-tab-pane>
      <el-tab-pane label="生成信息" name="genInfo">
        <gen-info-form ref="genInfo" :info="info" :menus="menus" />
      </el-tab-pane>
    </el-tabs>
    <el-form label-width="100px">
      <el-form-item style="text-align: center;margin-left:-100px;margin-top:10px;">
        <el-button type="primary" @click="submitForm()">提交</el-button>
        <el-button @click="close()">返回</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>
<script>
  import { getParticleTable, getParticleTableByTableIdAndRoleId, updateParticleTable } from '@/api/particle/table'
  import { optionselect as getDictOptionselect } from '@/api/system/dict/type'
  import { listMenu as getMenuTreeselect } from '@/api/system/menu'
  import basicInfoForm from './basicInfoForm'
  import genInfoForm from './genInfoForm'
  import Sortable from 'sortablejs'
  export default {
    name: 'TableEdit',
    components: {
      basicInfoForm,
      genInfoForm
    },
    data() {
      return {
        // 选中选项卡的 name
        activeName: 'cloum',
        // 表格的高度
        tableHeight: document.documentElement.scrollHeight - 245 + 'px',
        // 表列信息
        cloumns: [],
        // 字典信息
        dictOptions: [],
        // 菜单信息
        menus: [],
        // 表详细信息
        info: {},
        // 跨距占比数据字典
        spanRatioOptions: [],
      }
    },
    created() {
      const tableId = this.$route.params && this.$route.params.tableId
      const roleId = this.$route.params && this.$route.params.roleId
      if (tableId) {
        // 获取表详细信息
        getParticleTableByTableIdAndRoleId(tableId, roleId).then(res => {
          this.cloumns = res.data.rows
          this.info = res.data.info
        })
        /** 查询字典下拉列表 */
        getDictOptionselect().then(response => {
          this.dictOptions = response.data
        })
        /** 查询菜单下拉列表 */
        getMenuTreeselect().then(response => {
          this.menus = this.handleTree(response.data, 'menuId')
        })
      }
      this.getDicts("span_ratio").then(response => {
        this.spanRatioOptions = response.data;
      });
    },
    mounted() {
      const el = this.$refs.dragTable.$el.querySelectorAll('.el-table__body-wrapper > table > tbody')[0]
      const sortable = Sortable.create(el, {
        handle: '.allowDrag',
        onEnd: evt => {
          const targetRow = this.cloumns.splice(evt.oldIndex, 1)[0]
          this.cloumns.splice(evt.newIndex, 0, targetRow)
          for (const index in this.cloumns) {
            this.cloumns[index].sort = parseInt(index) + 1
          }
        }
      })
    },
    methods: {
      /** 提交按钮 */
      submitForm() {
        const basicForm = this.$refs.basicInfo.$refs.basicInfoForm
        const genForm = this.$refs.genInfo.$refs.genInfoForm
        Promise.all([basicForm, genForm].map(this.getFormPromise)).then(res => {
          const validateResult = res.every(item => !!item)
          if (validateResult) {
            const particleTable = Object.assign({}, basicForm.model, genForm.model)
            particleTable.columns = this.cloumns
            particleTable.particleStatus = '1'
            particleTable.params = {
              treeCode: particleTable.treeCode,
              treeName: particleTable.treeName,
              treeParentCode: particleTable.treeParentCode,
              parentMenuId: particleTable.parentMenuId
            }
            updateParticleTable(particleTable).then(res => {
              this.msgSuccess(res.msg)
              if (res.code === 200) {
                this.close()
              }
            })
          } else {
            this.msgError('表单校验未通过，请重新检查提交内容')
          }
        })
      },
      getFormPromise(form) {
        return new Promise(resolve => {
          form.validate(res => {
            resolve(res)
          })
        })
      },
      /** 关闭按钮 */
      close() {
        this.$store.dispatch('tagsView/delView', this.$route)
        this.$router.push({ path: '/warehouse/particle', query: { t: Date.now() }})
      }
    }
  }
</script>
