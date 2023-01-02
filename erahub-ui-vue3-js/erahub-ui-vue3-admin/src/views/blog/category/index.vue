<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch">
      <el-form-item label="分类ID" prop="categoryId">
        <el-input
          v-model="queryParams.categoryId"
          placeholder="请输入分类ID"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="分类名" prop="categoryName">
        <el-input
          v-model="queryParams.categoryName"
          placeholder="请输入分类名"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="分类状态" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="请选择分类状态"
          clearable
          style="width: 200px"
        >
          <el-option
            v-for="dict in blog_category_status"
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
          v-hasPermi="['blog:category:add']"
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
          v-hasPermi="['blog:category:edit']"
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
          v-hasPermi="['blog:category:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['blog:category:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="categoryList"
      @selection-change="handleSelectionChange"
      border
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="分类ID" align="center" prop="categoryId" v-if="true" />
      <el-table-column label="分类名" align="center" prop="categoryName" />
      <el-table-column label="分类状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="blog_category_status" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="发表时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
        width="200"
        fixed="right"
      >
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="Edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['blog:category:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['blog:category:remove']"
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

    <!-- 添加或修改博客分类对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="categoryRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="分类名" prop="categoryName">
          <el-input v-model="form.categoryName" placeholder="请输入分类名" />
        </el-form-item>
        <el-form-item label="分类状态">
          <el-radio-group v-model="form.status">
            <el-radio v-for="dict in blog_category_status" :key="dict.value" :label="dict.value">{{
              dict.label
            }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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

<script setup name="Category">
import {
  listCategory,
  getCategory,
  delCategory,
  addCategory,
  updateCategory
} from '@/api/blog/category'

const { proxy } = getCurrentInstance()
const { blog_category_status } = proxy.useDict('blog_category_status')

const categoryList = ref([])
const open = ref(false)
const buttonLoading = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref('')
const dateRange = ref([])

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    categoryId: undefined,
    categoryName: undefined,
    status: undefined,
    createTime: undefined
  },
  rules: {
    categoryId: [{ required: true, message: '分类ID不能为空', trigger: 'blur' }],
    categoryName: [{ required: true, message: '分类名不能为空', trigger: 'blur' }],
    status: [{ required: true, message: '分类状态不能为空', trigger: 'blur' }],
    createTime: [{ required: true, message: '发表时间不能为空', trigger: 'blur' }]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询博客分类列表 */
function getList() {
  loading.value = true
  listCategory(proxy.addDateRange(queryParams.value, dateRange.value)).then((response) => {
    categoryList.value = response.rows
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
    categoryId: null,
    categoryName: null,
    status: '0',
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  }
  proxy.resetForm('categoryRef')
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
  handleQuery()
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.categoryId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = '添加博客分类'
}

/** 修改按钮操作 */
function handleUpdate(row) {
  loading.value = true
  reset()
  const _categoryId = row.categoryId || ids.value
  getCategory(_categoryId).then((response) => {
    loading.value = false
    form.value = response.data
    open.value = true
    title.value = '修改博客分类'
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs['categoryRef'].validate((valid) => {
    if (valid) {
      buttonLoading.value = true
      if (form.value.categoryId != null) {
        updateCategory(form.value)
          .then((response) => {
            proxy.$modal.msgSuccess('修改成功')
            open.value = false
            getList()
          })
          .finally(() => {
            buttonLoading.value = false
          })
      } else {
        addCategory(form.value)
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
  const _categoryIds = row.categoryId || ids.value
  proxy.$modal
    .confirm('是否确认删除博客分类编号为"' + _categoryIds + '"的数据项？')
    .then(function () {
      loading.value = true
      return delCategory(_categoryIds)
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
    'blog/category/export',
    {
      ...queryParams.value
    },
    `category_${new Date().getTime()}.xlsx`
  )
}

getList()
</script>
