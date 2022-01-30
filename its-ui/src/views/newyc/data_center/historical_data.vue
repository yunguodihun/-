<template>
  <div class="app-container">
    <el-form :inline="true" label-width="68px">
      <el-form-item>
        <el-select v-model="selectedValue" clearable size="small">
          <el-option
            v-for="item in nodeList"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
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

    <el-container>
      <el-aside style="width: 80%;">
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
      </el-aside>
      <el-main style="border: 1px solid #1ab394;">
        <span>企业列表</span>
        <hr style="background-color: #1ab394">
      </el-main>
    </el-container>

  </div>
</template>

<script>
export default {
  name: 'PollutantReceivingDevice',
  data() {
    return {
      selectedValue: 'PM',
      nodeList: [
        {
          value: 'PM',
          label: 'PM'
        },
        {
          value: '噪音',
          label: '噪音'
        },
        {
          value: '温湿度',
          label: '温湿度'
        },
        {
          value: '风速/风向',
          label: '风速/风向'
        },
        {
          value: 'TSP',
          label: 'TSP'
        },
        {
          value: '大气压力',
          label: '大气压力'
        }
      ],
      receiveList: [
        {
          name: '节点名称'
        },
        {
          name: 'PM2.5(mg/m³)'
        },
        {
          name: 'PM10(mg/m³)'
        },
        {
          name: '记录时间'
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

