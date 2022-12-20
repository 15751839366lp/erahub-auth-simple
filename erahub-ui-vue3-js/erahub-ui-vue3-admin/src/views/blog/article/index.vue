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
      <el-form-item label="文章分类" prop="categoryId">
        <el-select
          placeholder="请选择文章分类"
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
      <el-form-item label="标签" prop="">
        <el-select
          placeholder="请选择标签"
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
      <el-form-item label="删除" prop="type">
        <el-select
          v-model="queryParams.isDelete"
          placeholder="是否删除"
          clearable
          style="width: 200px"
        >
          <el-option
            v-for="dict in blog_article_delete"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="创建时间" style="width: 308px">
        <el-date-picker
          v-model="dateRange"
          value-format="YYYY-MM-DD"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
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
          >发表</el-button
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
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" ></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="articleList" @selection-change="handleSelectionChange" border >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="文章ID" align="center" prop="articleId" v-if="true" width="130" show-overflow-tooltip/>
      <el-table-column label="文章缩略图" align="center" prop="articleCover" width="100">
        <template #default="scope">
          <image-preview :src="scope.row.articleCover" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="标题" align="center" prop="articleTitle" show-overflow-tooltip/>
      <el-table-column label="作者" align="center" prop="createBy" />
      <el-table-column label="文章分类" align="center" prop="categoryId" />
      <el-table-column label="文章标签" align="center" prop="categoryId" />
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
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updateTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200" fixed="right">
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

  </div>
</template>

<script setup name="Article">
import { listArticle, delArticle } from '@/api/blog/article'
import useUserStore from '@/store/modules/user'
import router from '@/router'

const userStore = useUserStore()

const { proxy } = getCurrentInstance()
const { blog_article_top, blog_article_featured, blog_article_status, blog_article_type, blog_article_delete } =
  proxy.useDict(
    'blog_article_top',
    'blog_article_featured',
    'blog_article_status',
    'blog_article_type',
    'blog_article_delete'
  )

const articleList = ref([])
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const dateRange = ref([])

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
    isDelete: '0',
    status: undefined,
    type: undefined
  }
})

const { queryParams, form } = toRefs(data)

/** 查询博客文章列表 */
function getList() {
  loading.value = true
  listArticle(proxy.addDateRange(queryParams.value, dateRange.value)).then((response) => {
    articleList.value = response.rows
    total.value = response.total
    loading.value = false
  })
}


/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** 重置按钮操作 */
function resetQuery() {
  dateRange.value = []
  proxy.resetForm('queryRef')
  queryParams.value.isDelete = '0'
  handleQuery()
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.articleId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 发表按钮操作 */
function handleAdd() {
  router.push({
    path: '/blog/article-edit/index/' + 0
  })
}

/** 修改按钮操作 */
function handleUpdate(row) {
  const tableId = row.articleId || ids.value[0]
  router.push({
    path: '/blog/article-edit/index/' + tableId
  })
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.articleId || ids.value
  proxy.$modal
    .confirm('是否确认删除博客文章编号为"' + _ids + '"的数据项？')
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
