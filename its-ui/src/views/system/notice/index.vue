<template>
  <div class="app-container">
    <el-form v-show="showSearch" ref="queryForm" :model="queryParams" :inline="true" label-width="68px">
      <el-form-item label="公告标题" prop="noticeTitle">
        <el-input
          v-model="queryParams.noticeTitle"
          placeholder="请输入公告标题"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="操作人员" prop="createBy">
        <el-input
          v-model="queryParams.createBy"
          placeholder="请输入操作人员"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="类型" prop="noticeType">
        <el-select v-model="queryParams.noticeType" placeholder="公告类型" clearable size="small">
          <el-option
            v-for="dict in typeOptions"
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
          v-hasPermi="['system:notice:add']"
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['system:notice:edit']"
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-hasPermi="['system:notice:remove']"
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
        >删除</el-button>
      </el-col>
      <right-toolbar :show-search.sync="showSearch" @queryTable="getList" />
    </el-row>

    <el-table v-loading="loading" :data="noticeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" prop="noticeId" width="100" />
      <el-table-column
        label="公告标题"
        align="center"
        prop="noticeTitle"
        :show-overflow-tooltip="true"
      />
      <el-table-column
        label="公告类型"
        align="center"
        prop="noticeType"
        :formatter="typeFormat"
        width="100"
      />
      <el-table-column
        label="状态"
        align="center"
        prop="status"
        :formatter="statusFormat"
        width="100"
      />
      <el-table-column label="创建者" align="center" prop="createBy" width="100" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="100">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-hasPermi="['system:notice:query']"
            size="mini"
            type="text"
            icon="el-icon-search"
            @click="handleView(scope.row)"
          >查看</el-button>
          <el-button
            v-hasPermi="['system:notice:edit']"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
          >修改</el-button>
          <el-button
            v-hasPermi="['system:notice:remove']"
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

    <!-- 添加或修改公告对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="780px" :before-close="handleClose" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="公告标题" prop="noticeTitle">
              <el-input v-model="form.noticeTitle" placeholder="请输入公告标题" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="公告类型" prop="noticeType">
              <el-select v-model="form.noticeType" placeholder="请选择">
                <el-option
                  v-for="dict in typeOptions"
                  :key="dict.dictValue"
                  :label="dict.dictLabel"
                  :value="dict.dictValue"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="状态">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in statusOptions"
                  :key="dict.dictValue"
                  :label="dict.dictValue"
                >{{ dict.dictLabel }}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <FileUpload ref="child" v-model="form.fileList" v-loading="loading" :search-id="searchId" @input="fileChange" @updateInput="fileUpdate" @deleteInput="fileDelete" />
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer" style="padding-top:20px">
        <el-button v-show="showConfirmButton" type="primary" @click="submitForm"> 确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listNotice, getNotice, delNotice, addNotice, updateNotice } from '@/api/system/notice'
import { listFile } from '@/api/system/file'
import FileUpload from '@/components/FileUpload'
export default {
  name: 'Notice',
  components: {
    FileUpload
  },
  data() {
    return {
      showConfirmButton: true,
      searchId: 0,
      deleteFiles: [],
      updateFiles: [],
      fileList: [],
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
      // 公告表格数据
      noticeList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 类型数据字典
      statusOptions: [],
      // 状态数据字典
      typeOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        noticeTitle: undefined,
        createBy: undefined,
        status: undefined
      },
      queryParamsFile: {
        pageNum: 1,
        pageSize: 20,
        searchId: undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        noticeTitle: [
          { required: true, message: '公告标题不能为空', trigger: 'blur' }
        ],
        noticeType: [
          { required: true, message: '公告类型不能为空', trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    this.getList()
    this.getDicts('sys_notice_status').then(response => {
      this.statusOptions = response.data
    })
    this.getDicts('sys_notice_type').then(response => {
      this.typeOptions = response.data
    })
  },
  methods: {
    fileChange(file) {
      console.log('fileChange>>>' + JSON.stringify(file))
      this.fileList = []
      this.fileList = file
    },
    fileUpdate(file) {
      this.updateFiles.push(file)
    },
    fileDelete(file) {
      this.deleteFiles.push(file)
      console.log('待删除列表>>>>>>' + JSON.stringify(this.deleteFiles))
    },
    /** 查询公告列表 */
    getList() {
      this.loading = true
      listNotice(this.queryParams).then(response => {
        this.noticeList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 公告状态字典翻译
    statusFormat(row, column) {
      return this.selectDictLabel(this.statusOptions, row.status)
    },
    // 公告状态字典翻译
    typeFormat(row, column) {
      return this.selectDictLabel(this.typeOptions, row.noticeType)
    },
    // 取消按钮
    cancel() {
      this.$confirm('确认关闭？')
        .then(_ => {
          this.open = false
          this.reset()
          this.$refs.child.clearFiles()
        })
        .catch(_ => {})
    },
    // 表单重置
    reset() {
      this.form = {
        noticeId: undefined,
        noticeTitle: undefined,
        noticeType: undefined,
        noticeContent: undefined,
        status: '0'
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
      this.ids = selection.map(item => item.noticeId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.showConfirmButton = true
      this.open = true
      this.title = '添加公告'
    },
    /** 查看按钮操作 */
    handleView(row) {
      this.queryParamsFile.searchId = row.noticeId
      this.searchId = row.noticeId
      this.loading = true
      this.showConfirmButton = false
      this.clearList()
      this.$nextTick(() => {
        listFile(this.queryParamsFile).then(response => {
          for (let i = 0; i < response.rows.length; i++) {
            this.fileList.push({ name: response.rows[i].fileOriginName, url: process.env.VUE_APP_BASE_API + response.rows[i].filePath })
          }
          // 这里加了个延迟，用于延迟获取子组件实例
          setTimeout(() => {
            this.$refs.child.pushFiles(this.fileList)
          }, 200)
          this.loading = false
        })
      })
      this.reset()
      const noticeId = row.noticeId || this.ids
      getNotice(noticeId).then(response => {
        this.form = response.data
        this.open = true
        this.title = '查看公告'
      })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.queryParamsFile.searchId = row.noticeId
      this.searchId = row.noticeId
      this.loading = true
      this.showConfirmButton = true
      this.clearList()
      this.$nextTick(() => {
        listFile(this.queryParamsFile).then(response => {
          for (let i = 0; i < response.rows.length; i++) {
            this.fileList.push({ name: response.rows[i].fileOriginName,
              url: process.env.VUE_APP_BASE_API + response.rows[i].filePath,
              fileid: response.rows[i].fileId, size: response.rows[i].fileSize,
              createBy: response.rows[i].createBy, createTime: response.rows[i].createTime })
          }
          console.log('this.fileList>>>>' + JSON.stringify(this.fileList))
          // 这里加了个延迟，用于延迟获取子组件实例
          setTimeout(() => {
            this.$refs.child.pushFiles(this.fileList)
          }, 200)
          this.loading = false
        })
      })
      this.reset()
      const noticeId = row.noticeId || this.ids
      getNotice(noticeId).then(response => {
        this.form = response.data
        this.open = true
        this.title = '修改公告'
      })
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          // 文件
          if (this.form.noticeId !== undefined) {
            const map = {}
            this.updateFiles.map(function(value, index, array) {
              map[index] = value
              return map
            })
            this.form.fileList = map

            // 待删除的文件列表
            const mapDel = {}
            this.deleteFiles.map(function(value, index, array) {
              mapDel[index] = value
              return mapDel
            })
            this.form.delFiles = mapDel

            updateNotice(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess('修改成功')
                this.open = false
                this.getList()
                this.clearList()
                this.$refs.child.clearFiles()
              }
            })
          } else {
            const map = {}
            this.fileList.map(function(value, index, array) {
              map[index] = value
              return map
            })
            this.form.fileList = map
            addNotice(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess('新增成功')
                this.open = false
                this.getList()
                this.clearList()
                this.$refs.child.clearFiles()
              }
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const noticeIds = row.noticeId || this.ids
      this.$confirm('是否确认删除公告编号为"' + noticeIds + '"的数据项?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(function() {
        return delNotice(noticeIds)
      }).then(() => {
        this.getList()
        this.msgSuccess('删除成功')
      }).catch(function() {})
    },
    /** 关闭前的回调 */
    handleClose(done) {
      this.$confirm('确认关闭？')
        .then(_ => {
          done()
          this.clearList()
          this.$refs.child.clearFiles()
        })
        .catch(_ => {})
    },
    /** 清空列表 */
    clearList() {
      this.fileList = []
      this.deleteFiles = []
      this.updateFiles = []
    }
  }
}

</script>
