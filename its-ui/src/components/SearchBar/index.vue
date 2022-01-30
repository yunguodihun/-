
<template>
  <div class="k-search-sub">
    <el-form :inline="true" :model="seachData" class="demo-form-inline">
      <!-- Input 输入框 -->
      <el-form-item :label="item.title" v-for="(item, index) in inputs" :key="item.model+''+index">
        <el-input
          :style="{width:item.width+'px'}"
          v-model.trim="seachData.input[item.model]"
          :placeholder="item.placeholder?item.placeholder:''"
          @input="seachData.input[item.model]=$limit200and400(200,seachData.input[item.model])"
        ></el-input>
      </el-form-item>

      <!--  select  选择框 -->
      <el-form-item :label="item.title" v-for="(item, index) in selects" :key="item.model+''+index">
        <slot v-if="item.slot" :name="item.slot"></slot>
        <el-select
          v-else
          :style="{width:item.width+'px'}"
          :disabled="item.disabled"
          :filterable="item.filterable"
          :clearable="typeof(item.clearable) == 'undefined'?true:item.clearable"
          v-model.trim="seachData.select[item.model]"
          :placeholder="item.placeholder?item.placeholder:''"
          @change="item.change?item.change($event):undefined"
          @clear="item.clear?item.clear():undefined"
        >
          <el-option
            v-for="(option, index) in item.options"
            :key="option.label+''+index"
            :label="option.label"
            :value="option.value"
            :disabled="option.disabled"
          ></el-option>
        </el-select>
      </el-form-item>

      <!-- dateTime  起始时间选择器 -->
      <el-form-item :label="date.label" v-if="date.label">
        <el-date-picker
          v-model="seachData.date[date.model]"
          :type="date.type?date.type:'daterange'"
          :value-format="date.format?date.format:'yyyy-MM-dd'"
          range-separator="至"
          start-placeholder=" "
          end-placeholder="  "
          :style="{width:date.width+'px'}"
        ></el-date-picker>
      </el-form-item>

      <!-- button  查询 && 重置 -->
      <el-form-item>
        <el-button
          :type="button.type?button.type:'primary'"
          :plain="button.plain"
          :round="button.round"
          :circle="button.circle"
          :disabled="button.disabled"
          icon="el-icon-search"
          @click="search"
        >查询</el-button>
        <el-button @click="onReset" icon="el-icon-refresh">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
  export default {
    name: "SearchBar",
    props: {
      inputs: {
        default: () => {
          return new Array();
        },
      },
      selects: {
        default: () => {
          return new Array();
        },
      },
      button: {
        default: () => {
          return new Object();
        },
      },
      date: {
        default: () => {
          return new Object();
        },
      },
    },
    data() {
      return {
        seachData: {
          input: {},
          select: {},
          date: {},
        },
      };
    },
    mounted() {
      this.clearData();
    },
    methods: {
      changeInput(key, value) {
      },
      /**
       * 查询
       */
      search() {
        let searchObj = {};
        if (this.inputs.length != 0) {
          this.inputs.map((el) => {
            searchObj[el.model] = this.seachData.input[el.model] || "";
          });
        }
        if (this.selects.length != 0) {
          this.selects.map((el) => {
            searchObj[el.model] = this.seachData.select[el.model] || "";
          });
        }
        if (this.date.label) {
          searchObj[this.date.model] = this.seachData.date[this.date.model] || [];
        }
        this.$emit("search", searchObj);
      },
      /**
       * 重置
       */
      onReset() {
        let searchObj = {};
        if (this.inputs.length != 0) {
          this.inputs.map((el) => {
            searchObj[el.model] = "";
            this.$set(this.seachData.input, el.model, "");
          });
        }
        if (this.selects.length != 0) {
          this.selects.map((el) => {
            searchObj[el.model] = "";
            this.$set(this.seachData.select, el.model, "");
          });
        }
        if (this.date.label) {
          searchObj[this.date.model] = [];
          this.$set(this.seachData.date, el.model, []);
        }
        this.$emit("onReset", searchObj);
      },
      clearData() {
        if (this.inputs.length != 0) {
          this.inputs.map((el) => {
            this.$set(this.seachData.input, el.model, "");
          });
        }
        if (this.selects.length != 0) {
          this.selects.map((el) => {
            this.$set(this.seachData.select, el.model, "");
          });
        }
        if (this.date.label) {
          this.$set(this.seachData.date, el.model, []);
        }
      },
    },
  };
</script>
<style scoped lang="scss">
  // 搜索框 头部
  .k-search-sub{
    // padding: 10px 0 20px 0;
    margin-top: 10px;
    .el-form{
      .el-form-item{
        height: 30px;
        line-height: 30px;
        .el-form-item__label{
          height: 30px;
          line-height: 30px;
        }
        .el-input__inner{
          width: 150px;
        }
        .el-range-editor{
          width: 304px;
          .el-range-separator{
            width: 6%;
            padding: 0px 2px;
          }
        }
        .el-form-item__content{
          height: 30px;
          line-height: 30px;
          .el-date-editor {
            display: inline-block !important;
            vertical-align: middle;
            line-height: 24px;
            .el-range__icon{
              line-height: 22px;
            }
            .el-range-separator{
              line-height: 22px;

            }
          }
          .el-select{
            // height: 30px;
            // line-height: 30px;

          }
        }
      }
      .right_btn{
        float: right;
        margin-right: 0px;
        // margin-top: 5px;
      }
    }
  }

</style>
