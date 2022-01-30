<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="列名称" prop="columnName" v-if="queryColumns.columnName">
        <el-input
          v-model="queryParams.columnName"
          placeholder="请输入列名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="列类型" prop="columnType" v-if="queryColumns.columnType">
        <el-select v-model="queryParams.columnType" placeholder="请选择列类型" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="列宽" prop="columnWidth" v-if="queryColumns.columnWidth">
        <el-input
          v-model="queryParams.columnWidth"
          placeholder="请输入列宽"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="归属表编号" prop="tableId" v-if="queryColumns.tableId">
        <el-input
          v-model="queryParams.tableId"
          placeholder="请输入归属表编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="归属表名称" prop="tableName" v-if="queryColumns.tableName">
        <el-input
          v-model="queryParams.tableName"
          placeholder="请输入归属表名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="JAVA类型" prop="javaType" v-if="queryColumns.javaType">
        <el-select v-model="queryParams.javaType" placeholder="请选择JAVA类型" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="JAVA字段名" prop="javaField" v-if="queryColumns.javaField">
        <el-input
          v-model="queryParams.javaField"
          placeholder="请输入JAVA字段名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否主键" prop="isPk" v-if="queryColumns.isPk">
        <el-input
          v-model="queryParams.isPk"
          placeholder="请输入是否主键"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否自增" prop="isIncrement" v-if="queryColumns.isIncrement">
        <el-input
          v-model="queryParams.isIncrement"
          placeholder="请输入是否自增"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否必填" prop="isRequired" v-if="queryColumns.isRequired">
        <el-input
          v-model="queryParams.isRequired"
          placeholder="请输入是否必填"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否为插入字段" prop="isInsert" v-if="queryColumns.isInsert">
        <el-input
          v-model="queryParams.isInsert"
          placeholder="请输入是否为插入字段"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否编辑字段" prop="isEdit" v-if="queryColumns.isEdit">
        <el-input
          v-model="queryParams.isEdit"
          placeholder="请输入是否编辑字段"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否列表字段" prop="isList" v-if="queryColumns.isList">
        <el-input
          v-model="queryParams.isList"
          placeholder="请输入是否列表字段"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否查询字段" prop="isQuery" v-if="queryColumns.isQuery">
        <el-input
          v-model="queryParams.isQuery"
          placeholder="请输入是否查询字段"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="查询方式" prop="queryType" v-if="queryColumns.queryType">
        <el-select v-model="queryParams.queryType" placeholder="请选择查询方式" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="显示类型" prop="htmlType" v-if="queryColumns.htmlType">
        <el-select v-model="queryParams.htmlType" placeholder="请选择显示类型" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="字典类型" prop="dictType" v-if="queryColumns.dictType">
        <el-select v-model="queryParams.dictType" placeholder="请选择字典类型" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="排序" prop="sort" v-if="queryColumns.sort">
        <el-input
          v-model="queryParams.sort"
          placeholder="请输入排序"
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
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:column:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:column:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:column:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:column:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="columnList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="columnId" v-if="tableColumns.columnId"/>
      <el-table-column label="列名称" align="center" prop="columnName" v-if="tableColumns.columnName"/>
      <el-table-column label="列描述" align="center" prop="columnDescription" v-if="tableColumns.columnDescription"/>
      <el-table-column label="列类型" align="center" prop="columnType" v-if="tableColumns.columnType"/>
      <el-table-column label="列宽" align="center" prop="columnWidth" v-if="tableColumns.columnWidth"/>
      <el-table-column label="归属表编号" align="center" prop="tableId" v-if="tableColumns.tableId"/>
      <el-table-column label="归属表名称" align="center" prop="tableName" v-if="tableColumns.tableName"/>
      <el-table-column label="JAVA类型" align="center" prop="javaType" v-if="tableColumns.javaType"/>
      <el-table-column label="JAVA字段名" align="center" prop="javaField" v-if="tableColumns.javaField"/>
      <el-table-column label="是否主键" align="center" prop="isPk" v-if="tableColumns.isPk"/>
      <el-table-column label="是否自增" align="center" prop="isIncrement" v-if="tableColumns.isIncrement"/>
      <el-table-column label="是否必填" align="center" prop="isRequired" v-if="tableColumns.isRequired"/>
      <el-table-column label="是否为插入字段" align="center" prop="isInsert" v-if="tableColumns.isInsert"/>
      <el-table-column label="是否编辑字段" align="center" prop="isEdit" v-if="tableColumns.isEdit"/>
      <el-table-column label="是否列表字段" align="center" prop="isList" v-if="tableColumns.isList"/>
      <el-table-column label="是否查询字段" align="center" prop="isQuery" v-if="tableColumns.isQuery"/>
      <el-table-column label="查询方式" align="center" prop="queryType" v-if="tableColumns.queryType"/>
      <el-table-column label="显示类型" align="center" prop="htmlType" v-if="tableColumns.htmlType"/>
      <el-table-column label="字典类型" align="center" prop="dictType" v-if="tableColumns.dictType"/>
      <el-table-column label="排序" align="center" prop="sort" v-if="tableColumns.sort"/>
      <el-table-column label="备注" align="center" prop="remark" v-if="tableColumns.remark"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-search"
            @click="handleDetail(scope.row)"
          >查看
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:column:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:column:remove']"
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
      <vitae-detail :columnId="columnId"  />
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelDetail">关闭</el-button>
      </div>
    </el-dialog>
    <!-- 添加或修改代码生成业务字段对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="80%" :before-close="handleClose" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" size="medium ">
        <el-row>
          <el-col :span="12">
            <el-form-item label="列名称" prop="columnName">
              <el-input v-model="form.columnName" placeholder="请输入列名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="列描述" prop="columnDescription">
              <el-input v-model="form.columnDescription" type="textarea" placeholder="请输入内容" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="列类型" prop="columnType">
              <el-select v-model="form.columnType" placeholder="请选择列类型" style="width: 100%"  >
                <el-option label="请选择字典生成" value="" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="列宽" prop="columnWidth">
              <el-input v-model="form.columnWidth" placeholder="请输入列宽" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="归属表编号" prop="tableId">
              <el-input v-model="form.tableId" placeholder="请输入归属表编号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="归属表名称" prop="tableName">
              <el-input v-model="form.tableName" placeholder="请输入归属表名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="JAVA类型" prop="javaType">
              <el-select v-model="form.javaType" placeholder="请选择JAVA类型" style="width: 100%"  >
                <el-option label="请选择字典生成" value="" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="JAVA字段名" prop="javaField">
              <el-input v-model="form.javaField" placeholder="请输入JAVA字段名" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="是否主键" prop="isPk">
              <el-input v-model="form.isPk" placeholder="请输入是否主键" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="是否自增" prop="isIncrement">
              <el-input v-model="form.isIncrement" placeholder="请输入是否自增" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="是否必填" prop="isRequired">
              <el-input v-model="form.isRequired" placeholder="请输入是否必填" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="是否为插入字段" prop="isInsert">
              <el-input v-model="form.isInsert" placeholder="请输入是否为插入字段" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="是否编辑字段" prop="isEdit">
              <el-input v-model="form.isEdit" placeholder="请输入是否编辑字段" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="是否列表字段" prop="isList">
              <el-input v-model="form.isList" placeholder="请输入是否列表字段" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="是否查询字段" prop="isQuery">
              <el-input v-model="form.isQuery" placeholder="请输入是否查询字段" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="查询方式" prop="queryType">
              <el-select v-model="form.queryType" placeholder="请选择查询方式" style="width: 100%"  >
                <el-option label="请选择字典生成" value="" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="显示类型" prop="htmlType">
              <el-select v-model="form.htmlType" placeholder="请选择显示类型" style="width: 100%"  >
                <el-option label="请选择字典生成" value="" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="字典类型" prop="dictType">
              <el-select v-model="form.dictType" placeholder="请选择字典类型" style="width: 100%"  >
                <el-option label="请选择字典生成" value="" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="排序" prop="sort">
              <el-input v-model="form.sort" placeholder="请输入排序" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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
  import { listColumn, getColumn, delColumn, addColumn, updateColumn, exportColumn } from "@/api/system/column";
  import columnDetail from "@/views/system/column/detail";
  export default {
    name: "Column",
    components: {
      columnDetail,
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
        // 代码生成业务字段表格数据
        columnList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 是否详情显示弹出层
        detailOpen:false,
        //点击详情传参
        columnId:null,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          columnName: null,
          columnDescription: null,
          columnType: null,
          columnWidth: null,
          tableId: null,
          tableName: null,
          javaType: null,
          javaField: null,
          isPk: null,
          isIncrement: null,
          isRequired: null,
          isInsert: null,
          isEdit: null,
          isList: null,
          isQuery: null,
          queryType: null,
          htmlType: null,
          dictType: null,
          sort: null,
          tableColumns: {},
          queryColumns: {},
          editColumns: {},
          insertColumns: {},
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询代码生成业务字段列表 */
      getList() {
        this.loading = true;
        listColumn(this.queryParams).then(response => {
          this.columnList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      },
      // 取消按钮
      cancel() {
        this.open = false;
        this.reset();
      },
      //关闭详情页
      cancelDetail(){
        this.detailOpen= false;
        this.reset();
      },
      // 表单重置
      reset() {
        this.form = {
          columnId: null,
          columnName: null,
          columnDescription: null,
          columnType: null,
          columnWidth: null,
          tableId: null,
          tableName: null,
          javaType: null,
          javaField: null,
          isPk: null,
          isIncrement: null,
          isRequired: null,
          isInsert: null,
          isEdit: null,
          isList: null,
          isQuery: null,
          queryType: null,
          htmlType: null,
          dictType: null,
          sort: null,
          createBy: null,
          createTime: null,
          updateBy: null,
          updateTime: null,
          delFlag: null,
          remark: null
        };
        this.resetForm("form");
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.pageNum = 1;
        this.getList();
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.resetForm("queryForm");
        this.handleQuery();
      },
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.columnId)
        this.single = selection.length!==1
        this.multiple = !selection.length
      },
      /** 详情按钮操作 */
      handleDetail(row){
        this.columnId=row.columnId;
        this.detailOpen = true;
        this.title = "代码生成业务字段详情";
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加代码生成业务字段";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const columnId = row.columnId || this.ids
        getColumn(columnId).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改代码生成业务字段";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.columnId != null) {
              updateColumn(this.form).then(response => {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addColumn(this.form).then(response => {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }
        });
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const columnIds = row.columnId || this.ids;
        this.$confirm('是否确认删除代码生成业务字段编号为"' + columnIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delColumn(columnIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
      },
      /** 导出按钮操作 */
      handleExport() {
        const queryParams = this.queryParams;
        this.$confirm('是否确认导出所有代码生成业务字段数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportColumn(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
      },
      /** 关闭前的回调 */
      handleClose(done) {
        this.$confirm('确认关闭？')
          .then(_ => {
            done();
          })
          .catch(_ => {});
      },
    }
  };
</script>
F
