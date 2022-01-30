<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
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
          v-hasPermi="['demo:validation:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['demo:validation:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['demo:validation:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['demo:validation:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="validationList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="验证实例ID" align="center" prop="validationId"/>
      <el-table-column label="整数大于零" align="center" prop="intGreaterThanZero"/>
      <el-table-column label="浮点大于零" align="center" prop="floatGreaterThanZero"/>
      <el-table-column label="整数" align="center" prop="integerNum"/>
      <el-table-column label="必须浮点" align="center" prop="floatNum"/>
      <el-table-column label="备注" align="center" prop="remark"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['demo:validation:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['demo:validation:remove']"
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

    <!-- 添加或修改验证实例对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" :before-close="handleClose" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="整数大于零" prop="intGreaterThanZero">
          <el-input v-model="form.intGreaterThanZero" placeholder="请输入整数大于零"/>
        </el-form-item>
        <el-form-item label="浮点大于零" prop="floatGreaterThanZero">
          <el-input v-model="form.floatGreaterThanZero" placeholder="请输入浮点大于零"/>
        </el-form-item>
        <el-form-item label="整数" prop="integerNum">
          <el-input v-model="form.integerNum" placeholder="请输入整数"/>
        </el-form-item>
        <el-form-item label="必须浮点" prop="floatNum">
          <el-input v-model="form.floatNum" placeholder="请输入必须浮点"/>
        </el-form-item>
        <el-form-item label="数字" prop="number">
          <el-input v-model="form.number" placeholder="请输入数字"/>
        </el-form-item>
        <el-form-item label="经度" prop="lng">
          <el-input v-model="form.lng" placeholder="请输入经度"/>
        </el-form-item>
        <el-form-item label="纬度" prop="lat">
          <el-input v-model="form.lat"  placeholder="请输入纬度"/>
        </el-form-item>
        <el-form-item label="中文" prop="chinese">
          <el-input v-model="form.chinese" placeholder="请输入中文"/>
        </el-form-item>
        <el-form-item label="英文" prop="english">
          <el-input v-model="form.english" placeholder="请输入英文"/>
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入邮箱"/>
        </el-form-item>
        <el-form-item label="手机号码" prop="phoneNumber">
          <el-input v-model="form.phoneNumber" placeholder="请输入手机号码"/>
        </el-form-item>
        <el-form-item label="邮政编码" prop="zipCode">
          <el-input v-model="form.zipCode" placeholder="请输入邮政编码"/>
        </el-form-item>
        <el-form-item label="身份证" prop="identityCard">
          <el-input v-model="form.identityCard" placeholder="请输入身份证"/>
        </el-form-item>
        <el-form-item label="车牌号" prop="licensePlateNumber">
          <el-input v-model="form.licensePlateNumber" placeholder="请输入车牌号"/>
        </el-form-item>
        <el-form-item label="ip" prop="ip">
          <el-input v-model="form.ip" placeholder="请输入ip"/>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"/>
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
  import {
    listValidation,
    getValidation,
    delValidation,
    addValidation,
    updateValidation,
    exportValidation
  } from "@/api/demo/validation";

  import {
    validateNumber,
  } from "@/utils/validate.js";

  export default {
    name: "Validation",
    components: {},
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
        // 验证实例表格数据
        validationList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          intGreaterThanZero: [
            {
              pattern: /^\+?[1-9][0-9]*$/,
              message: "数值必须是整数大于0",
              trigger: "blur"
            },
            {required: true, message: "不能为空", trigger: "blur"}
          ],
          floatGreaterThanZero: [
            {
              pattern: /^(\d+)(\.\d+)?$/,
              message: "数值必须是浮点大于0",
              trigger: "blur"
            },
            {required: true, message: "不能为空", trigger: "blur"}
          ],
          integerNum: [
            {
              pattern: /^\d+$/,
              message: "数值必须是整数",
              trigger: "blur"
            },
          ],
          floatNum: [
            {
              pattern: /^(-?\d+)(\.\d+)?$/,
              message: "数值必须是浮点",
              trigger: "blur"
            },
          ],
          number: [
            {validator: validateNumber, trigger: "blur"},
            {required: true, message: "不能为空", trigger: "blur"}
          ],
          lng: [
            {
              pattern: /^(\-|\+)?(((\d|[1-9]\d|1[0-7]\d|0{1,3})\.\d{0,17})|(\d|[1-9]\d|1[0-7]\d|0{1,3})|180\.0{0,17}|180)$/,
              message: "经度格式错误",
              trigger: "blur"
            },
          ], lat: [
            {
              pattern: /^(\-|\+)?([0-8]?\d{1}\.\d{0,17}|90\.0{0,17}|[0-8]?\d{1}|90)$/,
              message: "纬度格式错误",
              trigger: "blur"
            },
          ],
          chinese: [
            {
              pattern: /^[\u4e00-\u9fa5]+$/,
              message: "必须是中文",
              trigger: "blur"
            },
          ],
          english: [
            {
              pattern: /^[A-Za-z]+$/,
              message: "必须是英文",
              trigger: "blur"
            },
          ],
          email: [
            { type: "email",message: "email格式错误", trigger: "blur"},
            {required: true, message: "必须浮点不能为空", trigger: "blur"}
          ],
          phoneNumber: [
            {
              pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
              message: "请输入正确的手机号码",
              trigger: "blur"
            }
          ],
          zipCode: [
            {
              pattern: /^[0-9]{6}$/,
              message: "请输入正确的邮编",
              trigger: "blur"
            }
          ],
          identityCard: [
            {
              pattern: /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|30|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}([0-9]|x|X)$/,
              message: "请输入正确的身份证",
              trigger: "blur"
            }
          ],
          licensePlateNumber: [
            {
              pattern: /^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$/,
              message: "请输入正确的车牌号",
              trigger: "blur"
            }
          ],
          ip: [
            {
              pattern: /^(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.)(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.){2}([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))$/,
              message: "请输入正确的IP",
              trigger: "blur"
            }
          ],

        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询验证实例列表 */
      getList() {
        this.loading = true;
        listValidation(this.queryParams).then(response => {
          this.validationList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      },
      // 取消按钮
      cancel() {
        this.open = false;
        this.reset();
      },
      // 表单重置
      reset() {
        this.form = {
          validationId: null,
          intGreaterThanZero: null,
          floatGreaterThanZero: null,
          integerNum: null,
          floatNum: null,
          number: null,
          lng: null,
          lat: null,
          chinese: null,
          english: null,
          email: null,
          phoneNumber: null,
          zipCode: null,
          identityCard: null,
          licensePlateNumber: null,
          ip: null,
          delFlag: null,
          createBy: null,
          createTime: null,
          updateBy: null,
          updateTime: null,
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
        this.ids = selection.map(item => item.validationId)
        this.single = selection.length !== 1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加验证实例";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const validationId = row.validationId || this.ids
        getValidation(validationId).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改验证实例";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.validationId != null) {
              updateValidation(this.form).then(response => {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addValidation(this.form).then(response => {
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
        const validationIds = row.validationId || this.ids;
        this.$confirm('是否确认删除验证实例编号为"' + validationIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function () {
          return delValidation(validationIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
      },
      /** 导出按钮操作 */
      handleExport() {
        const queryParams = this.queryParams;
        this.$confirm('是否确认导出所有验证实例数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function () {
          return exportValidation(queryParams);
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
          .catch(_ => {
          });
      },
    }
  };
</script>
