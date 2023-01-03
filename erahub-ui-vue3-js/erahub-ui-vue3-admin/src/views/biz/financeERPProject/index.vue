<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch">
      <el-form-item label="ERP工单号" prop="projectNumber">
        <el-input
          v-model="queryParams.projectNumber"
          placeholder="请输入ERP工单号"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="ERP请购单号" prop="requisitionNumber">
        <el-input
          v-model="queryParams.requisitionNumber"
          placeholder="请输入ERP请购单号"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
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
          v-hasPermi="['biz:financeERPProject:add']"
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
          v-hasPermi="['biz:financeERPProject:edit']"
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
          v-hasPermi="['biz:financeERPProject:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="Upload"
          @click="handleImport"
          v-hasPermi="['biz:financeERPProject:import']"
          >导入</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['biz:financeERPProject:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="financeERPProjectList"
      @selection-change="handleSelectionChange"
      border
    >
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="工程ID" align="center" prop="projectId" v-if="true" fixed />
      <el-table-column label="工单号" align="center" prop="projectNumber" fixed/>
      <el-table-column label="请购单号" align="center" prop="requisitionNumber" fixed/>
      <el-table-column label="装置名称" align="center" prop="deviceName" show-overflow-tooltip/>
      <el-table-column label="工程名称" align="center" prop="projectName" show-overflow-tooltip/>
      <el-table-column label="计划类别" align="center" prop="planType" />
      <el-table-column label="单位" align="center" prop="department" />
      <el-table-column label="结算审核额" align="center" prop="settlementReviewAmount" />
      <el-table-column label="合同编号" align="center" prop="contractNumber" show-overflow-tooltip/>
      <el-table-column label="工程类别" align="center" prop="projectType" />
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
            v-hasPermi="['biz:financeERPProject:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:financeERPProject:remove']"
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

    <!-- 添加或修改ERP工程明细对话框 -->
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form ref="financeERPProjectRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="工单号" prop="projectNumber">
          <el-input v-model="form.projectNumber" placeholder="请输入ERP工单号" />
        </el-form-item>
        <el-form-item label="请购单号" prop="requisitionNumber">
          <el-input v-model="form.requisitionNumber" placeholder="请输入ERP请购单号" />
        </el-form-item>
        <el-form-item label="装置名称" prop="deviceName">
          <el-input v-model="form.deviceName" placeholder="请输入ERP装置名称" />
        </el-form-item>
        <el-form-item label="工程名称" prop="projectName">
          <el-input v-model="form.projectName" placeholder="请输入ERP工程名称" />
        </el-form-item>
        <el-form-item label="单位" prop="department">
          <el-input v-model="form.department" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="结算审核额" prop="settlementReviewAmount">
          <el-input v-model="form.settlementReviewAmount" placeholder="请输入结算审核额" />
        </el-form-item>
        <el-form-item label="合同编号" prop="contractNumber">
          <el-input v-model="form.contractNumber" placeholder="请输入合同编号" />
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

    <!-- 导入对话框 -->
    <el-dialog :title="upload.title" v-model="upload.open" width="400px" append-to-body>
      <el-upload
        ref="uploadRef"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <el-icon class="el-icon--upload"><upload-filled /></el-icon>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <template #tip>
          <div class="el-upload__tip text-center">
            <span>仅允许导入xls、xlsx格式文件。</span>
          </div>
        </template>
      </el-upload>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitFileForm">确 定</el-button>
          <el-button @click="upload.open = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="FinanceERPProject">
import { getToken } from '@/utils/auth'
import {
  listFinanceERPProject,
  getFinanceERPProject,
  delFinanceERPProject,
  addFinanceERPProject,
  updateFinanceERPProject
} from '@/api/biz/financeERPProject'
import { ElNotification, ElMessageBox, ElMessage, ElLoading } from 'element-plus'
import { saveAs } from 'file-saver'
import { blobValidate } from '@/utils/erahub'

const { proxy } = getCurrentInstance()

const financeERPProjectList = ref([])
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
    projectNumber: undefined,
    requisitionNumber: undefined
  },
  rules: {
    projectNumber: [{ required: true, message: 'ERP工单号不能为空', trigger: 'blur' }],
    requisitionNumber: [{ required: true, message: 'ERP请购单号不能为空', trigger: 'blur' }]
  }
})

/*** 文件导入参数 */
const upload = reactive({
  // 是否显示弹出层（文件导入）
  open: false,
  // 弹出层标题（文件导入）
  title: '',
  // 是否禁用上传
  isUploading: false,
  // 设置上传的请求头部
  headers: { Authorization: 'Bearer ' + getToken() },
  // 上传的地址
  url: import.meta.env.VITE_APP_BASE_API + '/biz/financeERPProject/importData'
})

const { queryParams, form, rules } = toRefs(data)

/** 查询ERP工程明细列表 */
function getList() {
  loading.value = true
  listFinanceERPProject(queryParams.value).then((response) => {
    financeERPProjectList.value = response.rows
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
    projectId: null,
    projectNumber: null,
    requisitionNumber: null,
    deviceName: null,
    projectName: null,
    planType: null,
    department: null,
    settlementReviewAmount: null,
    contractNumber: null,
    projectType: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  }
  proxy.resetForm('financeERPProjectRef')
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
  ids.value = selection.map((item) => item.projectId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = '添加ERP工程明细'
}

/** 修改按钮操作 */
function handleUpdate(row) {
  loading.value = true
  reset()
  const _projectId = row.projectId || ids.value
  getFinanceERPProject(_projectId).then((response) => {
    loading.value = false
    form.value = response.data
    open.value = true
    title.value = '修改ERP工程明细'
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs['financeERPProjectRef'].validate((valid) => {
    if (valid) {
      buttonLoading.value = true
      if (form.value.projectId != null) {
        updateFinanceERPProject(form.value)
          .then((response) => {
            proxy.$modal.msgSuccess('修改成功')
            open.value = false
            getList()
          })
          .finally(() => {
            buttonLoading.value = false
          })
      } else {
        addFinanceERPProject(form.value)
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
  const _projectIds = row.projectId || ids.value
  proxy.$modal
    .confirm('是否确认删除ERP工程明细编号为"' + _projectIds + '"的数据项？')
    .then(function () {
      loading.value = true
      return delFinanceERPProject(_projectIds)
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
  proxy.downloadWithData(
    '/biz/financeERPProject/export',
    'post',
    financeERPProjectList.value,
    `financeERPProject_${new Date().getTime()}.xlsx`
  )
}

/** 导入按钮操作 */
function handleImport() {
  upload.title = '文件导入'
  upload.open = true
}

/**文件上传中处理 */
const handleFileUploadProgress = (event, file, fileList) => {
  upload.isUploading = true
}
/** 文件上传成功处理 */
const handleFileSuccess = (response, file, fileList) => {
  proxy.$alert(
    "<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" +
      response.msg +
      '</div>',
    '导入结果',
    { dangerouslyUseHTMLString: true }
  )
  proxy.$refs['uploadRef'].handleRemove(file)
  buttonLoading.value = false
  upload.isUploading = false
  upload.open = false
  financeERPProjectList.value = response.data
}
/** 提交上传文件 */
function submitFileForm() {
  buttonLoading.value = true
  proxy.$refs['uploadRef'].submit()
}

getList()
</script>
