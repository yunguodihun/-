<template>
  <div class="app-container">
    <el-form v-show="showSearch" ref="queryForm" :model="queryParams" :inline="true" label-width="68px">
      <el-form-item label="表名称" prop="tableName">
        <el-input
          v-model="queryParams.tableName"
          placeholder="请输入表名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="表描述" prop="tableComment">
        <el-input
          v-model="queryParams.tableComment"
          placeholder="请输入表描述"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间">
        <el-date-picker
          v-model="dateRange"
          size="small"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['tool:gen:import']"
          type="info"
          icon="el-icon-upload"
          size="mini"
          @click="openImportTable"
        >导入</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['particle:table:edit']"
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['particle:table:remove']"
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['particle:table:export']"
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
        >导出</el-button>
      </el-col>
      <right-toolbar :show-search.sync="showSearch" @queryTable="getList" />
    </el-row>

    <el-table v-loading="loading" :data="tableList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" type="index" width="50" align="center">
        <template slot-scope="scope">
          <span>{{ (queryParams.pageNum - 1) * queryParams.pageSize + scope.$index + 1 }}</span>
        </template>
      </el-table-column>
      <el-table-column :key="2" label="表名称" align="center" prop="tableName" />
      <el-table-column :key="3" label="表描述" align="center" prop="tableComment" />
<!--      <el-table-column :key="4" label="实体类名称" align="center" prop="className" />-->
      <el-table-column label="授权角色" align="center" prop="roleName">
        <template slot-scope="scope">
          <el-tag>{{ scope.row.roleName }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="220">
        <template slot-scope="scope">
          <el-button
            v-hasPermi="['particle:table:edit']"
            type="text"
            size="small"
            icon="el-icon-edit"
            @click="handleEditParticle(scope.row)"
          >数据项注册</el-button>
          <el-button
            v-hasPermi="['particle:table:remove']"
            size="small"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
    <!-- 详情对话框 -->
    <el-dialog :title="title" :visible.sync="detailOpen" width="80%" append-to-body>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelDetail">关闭</el-button>
      </div>
    </el-dialog>
    <!-- 添加或修改数据清单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="80%" :before-close="handleClose" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" size="medium ">
        <el-row>
          <el-col :span="12">
            <el-form-item label="表名称" prop="tableName">
              <el-input v-model="form.tableName" placeholder="请输入表名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="表描述" prop="tableComment">
              <el-input v-model="form.tableComment" type="textarea" placeholder="请输入内容" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="角色ID" prop="roleId">
              <el-input v-model="form.roleId" placeholder="请输入角色ID" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="实体类名称" prop="className">
              <el-input v-model="form.className" placeholder="请输入实体类名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="使用的模板" prop="tplCategory">
              <el-input v-model="form.tplCategory" placeholder="请输入使用的模板" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="生成包路径" prop="packageName">
              <el-input v-model="form.packageName" placeholder="请输入生成包路径" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="生成模块名" prop="moduleName">
              <el-input v-model="form.moduleName" placeholder="请输入生成模块名" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="生成业务名" prop="businessName">
              <el-input v-model="form.businessName" placeholder="请输入生成业务名" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="生成功能名" prop="functionName">
              <el-input v-model="form.functionName" placeholder="请输入生成功能名" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="生成功能作者" prop="functionAuthor">
              <el-input v-model="form.functionAuthor" placeholder="请输入生成功能作者" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="生成代码方式" prop="genType">
              <el-select v-model="form.genType" placeholder="请选择生成代码方式" style="width: 100%">
                <el-option label="请选择字典生成" value="" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="生成路径" prop="genPath">
              <el-input v-model="form.genPath" placeholder="请输入生成路径" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="其它生成选项" prop="options">
              <el-input v-model="form.options" type="textarea" placeholder="请输入内容" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="颗粒注册状态">
              <el-radio-group v-model="form.particleStatus">
                <el-radio label="1">请选择字典生成</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="请求路径" prop="requestPath">
              <el-input v-model="form.requestPath" type="textarea" placeholder="请输入内容" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <import-table ref="import" :role-id="roleId" @ok="handleQuery" />
  </div>
</template>

<script>
import { listTable, getTable, delTable, addTable, updateTable, exportTable } from '@/api/particle/table'
import importTable from './importTable'
export default {
  name: 'Table',
  components: {
    importTable
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 数据清单表格数据
      tableList: [],
      // 日期范围
      dateRange: '',
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 是否详情显示弹出层
      detailOpen: false,
      // 点击详情传参
      tableId: null,
      // 角色ID,
      roleId: null,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        tableName: null,
        tableComment: null,
        roleId: null,
        className: null,
        tplCategory: null,
        packageName: null,
        moduleName: null,
        businessName: null,
        functionName: null,
        functionAuthor: null,
        genType: null,
        genPath: null,
        options: null,
        particleStatus: null,
        requestPath: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        roleId: [
          { required: true, message: '角色ID不能为空', trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    const roleId = this.$route.params && this.$route.params.roleId
    this.roleId = this.$route.params && this.$route.params.roleId
    this.queryParams.roleId = roleId
    this.getList()
  },
  methods: {
    /** 查询数据清单列表 */
    getList() {
      this.loading = true
      listTable(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.tableList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 关闭详情页
    cancelDetail() {
      this.detailOpen = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        tableId: null,
        tableName: null,
        tableComment: null,
        roleId: null,
        className: null,
        tplCategory: null,
        packageName: null,
        moduleName: null,
        businessName: null,
        functionName: null,
        functionAuthor: null,
        genType: null,
        genPath: null,
        options: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        particleStatus: '0',
        requestPath: null
      }
      this.resetForm('form')
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 打开导入表弹窗 */
    openImportTable() {
      const roleId = this.roleId
      if (typeof (roleId) === 'undefined') {
        this.$alert('请从角色管理界面进入【数据清单】配置', '温馨提示')
        return
      }
      this.$refs.import.show()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = []
      this.resetForm('queryForm')
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.tableId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 详情按钮操作 */
    handleDetail(row) {
      this.tableId = row.tableId
      this.detailOpen = true
      this.title = '数据清单详情'
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = '添加数据清单'
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const tableId = row.tableId || this.ids
      getTable(tableId).then(response => {
        this.form = response.data
        this.open = true
        this.title = '修改数据清单'
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          if (this.form.tableId != null) {
            updateTable(this.form).then(response => {
              this.msgSuccess('修改成功')
              this.open = false
              this.getList()
            })
          } else {
            addTable(this.form).then(response => {
              this.msgSuccess('新增成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 修改颗粒项操作 */
    handleEditParticle(row) {
      const tableId = row.tableId || this.ids[0]
      const roleId = row.roleId
      this.$router.push('/particle/editParticle/' + tableId + '/' + roleId)
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const tableIds = row.tableId || this.ids
      this.$confirm('是否确认删除数据清单编号为"' + tableIds + '"的数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function() {
        return delTable(tableIds)
      }).then(() => {
        this.getList()
        this.msgSuccess('删除成功')
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams
      this.$confirm('是否确认导出所有数据清单数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function() {
        return exportTable(queryParams)
      }).then(response => {
        this.download(response.msg)
      })
    },
    /** 关闭前的回调 */
    handleClose(done) {
      this.$confirm('确认关闭？')
        .then(_ => {
          done()
        })
        .catch(_ => {})
    }
  }
}
</script>
