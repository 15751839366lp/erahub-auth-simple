<template>
  <div class="component-upload-image">
    <!-- todo 文件分类上传 -->
    <!-- <el-select
               placeholder="图片类别"
               clearable
               style="width: 240px"
            >
               <el-option
                  key="dict.value"
                  label="dict.label"
                  value="dict.value"
               />
            </el-select> -->
    <el-upload
      multiple
      :action="uploadImgUrl"
      list-type="picture-card"
      :on-success="handleUploadSuccess"
      :before-upload="handleBeforeUpload"
      :limit="limit"
      :on-error="handleUploadError"
      :on-exceed="handleExceed"
      ref="imageUpload"
      :before-remove="handleDelete"
      :show-file-list="true"
      :headers="headers"
      :file-list="fileList"
      :on-preview="handlePictureCardPreview"
      :class="{ hide: fileList.length >= limit }"
    >
      <el-icon class="avatar-uploader-icon"><plus /></el-icon>
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

    <el-dialog v-model="dialogVisible" title="预览" width="800px" append-to-body>
      <img :src="dialogImageUrl" style="display: block; max-width: 100%; margin: 0 auto" />
    </el-dialog>
  </div>
</template>

<script setup>
import { getToken } from '@/utils/auth'
import { delTempFiles } from '@/api/basicservice/oss'

const props = defineProps({
  modelValue: [String, Object, Array],
  // 图片数量限制
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
    default: () => ['png', 'jpg', 'jpeg']
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
const dialogImageUrl = ref('')
const dialogVisible = ref(false)
const baseUrl = import.meta.env.VITE_APP_BASE_API
const uploadImgUrl = ref(baseUrl + '/basicservice/oss/upload') // 上传的图片服务器地址
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
        item = { name: item.fileName, url: item.blobUrl }
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

// 上传前loading加载
function handleBeforeUpload(file) {
  let isImg = false
  if (props.fileType.length) {
    let fileExtension = ''
    if (file.name.lastIndexOf('.') > -1) {
      fileExtension = file.name.slice(file.name.lastIndexOf('.') + 1)
    }
    isImg = props.fileType.some((type) => {
      if (file.type.indexOf(type) > -1) return true
      if (fileExtension && fileExtension.indexOf(type) > -1) return true
      return false
    })
  } else {
    isImg = file.type.indexOf('image') > -1
  }
  if (!isImg) {
    proxy.$modal.msgError(`文件格式不正确, 请上传${props.fileType.join('/')}图片格式文件!`)
    return false
  }
  if (props.fileSize) {
    const isLt = file.size / 1024 / 1024 < props.fileSize
    if (!isLt) {
      proxy.$modal.msgError(`上传头像图片大小不能超过 ${props.fileSize} MB!`)
      return false
    }
  }
  proxy.$modal.loading('正在上传图片，请稍候...')
  number.value++
}

// 文件个数超出
function handleExceed() {
  proxy.$modal.msgError(`上传文件数量不能超过 ${props.limit} 个!`)
}

// 上传成功回调
function handleUploadSuccess(res, file) {
  if (res.code === 200) {
    res.data.blobUrl = file.url
    uploadList.value.push(res.data)
    uploadedSuccessfully()
  } else {
    number.value--
    proxy.$modal.closeLoading()
    proxy.$modal.msgError(res.msg)
    proxy.$refs.imageUpload.handleRemove(file)
    uploadedSuccessfully()
  }
}

// 删除图片
function handleDelete(file) {
  const findex = fileList.value.map((f) => f.name).indexOf(file.name)
  const uindex = uploadList.value.map((f) => f.fileName).indexOf(file.name)
  if (findex > -1 && uindex > -1) {
    let fileName = fileList.value[findex].name
    delTempFiles(fileName)
    fileList.value.splice(findex, 1)
    uploadList.value.splice(uindex, 1)
    emit('update:modelValue', uploadList.value)
    return false
  }
}

// 上传结束处理
function uploadedSuccessfully() {
  if (number.value > 0) {

    fileList.value = uploadList.value.map((item) => {
      item = { name: item.fileName, url: item.blobUrl }
      return item
    })
    // fileList.value = fileList.value.filter((f) => f.url !== undefined).concat(uploadList.value)
    // uploadList.value = []
    number.value = 0
    emit('update:modelValue', uploadList.value)
  }
  proxy.$modal.closeLoading()
}

// 上传失败
function handleUploadError(res) {
  proxy.$modal.msgError('上传图片失败')
  proxy.$modal.closeLoading()
}

// 预览
function handlePictureCardPreview(file) {
  dialogImageUrl.value = file.url
  dialogVisible.value = true
}

// 对象转成指定字符串分隔
function listToString(list, separator) {
  let strs = ''
  separator = separator || ','

  for (let i in list) {
    strs += list[i].fileName + separator
  }
  return strs.substr(0, strs.length - 1)
}
</script>

<style scoped lang="scss">
// .el-upload--picture-card 控制加号部分
:deep(.hide .el-upload--picture-card) {
  display: none;
}
</style>
