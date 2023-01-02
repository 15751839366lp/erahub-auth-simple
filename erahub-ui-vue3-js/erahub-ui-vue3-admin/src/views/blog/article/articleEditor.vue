<template>
  <el-card class="main-card">
    <div class="title">文章编辑</div>
    <div class="article-title-container">
      <el-input v-model="article.articleTitle" size="default" placeholder="输入文章标题" />
      <el-button type="danger" size="default" @click="openModel" style="margin-left: 10px">
        发布文章
      </el-button>
    </div>
    <mavon-editor
      ref="md"
      v-model="article.articleContent"
      @imgAdd="uploadImg"
      style="height: calc(100vh - 260px)"
    />
    <el-dialog :title="'发布文章'" v-model="addOrEdit" width="40%" top="3vh">
      <el-form label-width="80px" size="default" :model="article">
        <el-form-item label="分类">
          <el-select v-model="article.categoryId" placeholder="请选择分类">
            <el-option
              v-for="item in categoryList"
              :key="item.categoryId"
              :label="item.categoryName"
              :value="item.categoryId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="标签">
          <el-select v-model="article.tagIds" multiple placeholder="请选择标签">
            <el-option
              v-for="item in tagList"
              :key="item.tagId"
              :label="item.tagName"
              :value="item.tagId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="文章类型" prop="type">
          <el-select v-model="article.type" placeholder="请选择文章类型">
            <el-option
              v-for="dict in blog_article_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="原文地址" v-if="article.type != 1">
          <el-input v-model="article.originalUrl" placeholder="请填写原文链接" />
        </el-form-item>
        <el-form-item label="上传封面">
          <el-upload
            class="upload-cover"
            drag
            action="/api/admin/articles/images"
            multiple
            :before-upload="beforeUpload"
            :on-success="uploadCover"
          >
            <i class="el-icon-upload" v-if="article.articleCover == ''" />
            <div class="el-upload__text" v-if="article.articleCover == ''"
              >将文件拖到此处，或<em>点击上传</em></div
            >
            <img v-else :src="article.articleCover" width="360px" height="180px" />
          </el-upload>
        </el-form-item>
        <el-form-item label="置顶">
          <el-radio-group v-model="article.isTop">
            <el-radio v-for="dict in blog_article_top" :key="dict.value" :label="dict.value">{{
              dict.label
            }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="推荐">
          <el-radio-group v-model="article.isFeatured">
            <el-radio v-for="dict in blog_article_featured" :key="dict.value" :label="dict.value">{{
              dict.label
            }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="article.status">
            <el-radio v-for="dict in blog_article_status" :key="dict.value" :label="dict.value">{{
              dict.label
            }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="访问密码" v-if="article.status == 2">
          <el-input v-model="article.password" placeholder="请填写文章访问密码" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="saveOrUpdateArticle"
            >发 表</el-button
          >
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </el-card>
</template>

<script setup name="ArticleEditor">
import { listArticle, getArticle, delArticle, addArticle, updateArticle } from '@/api/blog/article'
import { listTag } from '@/api/blog/tag'
import { listCategory } from '@/api/blog/category'

const { proxy } = getCurrentInstance()
const { blog_article_top, blog_article_featured, blog_article_status, blog_article_type } =
  proxy.useDict(
    'blog_article_top',
    'blog_article_featured',
    'blog_article_status',
    'blog_article_type'
  )

const route = useRoute()
const buttonLoading = ref(false)
const addOrEdit = ref(false)
const autoSave = ref(true)
const categoryName = ref('')
const tagName = ref('')
const categoryList = ref([])
const tagList = ref([])

const typeList = ref([
  {
    type: 1,
    desc: '原创'
  },
  {
    type: 2,
    desc: '转载'
  },
  {
    type: 3,
    desc: '翻译'
  }
])

const article = ref({
  id: null,
  articleTitle: null,
  articleContent: '',
  articleCover: '',
  categoryId: null,
  tagIds: [],
  isTop: '0',
  isFeatured: '0',
  type: '1',
  status: '1'
})

function listCategories() {
  listCategory().then((response) => {
    categoryList.value = response.rows
  })
}

function listTags() {
  listTag().then((response) => {
    tagList.value = response.rows
  })
}

function openModel() {
  // if (this.article.articleTitle.trim() == '') {
  //   this.$message.error('文章标题不能为空')
  //   return false
  // }
  // if (this.article.articleContent.trim() == '') {
  //   this.$message.error('文章内容不能为空')
  //   return false
  // }
  // this.listCategories()
  // this.listTags()
  addOrEdit.value = true
}

function getTempArticle(id) {
  if (id != 0) {
    getArticle(id).then((response) => {
      article.value = response.data
    })
  }
}

function uploadCover(response) {
  // this.article.articleCover = response.data
}
function beforeUpload(file) {
  // return new Promise((resolve) => {
  //   if (file.size / 1024 < this.config.UPLOAD_SIZE) {
  //     resolve(file)
  //   }
  //   imageConversion.compressAccurately(file, this.config.UPLOAD_SIZE).then((res) => {
  //     resolve(res)
  //   })
  // })
}
function uploadImg(pos, file) {
  // var formdata = new FormData()
  // if (file.size / 1024 < this.config.UPLOAD_SIZE) {
  //   formdata.append('file', file)
  //   this.axios.post('/api/admin/articles/images', formdata).then(({ data }) => {
  //     this.$refs.md.$img2Url(pos, data.data)
  //   })
  // } else {
  //   imageConversion.compressAccurately(file, this.config.UPLOAD_SIZE).then((res) => {
  //     formdata.append('file', new window.File([res], file.name, { type: file.type }))
  //     this.axios.post('/api/admin/articles/images', formdata).then(({ data }) => {
  //       this.$refs.md.$img2Url(pos, data.data)
  //     })
  //   })
  // }
}

function saveOrUpdateArticle() {
  // if (this.article.articleTitle.trim() == '') {
  //   this.$message.error('文章标题不能为空')
  //   return false
  // }
  // if (this.article.articleContent.trim() == '') {
  //   this.$message.error('文章内容不能为空')
  //   return false
  // }
  // if (this.article.categoryName == null) {
  //   this.$message.error('文章分类不能为空')
  //   return false
  // }
  // if (this.article.tagNames.length == 0) {
  //   this.$message.error('文章标签不能为空')
  //   return false
  // }
  // if (this.article.articleCover.trim() == '') {
  //   this.$message.error('文章封面不能为空')
  //   return false
  // }
  // this.axios.post('/api/admin/articles', this.article).then(({ data }) => {
  //   if (data.flag) {
  //     if (this.article.id === null) {
  //       this.$store.commit('removeTab', '发布文章')
  //     } else {
  //       this.$store.commit('removeTab', '修改文章')
  //     }
  //     sessionStorage.removeItem('article')
  //     this.$router.push({ path: '/article-list' })
  //     this.$notify.success({
  //       title: '成功',
  //       message: data.message
  //     })
  //   } else {
  //     this.$notify.error({
  //       title: '失败',
  //       message: data.message
  //     })
  //   }
  //   this.addOrEdit = false
  // })
  // this.autoSave = false
}
function autoSaveArticle() {
  // if (
  //   this.autoSave &&
  //   this.article.articleTitle.trim() != '' &&
  //   this.article.articleContent.trim() != '' &&
  //   this.article.id != null
  // ) {
  //   this.axios.post('/api/admin/articles', this.article).then(({ data }) => {
  //     if (data.flag) {
  //       this.$notify.success({
  //         title: '成功',
  //         message: '自动保存成功'
  //       })
  //     } else {
  //       this.$notify.error({
  //         title: '失败',
  //         message: '自动保存失败'
  //       })
  //     }
  //   })
  // }
  // if (this.autoSave && this.article.id == null) {
  //   sessionStorage.setItem('article', JSON.stringify(this.article))
  // }
}
function searchCategories(keywords, cb) {
  // this.axios
  //   .get('/api/admin/categories/search', {
  //     params: {
  //       keywords: keywords
  //     }
  //   })
  //   .then(({ data }) => {
  //     cb(data.data)
  //   })
}
function handleSelectCategories(item) {
  // this.addCategory({
  //   categoryName: item.categoryName
  // })
}
function saveCategory() {
  // if (this.categoryName.trim() != '') {
  //   this.addCategory({
  //     categoryName: this.categoryName
  //   })
  //   this.categoryName = ''
  // }
}
function addCategory(item) {
  // this.article.categoryName = item.categoryName
}
function removeCategory() {
  // this.article.categoryName = null
}
function searchTags(keywords, cb) {
  // this.axios
  //   .get('/api/admin/tags/search', {
  //     params: {
  //       keywords: keywords
  //     }
  //   })
  //   .then(({ data }) => {
  //     cb(data.data)
  //   })
}
function handleSelectTag(item) {
  // this.addTag({
  //   tagName: item.tagName
  // })
}
function saveTag() {
  // if (this.tagName.trim() != '') {
  //   this.addTag({
  //     tagName: this.tagName
  //   })
  //   this.tagName = ''
  // }
}
function addTag(item) {
  // if (this.article.tagNames.indexOf(item.tagName) == -1) {
  //   this.article.tagNames.push(item.tagName)
  // }
}
function removeTag(item) {
  // const index = this.article.tagNames.indexOf(item)
  // this.article.tagNames.splice(index, 1)
}
// import * as imageConversion from 'image-conversion'
// export default {
//   created() {
//
//   },
//   destroyed() {
//     this.autoSaveArticle()
//   },
//   data: function () {
//     return {
//
//     }
//   },
//   methods: {
//
//   },
//   computed: {
//     tagClass() {
//       return function (item) {
//         const index = this.article.tagNames.indexOf(item.tagName)
//         return index != -1 ? 'tag-item-select' : 'tag-item'
//       }
//     }
//   }
// }

// 取消按钮
function cancel() {
  addOrEdit.value = false
}

listCategories()
listTags()
getTempArticle(route.params && route.params.articleId)
</script>

<style scoped>
.article-title-container {
  display: flex;
  align-items: center;
  margin-bottom: 1.25rem;
  margin-top: 2.25rem;
}
.save-btn {
  margin-left: 0.75rem;
  background: #fff;
  color: #f56c6c;
}
.tag-item {
  margin-right: 1rem;
  margin-bottom: 1rem;
  cursor: pointer;
}
.tag-item-select {
  margin-right: 1rem;
  margin-bottom: 1rem;
  cursor: not-allowed;
  color: #ccccd8 !important;
}
.category-item {
  cursor: pointer;
  padding: 0.6rem 0.5rem;
}
.category-item:hover {
  background-color: #f0f9eb;
  color: #67c23a;
}
.popover-title {
  margin-bottom: 1rem;
  text-align: center;
}
.popover-container {
  margin-top: 1rem;
  height: 260px;
  overflow-y: auto;
}
</style>
