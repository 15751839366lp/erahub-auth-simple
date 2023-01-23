<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch">
      <el-form-item label="消息ID" prop="messageId">
        <el-input
          v-model="queryParams.messageId"
          placeholder="请输入消息ID"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发件邮件" prop="mailAccountId">
        <el-select
          v-model="queryParams.mailAccountId"
          placeholder="请选择邮件账号"
          style="width: 250px"
          clearable
        >
          <el-option
            v-for="item in mailAccountList"
            :key="item.mailAccountId"
            :label="item.mailFrom"
            :value="item.mailAccountId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="接收邮箱" prop="mailTo">
        <el-input
          v-model="queryParams.mailTo"
          placeholder="请输入接收邮箱"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="标题" prop="subject">
        <el-input
          v-model="queryParams.subject"
          placeholder="请输入标题"
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
          @click="handleSend"
          v-hasPermi="['basicservice:mailRecord:send']"
          >发送</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['basicservice:mailRecord:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['basicservice:mailRecord:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="mailRecordList"
      @selection-change="handleSelectionChange"
      border
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="邮件ID" align="center" prop="mailRecordId" v-if="false" />
      <el-table-column label="消息ID" align="center" prop="messageId" />
      <el-table-column label="发件人" align="center" prop="createBy" />
      <el-table-column label="发件邮箱" align="center" prop="bsMailAccount.mailFrom" width="250" />
      <el-table-column label="接收邮箱" align="center" prop="mailTo" show-overflow-tooltip />
      <el-table-column label="标题" align="center" prop="subject" show-overflow-tooltip />
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
            icon="View"
            @click="handleInfo(scope.row)"
            v-hasPermi="['basicservice:mailRecord:query']"
            >详情</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['basicservice:mailRecord:remove']"
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

    <!-- 发送邮件对话框 -->
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form ref="mailRecordRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="发件邮件" prop="mailAccountId">
          <el-select
            v-model="form.mailAccountId"
            placeholder="请选择发件邮件"
            style="width: 500px"
            clearable
          >
            <el-option
              v-for="item in mailAccountList"
              :key="item.mailAccountId"
              :label="item.mailFrom"
              :value="item.mailAccountId"
            />
          </el-select>
        </el-form-item>
        <el-col>
          <el-form-item label="接收邮箱" prop="mailTo">
            <el-tooltip
              content="发送给单个或多个收件邮箱,多个收件邮箱可以使用逗号“,”分隔，也可以通过分号“;”分隔"
              placement="right"
            >
              <el-input v-model="form.mailTo" placeholder="请输入接收人" />
            </el-tooltip>
          </el-form-item>
        </el-col>
        <el-form-item label="标题" prop="subject">
          <el-input v-model="form.subject" placeholder="请输入标题" />
        </el-form-item>
        <el-form-item label="内容" prop="text">
          <el-input v-model="form.text" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="附件" prop="files">
          <el-input v-model="form.files" type="textarea" placeholder="请输入附件" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 邮件记录详情 -->
    <el-dialog title="邮件记录详情" v-model="infoOpen" width="700px" append-to-body>
      <el-form :model="info" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="消息ID：">{{ info.messageId }}</el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="发件人：">{{ info.createBy }}</el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="发件邮箱：">{{ info.bsMailAccount.mailFrom }}</el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="接收邮箱：">
              {{ info.mailTo }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="发送时间：">{{ info.createTime }}</el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="标题：">{{ info.subject }}</el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="内容：">{{ info.text }}</el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="附件：">{{ info.files }}</el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注：">{{ info.remark }}</el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="infoOpen = false">关 闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="MailRecord">
import {
  listMailRecord,
  getMailRecord,
  delMailRecord,
  sendMail
} from '@/api/basicservice/mailRecord'
import { getAllMailAccount } from '@/api/basicservice/mailAccount'

const { proxy } = getCurrentInstance()

const mailAccountList = ref([])
const mailRecordList = ref([])
const open = ref(false)
const infoOpen = ref(false)
const buttonLoading = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref('')
const info = ref({})

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    messageId: undefined,
    mailAccountId: undefined,
    mailTo: undefined,
    subject: undefined
  },
  rules: {
    mailAccountId: [{ required: true, message: '邮件账号不能为空', trigger: 'blur' }],
    mailTo: [{ required: true, message: '接收人不能为空', trigger: 'blur' }],
    subject: [{ required: true, message: '标题不能为空', trigger: 'blur' }]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询邮件记录列表 */
function getList() {
  loading.value = true
  listMailRecord(queryParams.value).then((response) => {
    mailRecordList.value = response.rows
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
    mailRecordId: null,
    messageId: null,
    mailAccountId: null,
    mailTo: null,
    subject: null,
    text: null,
    files: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  }
  proxy.resetForm('mailRecordRef')
  info.value = {
    bsMailAccount: {
      mailFrom: null
    }
  }
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
  ids.value = selection.map((item) => item.mailRecordId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 发送按钮操作 */
function handleSend() {
  reset()
  open.value = true
  title.value = '发送邮件'
}

/** 详情按钮操作 */
function handleInfo(row) {
  loading.value = true
  reset()
  const _mailRecordId = row.mailRecordId || ids.value
  getMailRecord(_mailRecordId).then((response) => {
    loading.value = false
    info.value = response.data
    infoOpen.value = true
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs['mailRecordRef'].validate((valid) => {
    if (valid) {
      buttonLoading.value = true
      sendMail(form.value)
        .then((response) => {
          proxy.$modal.msgSuccess('发送成功')
          open.value = false
          getList()
        })
        .finally(() => {
          buttonLoading.value = false
        })
    }
  })
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _mailRecordIds = row.mailRecordId || ids.value
  proxy.$modal
    .confirm('是否确认删除邮件记录编号为"' + _mailRecordIds + '"的数据项？')
    .then(function () {
      loading.value = true
      return delMailRecord(_mailRecordIds)
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
    'basicservice/mailRecord/export',
    {
      ...queryParams.value
    },
    `mailRecord_${new Date().getTime()}.xlsx`
  )
}

function listMailAccounts() {
  getAllMailAccount().then((response) => {
    mailAccountList.value = response.data
  })
}

listMailAccounts()
getList()
</script>
