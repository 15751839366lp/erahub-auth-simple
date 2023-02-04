<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch">
      <el-form-item label="合同编号" prop="contractNumber">
        <el-input
          v-model="queryParams.contractNumber"
          placeholder="请输入合同编号"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="合同类别" prop="contractType">
        <el-select
          v-model="queryParams.contractType"
          placeholder="请选择合同类别"
          clearablestyle="width: 200px"
          @keyup.enter="handleQuery"
        >
          <el-option
            v-for="item in contractTypeList"
            :key="item.contractTypeId"
            :label="item.contractTypeName"
            :value="item.contractTypeId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="单位" prop="company">
        <el-input
          v-model="queryParams.company"
          placeholder="请输入单位"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="适用范围" prop="contractRange">
        <el-input
          v-model="queryParams.contractRange"
          placeholder="请输入适用范围"
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
          v-hasPermi="['biz:finance:erpcontract:add']"
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
          v-hasPermi="['biz:finance:erpcontract:edit']"
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
          v-hasPermi="['biz:finance:erpcontract:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['biz:finance:erpcontract:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList" gutter="30"></right-toolbar>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Close" @click="handleClose">关闭</el-button>
      </el-col>
    </el-row>

    <el-table
      v-loading="loading"
      :data="financeERPContractList"
      @selection-change="handleSelectionChange"
      border
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column
        label="合同ID"
        align="center"
        prop="contractId"
        v-if="true"
        show-overflow-tooltip
      />
      <el-table-column
        label="合同编号"
        align="center"
        prop="contractNumber"
        width="300"
        show-overflow-tooltip
      />
      <el-table-column label="合同类别" align="center" prop="contractType" show-overflow-tooltip>
        <template #default="scope">
          <el-tag v-if="scope.row.contractType == '1'" type="success">框架协议</el-tag>
          <el-tag v-else-if="scope.row.contractType == '2'"  type="danger">单签合同</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="单位" align="center" prop="company" />
      <el-table-column label="适用范围" align="center" prop="contractRange" show-overflow-tooltip />
      <el-table-column label="合同总金额" align="center" prop="contractAmount" />
      <el-table-column
        label="合同有效期间"
        align="center"
        prop="contractDuration"
        show-overflow-tooltip
      />
      <el-table-column
        label="让利"
        align="center"
        prop="profitAbalienation"
        show-overflow-tooltip
      />
      <el-table-column label="质保期" align="center" prop="warranty" show-overflow-tooltip />
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
            v-hasPermi="['biz:finance:erpcontract:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:finance:erpcontract:remove']"
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

    <!-- 添加或修改ERP合同对话框 -->
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form ref="financeERPContractRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="合同编号" prop="contractNumber">
          <el-input v-model="form.contractNumber" placeholder="请输入合同编号" />
        </el-form-item>
        <el-form-item label="合同类别" prop="contractType">
          <el-select v-model="form.contractType" placeholder="请选择合同类别" clearable>
            <el-option
              v-for="item in contractTypeList"
              :key="item.contractTypeId"
              :label="item.contractTypeName"
              :value="item.contractTypeId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="单位" prop="company">
          <el-input v-model="form.company" placeholder="请输入单位" />
        </el-form-item>
        <el-form-item label="适用范围" prop="contractRange">
          <el-input v-model="form.contractRange" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="合同总金额" prop="contractAmount">
          <el-input v-model="form.contractAmount" placeholder="请输入合同总金额" />
        </el-form-item>
        <el-form-item label="合同有效期间" prop="contractDuration">
          <el-input v-model="form.contractDuration" placeholder="请输入合同有效期间" />
        </el-form-item>
        <el-form-item label="让利" prop="profitAbalienation">
          <el-input v-model="form.profitAbalienation" placeholder="请输入让利" />
        </el-form-item>
        <el-form-item label="质保期" prop="warranty">
          <el-input v-model="form.warranty" placeholder="请输入质保期" />
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

<script setup name="FinanceERPContract">
import {
  listFinanceERPContract,
  getFinanceERPContract,
  delFinanceERPContract,
  addFinanceERPContract,
  updateFinanceERPContract
} from '@/api/biz/finance/financeERPContract'

const { proxy } = getCurrentInstance()

const financeERPContractList = ref([])
const open = ref(false)
const buttonLoading = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref('')

const contractTypeList = ref([
  { contractTypeId: '1', contractTypeName: '框架协议' },
  { contractTypeId: '2', contractTypeName: '单签合同' }
])

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    contractNumber: undefined,
    contractType: undefined,
    company: undefined,
    contractRange: undefined
  },
  rules: {
    contractNumber: [{ required: true, message: '合同编号不能为空', trigger: 'blur' }],
    contractType: [{ required: true, message: '合同类别不能为空', trigger: 'blur' }]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询ERP合同列表 */
function getList() {
  loading.value = true
  listFinanceERPContract(queryParams.value).then((response) => {
    financeERPContractList.value = response.rows
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
    contractId: null,
    contractNumber: null,
    contractType: null,
    company: null,
    contractRange: null,
    contractAmount: null,
    contractDuration: null,
    profitAbalienation: null,
    warranty: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  }
  proxy.resetForm('financeERPContractRef')
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
  ids.value = selection.map((item) => item.contractId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = '添加ERP合同'
}

/** 修改按钮操作 */
function handleUpdate(row) {
  loading.value = true
  reset()
  const _contractId = row.contractId || ids.value
  getFinanceERPContract(_contractId).then((response) => {
    loading.value = false
    form.value = response.data
    open.value = true
    title.value = '修改ERP合同'
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs['financeERPContractRef'].validate((valid) => {
    if (valid) {
      buttonLoading.value = true
      if (form.value.contractId != null) {
        updateFinanceERPContract(form.value)
          .then((response) => {
            proxy.$modal.msgSuccess('修改成功')
            open.value = false
            getList()
          })
          .finally(() => {
            buttonLoading.value = false
          })
      } else {
        addFinanceERPContract(form.value)
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
  const _contractIds = row.contractId || ids.value
  proxy.$modal
    .confirm('是否确认删除ERP合同编号为"' + _contractIds + '"的数据项？')
    .then(function () {
      loading.value = true
      return delFinanceERPContract(_contractIds)
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
    'biz/finance/erpcontract/export',
    {
      ...queryParams.value
    },
    `financeERPContract_${new Date().getTime()}.xlsx`
  )
}

/** 返回按钮操作 */
function handleClose() {
  const obj = { path: '/biz/finance/erpproject' }
  proxy.$tab.closeOpenPage(obj)
}

getList()
</script>
