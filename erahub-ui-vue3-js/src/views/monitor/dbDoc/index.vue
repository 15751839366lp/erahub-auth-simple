<template>
  <div class="app-container">
    <!-- 操作工具栏 -->
    <div class="mb-10px">
      <el-button type="primary" @click="handleExportHtml">
        <Iconify icon="ep:download" class="mr-5px" /> {{ '导出' + ' HTML' }}
      </el-button>
      <el-button type="primary" @click="handleExportWord">
        <Iconify icon="ep:download" class="mr-5px" /> {{ '导出' + ' Word' }}
      </el-button>
      <el-button type="primary" @click="handleExportMarkdown">
        <Iconify icon="ep:download" class="mr-5px" /> {{ '导出' + ' Markdown' }}
      </el-button>
    </div>
    <IFrame v-if="!loding" v-loading="loding" :src="src" />
  </div>
</template>

<script setup>
import IFrame from '@/components/IFrame'
import * as DbDocApi from '@/api/monitor/dbDoc'
import { onMounted, ref } from 'vue'
import download from '@/utils/download'

const loding = ref(true)
const src = ref('')
/** 页面加载 */
const init = async () => {
  const res = await DbDocApi.exportHtmlApi()
  let blob = new Blob([res], { type: 'text/html' })
  let blobUrl = window.URL.createObjectURL(blob)
  src.value = blobUrl
  loding.value = false
}
/** 处理导出 HTML */
const handleExportHtml = async () => {
  const res = await DbDocApi.exportHtmlApi()
  download.html(res, '数据库文档.html')
}
/** 处理导出 Word */
const handleExportWord = async () => {
  const res = await DbDocApi.exportWordApi()
  download.word(res, '数据库文档.doc')
}
/** 处理导出 Markdown */
const handleExportMarkdown = async () => {
  const res = await DbDocApi.exportMarkdownApi()
  download.markdown(res, '数据库文档.md')
}
onMounted(async () => {
  await init()
})
</script>

<style lang="scss" scoped>
.mr-5px {
  margin-right: 5px;
}
.mb-10px {
  margin-bottom: 10px;
}
</style>
