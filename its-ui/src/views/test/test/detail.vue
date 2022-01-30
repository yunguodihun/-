<template>
    <my-detail :column="2" border size="small" >
        <my-detail-item v-for="(col,index) in dynamicTableDataDetailColumns" :key="index" :label="col.dataName" :label-style="{width:'15%'}" :content-style="{width:'35%'}">
            <span v-if="col.dataItem === 'createTime'">
                {{ parseTime( form[col.dataItem]) }}
            </span>
            <span v-else>
                {{ form[col.dataItem] }}
            </span>
        </my-detail-item>
    </my-detail>
</template>

<script>
    import {MyDetail, MyDetailItem} from '$ui'
    import { getTest } from "@/api/test/test";
                                                                                                                                                                                                                                                                                                                                                                                        
    export default {
        name: "TestDetail",
        props: {
        id:{
                type: Number ,
                required: true
            },
            dynamicTableDataDetailColumns: {
                type: Array,
                default: () => []
            },
        },
        watch:{     //监听value的变化，进行相应的操作即可
            id: function(a,b){     //a是value的新值，b是旧值
                this.id=a;
                this.loadInfo();
            }
        },
        components: {
                MyDetail,
                MyDetailItem,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        },
        data() {
            return {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        // 表单参数
            form: {},
        };
        },
        created() {
            this.loadInfo();
                                                                                                                                                                                                                                                                                },
        methods: {
                                                                                                                                                                                                                                                                                    // 表单重置
            reset() {
                this.form = {
                                                            id: null,
                                                                                name: null,
                                                                                sex: null,
                                                                                birthday: null,
                                                                                delFlag: null,
                                                                                createBy: null,
                                                                                createTime: null,
                                                                                updateBy: null,
                                                                                updateTime: null
                                                };
                this.resetForm("form");
            },

            /** 加载数据 */
            loadInfo() {
                this.reset();
                getTest(this.id).then(response => {
                    this.form = response.data;
                });
            }
        }
    };
</script>
