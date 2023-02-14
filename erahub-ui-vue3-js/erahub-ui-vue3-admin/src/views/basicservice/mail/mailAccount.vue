<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch">
      <el-form-item label="发送方" prop="mailFrom">
        <el-input
          v-model="queryParams.mailFrom"
          placeholder="请输入发送方"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="服务器域名" prop="host">
        <el-input
          v-model="queryParams.host"
          placeholder="请输入服务器域名"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="服务端口" prop="port">
        <el-input
          v-model="queryParams.port"
          placeholder="请输入服务端口"
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
          v-hasPermi="['basicservice:mailAccount:add']"
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
          v-hasPermi="['basicservice:mailAccount:edit']"
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
          v-hasPermi="['basicservice:mailAccount:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['basicservice:mailAccount:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="mailAccountList"
      @selection-change="handleSelectionChange"
      border
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="账号ID" align="center" prop="mailAccountId" v-if="false" />
      <el-table-column label="发送方" align="center" prop="mailFrom" />
      <el-table-column label="用户名" align="center" prop="user" />
      <el-table-column label="验证" align="center" prop="auth">
        <template #default="scope">
          <dict-tag :options="yes_no" :value="scope.row.auth" />
        </template>
      </el-table-column>
      <el-table-column label="服务器域名" align="center" prop="host" />
      <el-table-column label="服务端口" align="center" prop="port" />
      <el-table-column label="SMTP超时" align="center" prop="timeout" />
      <el-table-column label="Socket超时" align="center" prop="connectionTimeout" />
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
            v-hasPermi="['basicservice:mailAccount:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['basicservice:mailAccount:remove']"
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

    <!-- 添加或修改邮件账号对话框 -->
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form ref="mailAccountRef" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="发送方" prop="mailFrom">
          <el-input v-model="form.mailFrom" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="用户名" prop="user">
          <el-input v-model="form.user" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="密码" prop="pass">
          <el-input v-model="form.pass" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="验证">
          <el-radio-group v-model="form.auth">
            <el-radio v-for="dict in yes_no" :key="dict.value" :label="dict.value">{{
              dict.label
            }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="服务器域名" prop="host">
          <el-input v-model="form.host" placeholder="请输入服务器域名" />
        </el-form-item>
        <el-form-item label="服务端口" prop="port">
          <el-input v-model="form.port" placeholder="请输入服务端口" />
        </el-form-item>
        <el-form-item label="socket端口" prop="socketFactoryPort">
          <el-input v-model="form.socketFactoryPort" placeholder="请输入socket端口" />
        </el-form-item>
        <el-form-item label="STARTTLS连接">
          <el-radio-group v-model="form.starttlsEnable">
            <el-radio v-for="dict in yes_no" :key="dict.value" :label="dict.value">{{
              dict.label
            }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="SSL连接">
          <el-radio-group v-model="form.sslEnable">
            <el-radio v-for="dict in yes_no" :key="dict.value" :label="dict.value">{{
              dict.label
            }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="SMTP超时" prop="timeout">
          <el-input v-model="form.timeout" placeholder="请输入SMTP超时" />
        </el-form-item>
        <el-form-item label="Socket超时" prop="connectionTimeout">
          <el-input v-model="form.connectionTimeout" placeholder="请输入Socket超时" />
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

<script setup name="MailAccount">
import {
  listMailAccount,
  getMailAccount,
  delMailAccount,
  addMailAccount,
  updateMailAccount
} from '@/api/basicservice/mailAccount'

const { proxy } = getCurrentInstance()

const { yes_no } = proxy.useDict('yes_no')

const mailAccountList = ref([])
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
    mailFrom: undefined,
    host: undefined,
    port: undefined
  },
  rules: {
    mailAccountId: [{ required: true, message: '邮件账号ID不能为空', trigger: 'blur' }],
    mailFrom: [{ required: true, message: '发送方不能为空', trigger: 'blur' }],
    user: [{ required: true, message: '用户名不能为空', trigger: 'blur' }],
    pass: [{ required: true, message: '密码不能为空', trigger: 'blur' }],
    auth: [{ required: true, message: '密码验证不能为空', trigger: 'change' }],
    host: [{ required: true, message: '服务器域名不能为空', trigger: 'blur' }],
    port: [{ required: true, message: '服务端口不能为空', trigger: 'blur' }],
    socketFactoryPort: [{ required: true, message: 'socket端口不能为空', trigger: 'blur' }],
    starttlsEnable: [{ required: true, message: 'STARTTLS安全连接不能为空', trigger: 'change' }],
    sslEnable: [{ required: true, message: 'SSL安全连接不能为空', trigger: 'change' }],
    timeout: [{ required: true, message: 'SMTP超时不能为空', trigger: 'blur' }],
    connectionTimeout: [{ required: true, message: 'Socket超时不能为空', trigger: 'blur' }]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询邮件账号列表 */
function getList() {
  loading.value = true
  listMailAccount(queryParams.value).then((response) => {
    mailAccountList.value = response.rows
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
    mailAccountId: null,
    mailFrom: null,
    user: null,
    pass: null,
    auth: '0',
    host: null,
    port: null,
    socketFactoryPort: null,
    starttlsEnable: '0',
    sslEnable: '0',
    timeout: null,
    connectionTimeout: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  }
  proxy.resetForm('mailAccountRef')
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
  ids.value = selection.map((item) => item.mailAccountId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = '添加邮件账号'
}

/** 修改按钮操作 */
function handleUpdate(row) {
  loading.value = true
  reset()
  const _mailAccountId = row.mailAccountId || ids.value
  getMailAccount(_mailAccountId).then((response) => {
    loading.value = false
    form.value = response.data
    open.value = true
    title.value = '修改邮件账号'
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs['mailAccountRef'].validate((valid) => {
    if (valid) {
      buttonLoading.value = true
      if (form.value.mailAccountId != null) {
        updateMailAccount(form.value)
          .then((response) => {
            proxy.$modal.msgSuccess('修改成功')
            open.value = false
            getList()
          })
          .finally(() => {
            buttonLoading.value = false
          })
      } else {
        addMailAccount(form.value)
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
  const _mailAccountIds = row.mailAccountId || ids.value
  proxy.$modal
    .confirm('是否确认删除邮件账号编号为"' + _mailAccountIds + '"的数据项？')
    .then(function () {
      loading.value = true
      return delMailAccount(_mailAccountIds)
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
    'basicservice/mailAccount/export',
    {
      ...queryParams.value
    },
    `mailAccount_${new Date().getTime()}.xlsx`
  )
}

getList()
</script>
