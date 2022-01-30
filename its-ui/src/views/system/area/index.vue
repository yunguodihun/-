<template>
  <div class="app-container">
    <el-form v-show="showSearch" ref="queryForm" :model="queryParams" :inline="true" label-width="68px">
      <el-form-item v-if="queryColumns.parentId" label="父ID" prop="parentId">
        <el-input
          v-model="queryParams.parentId"
          placeholder="请输入父ID"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.parentIds" label="父IDS" prop="parentIds">
        <el-input
          v-model="queryParams.parentIds"
          placeholder="请输入父IDS"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.name" label="名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.sort" label="排序" prop="sort">
        <el-input
          v-model="queryParams.sort"
          placeholder="请输入排序"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.parentCode" label="父编号" prop="parentCode">
        <el-input
          v-model="queryParams.parentCode"
          placeholder="请输入父编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.code" label="编号" prop="code">
        <el-input
          v-model="queryParams.code"
          placeholder="请输入编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.type" label="类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择类型" clearable size="small">
          <el-option
            v-for="dict in typeOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item v-if="queryColumns.createBy" label="创建者" prop="createBy">
        <el-input
          v-model="queryParams.createBy"
          placeholder="请输入创建者"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.createDate" label="创建时间" prop="createDate">
        <el-date-picker
          v-model="queryParams.createDate"
          clearable
          size="small"
          style="width: 200px"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择创建时间"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.updateBy" label="修改者" prop="updateBy">
        <el-input
          v-model="queryParams.updateBy"
          placeholder="请输入修改者"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.updateDate" label="修改时间" prop="updateDate">
        <el-date-picker
          v-model="queryParams.updateDate"
          clearable
          size="small"
          style="width: 200px"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择修改时间"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.remarks" label="备注" prop="remarks">
        <el-input
          v-model="queryParams.remarks"
          placeholder="请输入备注"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.delFlag" label="删除标识" prop="delFlag">
        <el-input
          v-model="queryParams.delFlag"
          placeholder="请输入删除标识"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
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
          v-hasPermi="['system:area:add']"
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['system:area:edit']"
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['system:area:remove']"
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['system:area:export']"
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
        >导出</el-button>
      </el-col>
      <right-toolbar :show-search.sync="showSearch" @queryTable="getList" />
    </el-row>

    <el-table v-loading="loading" :data="areaList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <template v-for="(col, index) in dynamicTableDataColumns">
        <el-table-column
          v-if="columns[index].visible"
          :key="col.dataItem"
          :show-overflow-tooltip="true"
          :prop="col.dataItem"
          :label="col.dataName"
        />
      </template>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-search"
            @click="handleDetail(scope.row)"
          >查看
          </el-button>
          <el-button
            v-hasPermi="['system:area:edit']"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
          >修改</el-button>
          <el-button
            v-hasPermi="['system:area:remove']"
            size="mini"
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
      <area-detail :id="id" :dynamic-table-data-detail-columns="dynamicTableDataDetailColumns" />
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelDetail">关闭</el-button>
      </div>
    </el-dialog>
    <!-- 添加或修改区域对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="80%" :before-close="handleClose" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" size="medium ">
        <el-row>
          <el-col :span="12">
            <el-form-item label="父ID" prop="parentId">
              <el-input v-model="form.parentId" placeholder="请输入父ID" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="父IDS" prop="parentIds">
              <el-input v-model="form.parentIds" placeholder="请输入父IDS" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="排序" prop="sort">
              <el-input v-model="form.sort" placeholder="请输入排序" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="父编号" prop="parentCode">
              <el-input v-model="form.parentCode" placeholder="请输入父编号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="编号" prop="code">
              <el-input v-model="form.code" placeholder="请输入编号" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="类型" prop="type">
              <el-select v-model="form.type" placeholder="请选择类型" style="width: 100%">
                <el-option
                  v-for="dict in typeOptions"
                  :key="dict.dictValue"
                  :label="dict.dictLabel"
                  :value="dict.dictValue"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="创建时间" prop="createDate">
              <el-date-picker
                v-model="form.createDate"
                clearable
                size="medium"
                style="width: 100%"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="选择创建时间"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="修改时间" prop="updateDate">
              <el-date-picker
                v-model="form.updateDate"
                clearable
                size="medium"
                style="width: 100%"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="选择修改时间"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="备注" prop="remarks">
              <el-input v-model="form.remarks" placeholder="请输入备注" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listArea, getArea, delArea, addArea, updateArea, exportArea } from '@/api/system/area'
import areaDetail from '@/views/system/area/detail'
export default {
  name: 'Area',
  components: {
    areaDetail
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
      // 区域表格数据
      areaList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 是否详情显示弹出层
      detailOpen: false,
      // 点击详情传参
      id: null,
      // 类型字典
      typeOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
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
      },
      // 表单参数
      form: {},
      // 动态表格列
      dynamicTableDataColumns: [],
      // 动态表格详情列
      dynamicTableDataDetailColumns: [],
      // 显隐列
      columns: [],
      // 表格数据列
      tableColumns: {},
      // 查询项
      queryColumns: {},
      // 详情项
      detailColumns: {},
      // 表单校验
      rules: {
        parentId: [
          { required: true, message: '父ID不能为空', trigger: 'blur' }
        ],
        parentIds: [
          { required: true, message: '父IDS不能为空', trigger: 'blur' }
        ],
        name: [
          { required: true, message: '名称不能为空', trigger: 'blur' }
        ],
        sort: [
          { required: true, message: '排序不能为空', trigger: 'blur' }
        ],
        createBy: [
          { required: true, message: '创建者不能为空', trigger: 'blur' }
        ],
        createDate: [
          { required: true, message: '创建时间不能为空', trigger: 'blur' }
        ],
        updateBy: [
          { required: true, message: '修改者不能为空', trigger: 'blur' }
        ],
        updateDate: [
          { required: true, message: '修改时间不能为空', trigger: 'blur' }
        ],
        delFlag: [
          { required: true, message: '删除标识不能为空', trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    this.getList()
    this.getDicts('site_point_type').then(response => {
      this.typeOptions = response.data
    })
  },
  methods: {
    /** 查询区域列表 */
    getList() {
      this.loading = true
      listArea(this.queryParams).then(response => {
        this.areaList = response.rows
        this.total = response.total
        this.loading = false
        this.tableColumns = response.tableColumns
        this.queryColumns = response.queryColumns
        this.detailColumns = response.detailColumns
        this.dynamicTableDataColumns = response.dynamicTableDataColumns
        this.dynamicTableDataDetailColumns = response.dynamicTableDataDetailColumns
        this.columns = response.columns
      })
    },
    // 类型字典翻译
    typeFormat(row, column) {
      return this.selectDictLabel(this.typeOptions, row.type)
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
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm('queryForm')
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 详情按钮操作 */
    handleDetail(row) {
      this.id = row.id
      this.detailOpen = true
      this.title = '区域详情'
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = '添加区域'
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getArea(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = '修改区域'
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateArea(this.form).then(response => {
              this.msgSuccess('修改成功')
              this.open = false
              this.getList()
            })
          } else {
            addArea(this.form).then(response => {
              this.msgSuccess('新增成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$confirm('是否确认删除区域编号为"' + ids + '"的数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function() {
        return delArea(ids)
      }).then(() => {
        this.getList()
        this.msgSuccess('删除成功')
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams
      this.$confirm('是否确认导出所有区域数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function() {
        return exportArea(queryParams)
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
