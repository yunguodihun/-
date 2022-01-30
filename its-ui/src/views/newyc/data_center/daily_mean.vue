<template>
  <div class="app-container">
    <!--<el-row :gutter="20" class="mb8">-->
    <!--<el-col :span="1.5">-->
    <!--<el-button type="primary" icon="el-icon-plus" size="mini">新增</el-button>-->
    <!--</el-col>-->
    <!--<el-col :span="1.5">-->
    <!--<el-button type="success" icon="el-icon-edit" size="mini">修改</el-button>-->
    <!--</el-col>-->
    <!--<el-col :span="1.5">-->
    <!--<el-button type="danger" icon="el-icon-delete" size="mini">删除</el-button>-->
    <!--</el-col>-->
    <!--<el-col :span="1.5">-->
    <!--<el-button type="warning" icon="el-icon-download" size="mini">导出</el-button>-->
    <!--</el-col>-->
    <!--</el-row>-->
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
      receiveList: [
        {
          name: '数据时间'
        },
        {
          name: 'PM2.5(mg/m³)'
        },
        {
          name: 'PM10(mg/m³)'
        },
        {
          name: 'TSP(mg/m³)'
        },
        {
          name: '温度(℃)'
        },
        {
          name: '湿度(%RH)'
        },
        {
          name: '噪音(dB)'
        },
        {
          name: '风速(m/s)'
        },
        {
          name: '气压(kPa)'
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

