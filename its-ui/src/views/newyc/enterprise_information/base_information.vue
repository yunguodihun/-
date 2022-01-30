<template>
  <div class="app-container">
    <el-form :inline="true" label-width="100px">
      <el-row>
        <el-form-item label="企业名称">
          <el-input
            placeholder="请输入企业名称"
            clearable
            size="small"
          />
        </el-form-item>
        <el-form-item label="许可证号">
          <el-input
            placeholder="请输入许可证号"
            clearable
            size="small"
          />
        </el-form-item>
        <el-form-item label="发证日期从">
          <el-date-picker
            clearable
            size="small"
            style="width: 200px"
            type="date"
            value-format="yyyy-MM-dd"
          />
        </el-form-item>
        <el-form-item label="到">
          <el-date-picker
            clearable
            size="small"
            style="width: 200px"
            type="date"
            value-format="yyyy-MM-dd"
          />
        </el-form-item>
      </el-row>
      <el-row>
        <el-form-item label="企业性质">
          <el-input
            placeholder="请输入企业性质"
            clearable
            size="small"
          />
        </el-form-item>
        <el-form-item label="经营业务种类">
          <el-input
            placeholder="请输入经营业务种类"
            clearable
            size="small"
          />
        </el-form-item>
        <el-form-item label="经营区域">
          <el-input
            placeholder="请输入经营区域"
            clearable
            size="small"
          />
        </el-form-item>
        <el-form-item label="主营货种">
          <el-input
            placeholder="请输入主营货种"
            clearable
            size="small"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="cyan" icon="el-icon-search" size="mini">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini">重置</el-button>
        </el-form-item>
      </el-row>

    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :show-search.sync="showSearch" :columns="columns" @queryTable="getList" />
    </el-row>

    <el-table>
      <el-table-column type="selection" width="55" align="center" />
      <div v-for="(item,index) in receiveList" :key="index">
        <el-table-column :label="item.name" />
      </div>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-search"
          >查看
          </el-button>
          <el-button

            size="mini"
            type="text"
            icon="el-icon-edit"
          >修改
          </el-button>
          <el-button

            size="mini"
            type="text"
            icon="el-icon-delete"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

  </div>
</template>

<script>
export default {
  name: 'PollutantReceivingDevice',
  data() {
    return {
      receiveList: [
        {
          name: '单位名称'
        },
        {
          name: '单位地址'
        },
        {
          name: '许可证号'
        },
        {
          name: '有效期'
        },
        {
          name: '法人代表'
        },
        {
          name: '联系电话'
        },
        {
          name: '泊位数（个）'
        },
        {
          name: '停靠能力（吨）'
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

<style>

</style>
