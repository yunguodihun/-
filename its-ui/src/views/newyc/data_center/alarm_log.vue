<template>
  <div class="app-container">
    <el-form :inline="true" label-width="68px">
      <el-form-item label="企业名称">
        <el-select placeholder="企业名称" clearable size="small">
          <el-option />
        </el-select>
      </el-form-item>
      <el-form-item label="开始时间">
        <el-date-picker
          clearable
          size="small"
          style="width: 200px"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="开始时间"
        />
      </el-form-item>
      <el-form-item label="结束时间">
        <el-date-picker
          clearable
          size="small"
          style="width: 200px"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="结束时间"
        />
      </el-form-item>

      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini">重置</el-button>
      </el-form-item>
    </el-form>

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
          name: '企业名称'
        },
        {
          name: '警报时间'
        },
        {
          name: 'TSP'
        },
        {
          name: 'PM2.5'
        },
        {
          name: 'PM10'
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

<style >

</style>
