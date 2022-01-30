<template>
  <div class="app-container">
    <el-form v-show="showSearch" ref="queryForm" :model="queryParams" :inline="true" label-width="68px">
      <el-form-item v-if="queryColumns.code" label="编号" prop="code">
        <el-input
          v-model="queryParams.code"
          placeholder="请输入编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.birthday" label="生日" prop="birthday">
        <el-date-picker
          v-model="queryParams.birthday"
          clearable
          size="small"
          style="width: 200px"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择生日"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.name" label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item v-if="queryColumns.sex" label="用户性别" prop="sex">
        <el-select v-model="queryParams.sex" placeholder="请选择用户性别" clearable size="small">
          <el-option
            v-for="dict in sexOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item v-if="queryColumns.status" label="在职状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择在职状态" clearable size="small">
          <el-option
            v-for="dict in statusOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['demo:vitae:add']"
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['demo:vitae:edit']"
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['demo:vitae:remove']"
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['demo:vitae:export']"
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :show-search.sync="showSearch" @queryTable="getList" />
    </el-row>

    <el-table v-loading="loading" :data="vitaeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column
        :key="tableColumns.deptId"
        v-if="tableColumns.deptId"
        label="部门"
        align="center"
        prop="dept.deptName"
        :show-overflow-tooltip="true"
      />
      <el-table-column :key="Math.random()" v-if="tableColumns.code" label="编号" align="center" prop="code" />
      <el-table-column :key="Math.random()" v-if="tableColumns.birthday" label="生日" align="center" prop="birthday" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.birthday, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column :key="Math.random()" v-if="tableColumns.name" label="姓名" align="center" prop="name" />
      <el-table-column :key="Math.random()" v-if="tableColumns.email" label="邮箱" align="center" prop="email" />
      <el-table-column :key="Math.random()" v-if="tableColumns.phoneNumber" label="手机号码" align="center" prop="phoneNumber" />
      <el-table-column :key="Math.random()" v-if="tableColumns.sex" label="用户性别" align="center" prop="sex" :formatter="sexFormat" />
      <el-table-column :key="Math.random()" v-if="queryColumns.avatar" label="头像地址" align="center" prop="avatar" />
      <el-table-column :key="Math.random()" v-if="tableColumns.status" label="在职状态" align="center" prop="status" :formatter="statusFormat" />
      <el-table-column :key="Math.random()" v-if="tableColumns.entryStartTime" label="入职开始时间" align="center" prop="entryStartTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.entryStartTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column :key="Math.random()" v-if="tableColumns.entryEndTime" label="入职结束时间" align="center" prop="entryEndTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.entryEndTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column :key="Math.random()" v-if="tableColumns.adeptTechnology" label="擅长技术" align="center" prop="adeptTechnology" :formatter="adeptTechnologyFormat" />
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
            v-hasPermi="['demo:vitae:edit']"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
          >修改
          </el-button>
          <el-button
            v-hasPermi="['demo:vitae:remove']"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
          >删除
          </el-button>
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
    <el-dialog :title="title" :visible.sync="vitaeDetailOpen" width="80%" append-to-body>
      <vitae-detail :vitae-id="checkVitaeId" :detail-columns="detailColumns"/>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelDetail">关闭</el-button>
      </div>
    </el-dialog>
    <!-- 添加或修改简历信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" :before-close="handleClose" width="65%" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" size="medium ">
        <el-row>
          <el-col :span="12">
            <el-form-item label="所属部门" prop="deptId">
              <treeselect
                v-model="form.deptId"
                :options="deptOptions"
                :disable-branch-nodes="false"
                :show-count="true"
                placeholder="请选择归属部门"
              />
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
            <el-form-item label="生日" prop="birthday">
              <el-date-picker
                v-model="form.birthday"
                clearable
                style="width: 100%"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="选择生日"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="排序" prop="sort">
              <el-input-number v-model="form.sort" placeholder="请输入排序" style="width: 100%" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="姓名" prop="name">
              <el-input v-model="form.name" placeholder="请输入姓名" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="邮箱" prop="email">
              <el-input v-model="form.email" placeholder="请输入邮箱" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="手机号码" prop="phoneNumber">
              <el-input v-model="form.phoneNumber" placeholder="请输入手机号码" />
            </el-form-item>
          </el-col>
          <el-col :span="12" />
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户性别">
              <el-radio-group v-model="form.sex">
                <el-radio
                  v-for="dict in sexOptions"
                  :key="dict.dictValue"
                  :label="dict.dictValue"
                >{{ dict.dictLabel }}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="在职状态">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in statusOptions"
                  :key="dict.dictValue"
                  :label="dict.dictValue"
                >{{ dict.dictLabel }}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="入职时间" prop="entryStartTime">
              <el-date-picker
                v-model="form.entryStartTime"
                clearable
                style="width: 100%"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="选择入职开始时间"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="离职时间" prop="entryEndTime">
              <el-date-picker
                v-model="form.entryEndTime"
                clearable
                style="width: 100%"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="选择入职结束时间"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="擅长技术">
          <el-checkbox-group v-model="form.adeptTechnology">
            <el-checkbox
              v-for="dict in adeptTechnologyOptions"
              :key="dict.dictValue"
              :label="dict.dictValue"
            >
              {{ dict.dictLabel }}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="教育经历" prop="educationExperience">
          <el-input v-model="form.educationExperience" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="头像地址">
          <ImageUpload v-model="form.avatar" />
        </el-form-item>
        <el-form-item label="附件">
          <ImageUpload v-model="form.file" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listVitae, getVitae, delVitae, addVitae, updateVitae, exportVitae } from '@/api/demo/vitae'
import ImageUpload from '@/components/ImageUpload'
import { treeselect } from '@/api/system/dept'
import { postOptionSelect } from '@/api/system/post'
import Treeselect from '@riophae/vue-treeselect'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import { convertDateFromString, checkNull } from '@/utils/base.js'
import vitaeDetail from '@/views/demo/vitae/detail'

export default {
  name: 'Vitae',
  components: {
    ImageUpload,
    Treeselect,
    vitaeDetail
  },
  data() {
    const compareToEntryEndTime = (rule, value, callback) => {
      if (!checkNull(value) && !checkNull(this.form.entryStartTime)) {
        const startDate = convertDateFromString(this.form.entryStartTime)
        const endDate = convertDateFromString(value)
        if (startDate >= endDate) {
          callback(new Error('离职时间必须大于入职时间'))
        } else {
          callback()
        }
      } else {
        callback()
      }
    }
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
      // 简历信息表格数据
      vitaeList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 详情页是否显示弹出层
      vitaeDetailOpen: false,
      // 用户性别字典
      sexOptions: [],
      // 在职状态字典
      statusOptions: [],
      // 擅长技术字典
      adeptTechnologyOptions: [],
      // 部门树选项
      deptOptions: undefined,
      // 岗位选项
      postOptions: [],
      // 点击详情传参
      checkVitaeId: null,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deptId: null,
        code: null,
        birthday: null,
        name: null,
        sex: null,
        password: null,
        status: null,
        adeptTechnology: null
      },
      // 表单参数
      form: {},
      // 表格数据列
      tableColumns: {},
      // 查询类
      queryColumns: {},
      // 详情列
      detailColumns: {},
      // 表单校验
      rules: {
        code: [
          { required: true, message: '编号不能为空', trigger: 'blur' }
        ],
        name: [
          { required: true, message: '姓名不能为空', trigger: 'blur' }
        ],
        entryStartTime: [
          { required: true, message: '入职时间不能为空', trigger: 'blur' }
        ],
        entryEndTime: [
          { required: true, message: '离职时间不能为空', trigger: 'blur' },
          { required: true, validator: compareToEntryEndTime, trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    this.getList()
    this.getTreeselect()
    this.getDicts('sys_user_sex').then(response => {
      this.sexOptions = response.data
    })
    this.getDicts('on_job_status').then(response => {
      this.statusOptions = response.data
    })
    this.getDicts('software_technology').then(response => {
      this.adeptTechnologyOptions = response.data
    })
    postOptionSelect().then(response => {
      this.postOptions = response.data
    })
  },
  methods: {
    /** 查询简历信息列表 */
    getList() {
      this.loading = true
      listVitae(this.queryParams).then(response => {
        this.vitaeList = response.rows
        this.total = response.total
        this.loading = false
        this.tableColumns = response.tableColumns
        this.queryColumns = response.queryColumns
        this.detailColumns = response.detailColumns
      })
    },
    // 用户性别字典翻译
    sexFormat(row, column) {
      return this.selectDictLabel(this.sexOptions, row.sex)
    },
    // 在职状态字典翻译
    statusFormat(row, column) {
      return this.selectDictLabel(this.statusOptions, row.status)
    },
    // 擅长技术字典翻译
    adeptTechnologyFormat(row, column) {
      return this.selectDictLabels(this.adeptTechnologyOptions, row.adeptTechnology)
    },
    /** 查询部门下拉树结构 */
    getTreeselect() {
      treeselect().then(response => {
        this.deptOptions = response.data
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 关闭详情页
    cancelDetail() {
      this.vitaeDetailOpen = false
      this.reset()
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
      this.ids = selection.map(item => item.vitaeId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = '添加简历信息'
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const vitaeId = row.vitaeId || this.ids
      getVitae(vitaeId).then(response => {
        this.form = response.data
        this.form.adeptTechnology = this.form.adeptTechnology.split(',')
        this.open = true
        this.title = '修改简历信息'
      })
    },
    /** 详情按钮操作 */
    handleDetail(row) {
      this.checkVitaeId = row.vitaeId
      this.vitaeDetailOpen = true
      this.title = '简历信息'
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          this.form.adeptTechnology = this.form.adeptTechnology.join(',')
          if (this.form.vitaeId != null) {
            updateVitae(this.form).then(response => {
              this.msgSuccess('修改成功')
              this.open = false
              this.getList()
            })
          } else {
            addVitae(this.form).then(response => {
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
      const vitaeIds = row.vitaeId || this.ids
      this.$confirm('是否确认删除简历信息编号为"' + vitaeIds + '"的数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function() {
        return delVitae(vitaeIds)
      }).then(() => {
        this.getList()
        this.msgSuccess('删除成功')
      })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams
      this.$confirm('是否确认导出所有简历信息数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function() {
        return exportVitae(queryParams)
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
        .catch(_ => {
        })
    }
  }
}
</script>
<style rel="stylesheet/scss" lang="scss" scoped>
   /*/deep/.vue-treeselect__control{
     height: 30px;
   }
   /deep/.el-form-item--medium .el-form-item__content {
     line-height: 30px;
   }*/
</style>
