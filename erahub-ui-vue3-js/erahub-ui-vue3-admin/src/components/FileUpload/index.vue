<template>
  <div class="upload-file">
    <el-upload
      multiple
      :action="uploadFileUrl"
      :before-upload="handleBeforeUpload"
      :file-list="fileList"
      :limit="limit"
      :on-error="handleUploadError"
      :on-exceed="handleExceed"
      :on-success="handleUploadSuccess"
      :show-file-list="false"
      :headers="headers"
      class="upload-file-uploader"
      ref="fileUpload"
    >
      <!-- 上传按钮 -->
      <el-button type="primary">选取文件</el-button>
    </el-upload>
    <!-- 上传提示 -->
    <div class="el-upload__tip" v-if="showTip">
      请上传
      <template v-if="fileSize">
        大小不超过 <b style="color: #f56c6c">{{ fileSize }}MB</b>
      </template>
      <template v-if="fileType">
        格式为 <b style="color: #f56c6c">{{ fileType.join('/') }}</b>
      </template>
      的文件
    </div>
    <!-- 文件列表 -->
    <transition-group
      class="upload-file-list el-upload-list el-upload-list--text"
      name="el-fade-in-linear"
      tag="ul"
    >
      <li
      :key="index"
        class="el-upload-list__item ele-upload-list__item-content"
        v-for="(file, index) in fileList"
      >
        <span class="el-icon-document"> {{ getFileName(file.name) }} </span>
        <div class="ele-upload-list__item-content-action">
          <el-link :underline="false" @click="handleDelete(index)" type="danger">删除</el-link>
        </div>
      </li>
    </transition-group>
  </div>
</template>

<script setup>
import { getToken } from '@/utils/auth'
import { delTempFiles } from '@/api/basicservice/oss'

const props = defineProps({
  modelValue: [String, Object, Array],
  // 数量限制
  limit: {
    type: Number,
    default: 5
  },
  // 大小限制(MB)
  fileSize: {
    type: Number,
    default: 30
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
  }
})

const { proxy } = getCurrentInstance()
const emit = defineEmits()
const number = ref(0)
const uploadList = ref([])
const baseUrl = import.meta.env.VITE_APP_BASE_API
const uploadFileUrl = ref(baseUrl + '/basicservice/oss/upload') // 上传的文件服务器地址
const headers = ref({ Authorization: 'Bearer ' + getToken() })
const fileList = ref([])
const showTip = computed(() => props.isShowTip && (props.fileType || props.fileSize))

watch(
  () => props.modelValue,
  async (val) => {
    if (val) {

      uploadList.value = val
      // 首先将值转为数组
      let list
      if (Array.isArray(val)) {
        list = val
      } else if (val != null && val != undefined) {
        list = [val]
      }
      
      // 然后将数组转为对象数组
      fileList.value = list.map((item) => {
        // 此处name使用ossId 防止删除出现重名
        item = { name: item.originalName, fileName: item.fileName }
        return item
      })
    } else {
      fileList.value = []
      uploadList.value = []
      return []
    }
  },
  { deep: true, immediate: true }
)

// 上传前校检格式和大小
function handleBeforeUpload(file) {
  // 校检文件类型
  if (props.fileType.length) {
    const fileName = file.name.split('.');
    const fileExt = fileName[fileName.length - 1];
    const isTypeOk = props.fileType.indexOf(fileExt) >= 0;
    if (!isTypeOk) {
      proxy.$modal.msgError(`文件格式不正确, 请上传${props.fileType.join('/')}格式文件!`)
      return false
    }
  }
  // 校检文件大小
  if (props.fileSize) {
    const isLt = file.size / 1024 / 1024 < props.fileSize
    if (!isLt) {
      proxy.$modal.msgError(`上传文件大小不能超过 ${props.fileSize} MB!`)
      return false
    }
  }
  proxy.$modal.loading('正在上传文件，请稍候...')
  number.value++
  return true
}

// 文件个数超出
function handleExceed() {
  proxy.$modal.msgError(`上传文件数量不能超过 ${props.limit} 个!`)
}

// 上传失败
function handleUploadError(err) {
  proxy.$modal.msgError('上传文件失败')
}

// 上传成功回调
function handleUploadSuccess(res, file) {
  if (res.code === 200) {
    uploadList.value.push(res.data)
    uploadedSuccessfully()
  } else {
    number.value--
    proxy.$modal.closeLoading()
    proxy.$modal.msgError(res.msg)
    proxy.$refs.fileUpload.handleRemove(file)
    uploadedSuccessfully()
  }
}

// 删除文件
function handleDelete(index) {
  let fileName = fileList.value[index].fileName
  const uindex = uploadList.value.map((f) => f.fileName).indexOf(fileName)
  if (uindex > -1) {
    delTempFiles(fileName)
    fileList.value.splice(index, 1)
    uploadList.value.splice(uindex, 1)
    emit('update:modelValue', uploadList.value)
    return false
  }
}

// 上传结束处理
function uploadedSuccessfully() {
  if (number.value > 0) {
    fileList.value = uploadList.value.map((item) => {
      item = { name: item.fileName, fileName: item.fileName }
      return item
    })
    // fileList.value = fileList.value.filter((f) => f.url !== undefined).concat(uploadList.value)
    // uploadList.value = []
    number.value = 0
    emit('update:modelValue', uploadList.value)
  }
  proxy.$modal.closeLoading()
}

// 获取文件名称
function getFileName(name) {
  // 如果是url那么取最后的名字 如果不是直接返回
  if (name.lastIndexOf('/') > -1) {
    return name.slice(name.lastIndexOf('/') + 1)
  } else {
    return name
  }
}

// 对象转成指定字符串分隔
function listToString(list, separator) {
  let strs = ''
  separator = separator || ','
  for (let i in list) {
    if (list[i].ossId) {
      strs += list[i].ossId + separator
    }
  }
  return strs != '' ? strs.substr(0, strs.length - 1) : ''
}
</script>

<style scoped lang="scss">
.upload-file-uploader {
  margin-bottom: 5px;
}

.upload-file-list .el-upload-list__item {
  position: relative;
  margin-bottom: 10px;
  line-height: 2;
  border: 1px solid #e4e7ed;
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
</style>
