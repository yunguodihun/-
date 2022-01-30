<template>
  <div class="upload-file">
    <el-form-item label="附件">
      <el-upload
        ref="upload"
        :action="uploadFileUrl"
        :before-upload="handleBeforeUpload"
        :file-list="fileList"
        :limit="limitFileNumber"
        :on-error="handleUploadError"
        :on-exceed="handleExceed"
        :on-success="handleUploadSuccess"
        :show-file-list="false"
        :headers="headers"
        class="upload-file-uploader"
        :class="{hide:hideUpload}"
      >
        <!-- 上传按钮 -->
        <el-button size="mini" type="primary">选取文件</el-button>
        <!-- 上传提示 -->
        <span v-if="showTip" slot="tip" class="el-upload__tip">
          请上传
          <template v-if="fileSize"> 大小不超过 <b style="color: #f56c6c">{{ fileSize }}MB</b> </template>
          <template v-if="fileType"> 格式为 <b style="color: #f56c6c">{{ fileType.join("/") }}</b> </template>
          的文件
        </span>
      </el-upload>

      <!-- 图片预览 -->
      <el-dialog title="图片预览" :visible.sync="previewVisible" width="80%" height="100%" append-to-body>
        <img :src="previewPath" alt="" style="display: block;max-width: 100%; margin: 0 auto;">
      </el-dialog>
      <div>

        <!-- 文件列表 -->
        <el-table :data="fileList" type="“index”" border stripe style="width: 100%">
          <el-table-column prop="name" label="文件名称" />
          <el-table-column label="操作">
            <template slot-scope="scope">
              <el-button size="small" type="primary" plain>
                <a :href="scope.row.url">下载</a>
              </el-button>
              <el-button size="small" type="danger" plain @click="handleDelete(scope.$index,scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>

        <!--        <transition-group class="upload-file-list el-upload-list el-upload-list&#45;&#45;text" name="el-fade-in-linear" tag="ul">
          <li :key="file.uid" class="el-upload-list__item ele-upload-list__item-content" v-for="(file, index) in list">
            <el-link :href="file.url" :underline="false" target="_blank">
              <span class="el-icon-document"> {{ getFileName(file.name) }} </span>
            </el-link>
            <div class="ele-upload-list__item-content-action">
              <el-link :underline="false" @click="handleDelete(file)" type="danger" plain>删除</el-link>
            </div>
          </li>
        </transition-group>-->
      </div>

    </el-form-item>
  </div>
</template>

<script>
import { getToken } from '@/utils/auth'
import { checkNull } from '@/utils/base'
export default {
  props: {
    // 值
    value: [String, Object, Array],
    // 大小限制(MB)
    fileSize: {
      type: Number,
      default: 5
    },
    // 文件类型, 例如['png', 'jpg', 'jpeg']
    fileType: {
      type: Array,
      default: () => ['doc', 'xls', 'ppt', 'txt', 'pdf']
    },
    // 是否显示提示
    isShowTip: {
      type: Boolean,
      default: true
    },
    searchId: {
      type: Number,
      default: 0
    },
    hideUpload: {
      type: Boolean,
      default: true
    }
  },
  data() {
    return {
      uploadFileUrl: process.env.VUE_APP_BASE_API + '/common/upload', // 上传的图片服务器地址
      headers: {
        Authorization: 'Bearer ' + getToken()
      },
      fileList: [],
      // 上传的文件限制个数
      limitFileNumber: 10,
      previewPath: '', // 预览路径
      previewVisible: false, // 预览弹框
      queryParamsFile: {
        pageNum: 1,
        pageSize: 20,
        searchId: undefined
      }
    }
  },
  computed: {
    // 是否显示提示
    showTip() {
      return this.isShowTip && (this.fileType || this.fileSize)
    },
    // 列表
    list() {
      console.log('列表...')
      let temp = 1
      // 首先将值转为数组
      const list = Array.isArray(this.fileList) ? this.fileList : [this.fileList]
      // console.log("list:"+JSON.stringify(list));
      // 然后将数组转为对象数组
      return list.map((item) => {
        if (typeof item === 'string') {
          item = { name: item, url: item }
        }
        item.uid = item.uid || new Date().getTime() + temp++
        // console.log("item："+JSON.stringify(item));
        return item
      })
    }
  },
  created() {
    this.fileList = this.list
    console.log('created>>>>' + JSON.stringify(this.fileList))
  },
  methods: {
    // 上传前校检格式和大小
    handleBeforeUpload(file) {
      // 校检文件类型
      if (this.fileType) {
        let fileExtension = ''
        if (file.name.lastIndexOf('.') > -1) {
          fileExtension = file.name.slice(file.name.lastIndexOf('.') + 1)
        }
        const isTypeOk = this.fileType.some((type) => {
          if (file.type.indexOf(type) > -1) return true
          if (fileExtension && fileExtension.indexOf(type) > -1) return true
          return false
        })
        if (!isTypeOk) {
          this.$message.error(`文件格式不正确, 请上传${this.fileType.join('/')}格式文件!`)
          return false
        }
      }
      // 校检文件大小
      if (this.fileSize) {
        const isLt = file.size / 1024 / 1024 < this.fileSize
        if (!isLt) {
          this.$message.error(`上传文件大小不能超过 ${this.fileSize} MB!`)
          return false
        }
      }
      return true
    },
    // 文件个数超出
    handleExceed() {
      this.$message.error(`只允许上传${this.limitFileNumber}个文件`)
    },
    // 上传失败
    handleUploadError() {
      this.$message.error('上传失败, 请重试')
    },
    // 上传成功回调
    handleUploadSuccess(res, file) {
      this.$message.success('上传成功')
      console.log('handleUploadSuccess>>')
      // console.log("handleUploadSuccess:"+JSON.stringify(file));
      this.fileList.push({ name: file.name, url: res.url, size: file.size })
      this.$emit('input', this.fileList)
      this.$emit('updateInput', { name: file.name, url: res.url, size: file.size })
    },
    // 删除文件
    handleDelete(index, file) {
      this.$confirm('是否确认删除该文件?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log('file:' + JSON.stringify(file))
        this.fileList.splice(index, 1)
        this.$emit('deleteInput', file)
        this.msgSuccess('删除成功')
      }).catch(function() {
      })
    },
    handlePreview(fileUrl) {
      this.previewPath = fileUrl
      this.previewVisible = true
    },
    clearFiles() {
      this.$refs.upload.clearFiles()
      this.fileList = []
    },
    // 获取文件名称
    getFileName(name) {
      if (!checkNull(name)) {
        return name
      } else {
        return ''
      }
    },
    // 获取文件名称
    getCutFileName(name) {
      if (name.lastIndexOf('/') > -1) {
        return name.slice(name.lastIndexOf('/') + 1).toLowerCase()
      } else {
        return ''
      }
    },
    pushFiles(fileList) {
      this.fileList = []
      this.fileList = fileList
      console.log('pushFIles>>>>' + JSON.stringify(this.fileList))
    }
  }
}

</script>

<style scoped lang="scss">
  .upload-file-uploader {
    margin-bottom: 5px;
  }
  .upload-file-list .el-upload-list__item {
    border: 1px solid #e4e7ed;
    line-height: 2;
    margin-bottom: 10px;
    position: relative;
  }
  .upload-file-list .ele-upload-list__item-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: inherit;
  }
  .ele-upload-list__item-content-action .el-link {
    margin-right: 10px;
  }

  .el-upload__tip {
    padding-left: 10px;
  }
</style>
