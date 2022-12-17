<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch">
      <el-form-item label="作者" prop="createBy">
        <el-input
          v-model="queryParams.createBy"
          placeholder="请输入作者"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文章分类ID" prop="categoryId">
        <el-input
          v-model="queryParams.categoryId"
          placeholder="请输入文章分类ID"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="标题" prop="articleTitle">
        <el-input
          v-model="queryParams.articleTitle"
          placeholder="请输入标题"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="置顶" prop="isTop">
        <el-select
          v-model="queryParams.isTop"
          placeholder="请选择置顶"
          clearable
          style="width: 200px"
        >
          <el-option
            v-for="dict in blog_article_top"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="推荐" prop="isFeatured">
        <el-select
          v-model="queryParams.isFeatured"
          placeholder="请选择推荐"
          clearable
          style="width: 200px"
        >
          <el-option
            v-for="dict in blog_article_featured"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="请选择状态"
          clearable
          style="width: 200px"
        >
          <el-option
            v-for="dict in blog_article_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="文章类型" prop="type">
        <el-select
          v-model="queryParams.type"
          placeholder="请选择文章类型"
          clearable
          style="width: 200px"
        >
          <el-option
            v-for="dict in blog_article_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['blog:article:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['blog:article:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['blog:article:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['blog:article:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="articleList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="文章ID" align="center" prop="blogArticleId" v-if="true" width="130"/>
      <el-table-column label="作者" align="center" prop="createBy" />
      <el-table-column label="文章分类ID" align="center" prop="categoryId" />
      <el-table-column label="文章缩略图" align="center" prop="articleCover" width="100">
        <template #default="scope">
          <image-preview :src="scope.row.articleCover" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="标题" align="center" prop="articleTitle" />
      <el-table-column label="置顶" align="center" prop="isTop">
        <template #default="scope">
          <dict-tag :options="blog_article_top" :value="scope.row.isTop" />
        </template>
      </el-table-column>
      <el-table-column label="推荐" align="center" prop="isFeatured">
        <template #default="scope">
          <dict-tag :options="blog_article_featured" :value="scope.row.isFeatured" />
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="blog_article_status" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="文章类型" align="center" prop="type">
        <template #default="scope">
          <dict-tag :options="blog_article_type" :value="scope.row.type" />
        </template>
      </el-table-column>
      <el-table-column label="发表时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width"  width="200">
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="Edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['blog:article:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['blog:article:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改博客文章对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="articleRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="作者">
          <el-input v-model="userStore.nickName" disabled />
        </el-form-item>
        <el-form-item label="文章分类ID" prop="categoryId">
          <el-input v-model="form.categoryId" placeholder="请输入文章分类ID" />
        </el-form-item>
        <el-form-item label="文章缩略图">
          <image-upload v-model="form.articleCover" />
        </el-form-item>
        <el-form-item label="标题" prop="articleTitle">
          <el-input v-model="form.articleTitle" placeholder="请输入标题" />
        </el-form-item>
        <el-form-item label="内容">
          <!-- <editor v-model="form.articleContent" :min-height="192" /> -->
        </el-form-item>
        <el-form-item label="置顶">
          <el-radio-group v-model="form.isTop">
            <el-radio
              v-for="dict in blog_article_top"
              :key="dict.value"
              :label="parseInt(dict.value)"
              >{{ dict.label }}</el-radio
            >
          </el-radio-group>
        </el-form-item>
        <el-form-item label="推荐">
          <el-radio-group v-model="form.isFeatured">
            <el-radio
              v-for="dict in blog_article_featured"
              :key="dict.value"
              :label="parseInt(dict.value)"
              >{{ dict.label }}</el-radio
            >
          </el-radio-group>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择状态">
            <el-option
              v-for="dict in blog_article_status"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="文章类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择文章类型">
            <el-option
              v-for="dict in blog_article_type"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="访问密码" prop="password">
          <el-input v-model="form.password" placeholder="请输入访问密码" />
        </el-form-item>
        <el-form-item label="原文链接" prop="originalUrl">
          <el-input v-model="form.originalUrl" placeholder="请输入原文链接" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Article">
import { listArticle, getArticle, delArticle, addArticle, updateArticle } from '@/api/blog/article'
import useUserStore from '@/store/modules/user'

const userStore = useUserStore()

const { proxy } = getCurrentInstance()
const { blog_article_top, blog_article_featured, blog_article_status, blog_article_type } =
  proxy.useDict(
    'blog_article_top',
    'blog_article_featured',
    'blog_article_status',
    'blog_article_type'
  )

const articleList = ref([])
const open = ref(false)
const buttonLoading = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref('')

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    createBy: undefined,
    categoryId: undefined,
    articleTitle: undefined,
    isTop: undefined,
    isFeatured: undefined,
    status: undefined,
    type: undefined
  },
  rules: {
    articleTitle: [{ required: true, message: '标题不能为空', trigger: 'blur' }],
    isTop: [{ required: true, message: '置顶不能为空', trigger: 'blur' }],
    isFeatured: [{ required: true, message: '推荐不能为空', trigger: 'blur' }],
    isDelete: [{ required: true, message: '删除不能为空', trigger: 'blur' }],
    status: [{ required: true, message: '状态不能为空', trigger: 'change' }],
    type: [{ required: true, message: '文章类型不能为空', trigger: 'change' }],
    createTime: [{ required: true, message: '发表时间不能为空', trigger: 'blur' }]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询博客文章列表 */
function getList() {
  loading.value = true
  listArticle(queryParams.value).then((response) => {
    articleList.value = response.rows
    total.value = response.total
    loading.value = false
  })
}

// 取消按钮
function cancel() {
  open.value = false
  reset()
}

// 表单重置
function reset() {
  form.value = {
    createBy: null,
    categoryId: null,
    articleCover: null,
    articleTitle: null,
    articleContent: null,
    isTop: 0,
    isFeatured: 0,
    isDelete: 0,
    status: null,
    type: null,
    password: null,
    originalUrl: null,
    createTime: null,
    updateTime: null
  }
  proxy.resetForm('articleRef')
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm('queryRef')
  handleQuery()
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.blogArticleId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = '添加博客文章'
}

/** 修改按钮操作 */
function handleUpdate(row) {
  loading.value = true
  reset()
  const _id = row.blogArticleId || ids.value
  getArticle(_id).then((response) => {
    loading.value = false
    form.value = response.data
    open.value = true
    title.value = '修改博客文章'
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs['articleRef'].validate((valid) => {
    if (valid) {
      buttonLoading.value = true
      if (form.value.blogArticleId != null) {
        updateArticle(form.value)
          .then((response) => {
            proxy.$modal.msgSuccess('修改成功')
            open.value = false
            getList()
          })
          .finally(() => {
            buttonLoading.value = false
          })
      } else {
        addArticle(form.value)
          .then((response) => {
            proxy.$modal.msgSuccess('新增成功')
            open.value = false
            getList()
          })
          .finally(() => {
            buttonLoading.value = false
          })
      }
    }
  })
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.blogArticleId || ids.value
  proxy.$modal
    .confirm('是否确认删除博客文章编号为"' + ids + '"的数据项？')
    .then(function () {
      loading.value = true
      return delArticle(_ids)
    })
    .then(() => {
      loading.value = true
      getList()
      proxy.$modal.msgSuccess('删除成功')
    })
    .catch(() => {})
    .finally(() => {
      loading.value = false
    })
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download(
    'blog/article/export',
    {
      ...queryParams.value
    },
    `article_${new Date().getTime()}.xlsx`
  )
}

getList()
</script>
