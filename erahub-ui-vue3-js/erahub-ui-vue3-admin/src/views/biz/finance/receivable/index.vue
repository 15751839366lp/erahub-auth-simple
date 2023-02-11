<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch">
      <el-form-item label="单位编号" prop="companyNumber">
        <el-input
          v-model="queryParams.companyNumber"
          placeholder="请输入单位编号"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单位名称" prop="companyName">
        <el-input
          v-model="queryParams.companyName"
          placeholder="请输入单位名称"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="工程编号" prop="projectNumber">
        <el-input
          v-model="queryParams.projectNumber"
          placeholder="请输入工程编号"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开票金额" prop="includingTaxPrice">
        <el-input
          v-model="queryParams.includingTaxPrice"
          placeholder="请输入开票金额(含税价)"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开票税率" prop="taxRate">
        <el-select
          v-model="queryParams.taxRate"
          placeholder="请选择开票税率"
          clearable
          style="width: 200px"
        >
          <el-option
            v-for="taxRate in taxRateList"
            :key="taxRate"
            :label="taxRate"
            :value="taxRate"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="上传编号" prop="uploadId">
        <el-input
          v-model="queryParams.uploadId"
          placeholder="请输入上传编号"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="财务负责" prop="financeProjectResponsiblePerson">
        <el-select
          v-model="queryParams.financeProjectResponsiblePerson"
          placeholder="请选择财务部项目负责人"
          clearable
          style="width: 200px"
        >
          <el-option
            v-for="financeProjectResponsiblePerson in financeProjectResponsiblePersonList"
            :key="financeProjectResponsiblePerson"
            :label="financeProjectResponsiblePerson"
            :value="financeProjectResponsiblePerson"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="经营负责" prop="operationProjectResponsiblePerson">
        <el-select
          v-model="queryParams.operationProjectResponsiblePerson"
          placeholder="请选择经营部项目负责人"
          clearable
          style="width: 200px"
        >
          <el-option
            v-for="operationProjectResponsiblePerson in operationProjectResponsiblePersonList"
            :key="operationProjectResponsiblePerson"
            :label="operationProjectResponsiblePerson"
            :value="operationProjectResponsiblePerson"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="开票日期" style="width: 308px">
        <el-date-picker
          v-model="dateRange"
          value-format="YYYY-MM-DD"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          :shortcuts="invoicingDateShortcuts"
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
          v-hasPermi="['biz:finance:receivable:add']"
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
          v-hasPermi="['biz:finance:receivable:edit']"
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
          v-hasPermi="['biz:finance:receivable:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['biz:finance:receivable:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
        :columns="columns"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="financeReceivableList"
      @selection-change="handleSelectionChange"
      border
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="应收账款ID" align="center" prop="receivableId" v-if="false" />
      <el-table-column
        label="开票日期"
        align="center"
        prop="invoicingDate"
        width="110"
        v-if="columns[0].visible"
        fixed
      >
        <template #default="scope">
          <span>{{ parseTime(scope.row.invoicingDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="单位编号"
        align="center"
        prop="company.companyNumber"
        width="120"
        v-if="columns[1].visible"
        fixed
      />
      <el-table-column
        label="单位名称"
        align="center"
        prop="company.companyName"
        width="120"
        v-if="columns[2].visible"
        fixed
      />
      <el-table-column
        label="工程编号"
        align="center"
        prop="projectNumber"
        width="120"
        v-if="columns[3].visible"
        fixed
      />
      <el-table-column
        label="工程名称"
        align="center"
        prop="projectName"
        width="120"
        show-overflow-tooltip
        v-if="columns[4].visible"
      />
      <el-table-column
        label="开票金额(含税价)"
        align="center"
        prop="includingTaxPrice"
        width="140"
        v-if="columns[5].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="税率"
        align="center"
        prop="taxRate"
        width="80"
        v-if="columns[6].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="不含税金额"
        align="center"
        prop="excludingTaxPrice"
        width="120"
        v-if="columns[7].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="收款金额"
        align="center"
        prop="accountPaid"
        width="120"
        v-if="columns[8].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="应收余额"
        align="center"
        prop="arrearage"
        width="120"
        v-if="columns[9].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="质保金"
        align="center"
        prop="warrantyDeposit"
        width="120"
        v-if="columns[10].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="项目经理"
        align="center"
        prop="projectManager"
        width="120"
        v-if="columns[11].visible"
      />
      <el-table-column
        label="财务部项目负责人"
        align="center"
        prop="financeProjectResponsiblePerson"
        width="80"
        v-if="columns[12].visible"
      />
      <el-table-column
        label="经营部项目负责人"
        align="center"
        prop="operationProjectResponsiblePerson"
        width="80"
        v-if="columns[13].visible"
      />
      <el-table-column
        label="上传编号"
        align="center"
        prop="uploadId"
        width="120"
        v-if="columns[14].visible"
      />
      <el-table-column
        label="创建者"
        align="center"
        prop="createBy"
        width="100"
        show-overflow-tooltip
        v-if="columns[15].visible"
      />
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        width="180"
        show-overflow-tooltip
        v-if="columns[16].visible"
      />
      <el-table-column
        label="修改者"
        align="center"
        prop="updateBy"
        width="100"
        show-overflow-tooltip
        v-if="columns[17].visible"
      />
      <el-table-column
        label="修改时间"
        align="center"
        prop="updateTime"
        width="180"
        show-overflow-tooltip
        v-if="columns[18].visible"
      />
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
            v-hasPermi="['biz:finance:receivable:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:finance:receivable:remove']"
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

    <!-- 添加或修改应收管理对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" append-to-body>
      <el-form ref="financeReceivableRef" :model="form" :rules="rules" label-width="150px">
        <el-form-item label="开票日期" prop="invoicingDate">
          <el-date-picker
            clearable
            v-model="form.invoicingDate"
            type="datetime"
            value-format="YYYY-MM-DD HH:mm:ss"
            placeholder="请选择开票日期"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="单位编号" prop="companyNumber">
          <el-input v-model="form.companyNumber" placeholder="请输入单位编号" />
        </el-form-item>
        <el-form-item label="单位名称" prop="companyName">
          <el-input v-model="form.companyName" placeholder="请输入单位名称" />
        </el-form-item>
        <el-form-item label="工程编号" prop="projectNumber">
          <el-input v-model="form.projectNumber" placeholder="请输入工程编号" />
        </el-form-item>
        <el-form-item label="工程名称" prop="projectName">
          <el-input v-model="form.projectName" placeholder="请输入工程名称" />
        </el-form-item>
        <el-form-item label="开票金额(含税价)" prop="includingTaxPrice">
          <el-input v-model="form.includingTaxPrice" placeholder="请输入开票金额(含税价)" />
        </el-form-item>
        <el-form-item label="税率" prop="taxRate">
          <el-input v-model="form.taxRate" placeholder="请输入税率" />
        </el-form-item>
        <el-form-item label="不含税金额" prop="excludingTaxPrice">
          <el-input v-model="form.excludingTaxPrice" placeholder="请输入不含税金额" />
        </el-form-item>
        <el-form-item label="收款金额" prop="accountPaid">
          <el-input v-model="form.accountPaid" placeholder="请输入收款金额" />
        </el-form-item>
        <el-form-item label="应收余额" prop="arrearage">
          <el-input v-model="form.arrearage" placeholder="请输入应收余额" />
        </el-form-item>
        <el-form-item label="质保金" prop="warrantyDeposit">
          <el-input v-model="form.warrantyDeposit" placeholder="请输入质保金" />
        </el-form-item>
        <el-form-item label="项目经理" prop="projectManager">
          <el-input v-model="form.projectManager" placeholder="请输入项目经理" />
        </el-form-item>
        <el-form-item label="财务部项目负责人" prop="financeProjectResponsiblePerson">
          <el-input
            v-model="form.financeProjectResponsiblePerson"
            placeholder="请输入财务部项目负责人"
          />
        </el-form-item>
        <el-form-item label="经营部项目负责人" prop="operationProjectResponsiblePerson">
          <el-input
            v-model="form.operationProjectResponsiblePerson"
            placeholder="请输入经营部项目负责人"
          />
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

<script setup name="FinanceReceivable">
import {
  listFinanceReceivable,
  getFinanceReceivable,
  delFinanceReceivable,
  addFinanceReceivable,
  updateFinanceReceivable,
  listAllTaxRate,
  listAllFinanceProjectResponsiblePerson,
  listAllOperationProjectResponsiblePerson
} from '@/api/biz/finance/financeReceivable'

const { proxy } = getCurrentInstance()

const taxRateList = ref([])
const financeProjectResponsiblePersonList = ref([])
const operationProjectResponsiblePersonList = ref([])

const financeReceivableList = ref([])
const open = ref(false)
const buttonLoading = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref('')

//日期选择
const dateRange = ref([])
const invoicingDateShortcuts = ref([
  {
    text: '近1周',
    value: () => {
      const end = new Date()
      const start = new Date()
      start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
      return [start, end]
    }
  },
  {
    text: '近1个月',
    value: () => {
      const end = new Date()
      const start = new Date()
      start.setTime(start.getTime() - 3600 * 1000 * 24 * 30)
      return [start, end]
    }
  },
  {
    text: '1-3个月之间',
    value: () => {
      const end = new Date()
      const start = new Date()
      end.setTime(start.getTime() - 3600 * 1000 * 24 * 30)
      start.setTime(start.getTime() - 3600 * 1000 * 24 * 90)
      return [start, end]
    }
  },
  {
    text: '3-12个月之间',
    value: () => {
      const end = new Date()
      const start = new Date()
      end.setTime(start.getTime() - 3600 * 1000 * 24 * 90)
      start.setTime(start.getTime() - 3600 * 1000 * 24 * 365)
      return [start, end]
    }
  }
])

// 列显隐信息
const columns = ref([
  { key: 0, label: `开票日期`, visible: true },
  { key: 1, label: `单位编号`, visible: false },
  { key: 2, label: `单位名称`, visible: true },
  { key: 3, label: `工程编号`, visible: true },
  { key: 4, label: `工程名称`, visible: false },
  { key: 5, label: `开票金额（含税价）`, visible: true },
  { key: 6, label: `税率`, visible: true },
  { key: 7, label: `不含税金额`, visible: true },
  { key: 8, label: `收款金额`, visible: true },
  { key: 9, label: `应收余额`, visible: true },
  { key: 10, label: `质保金`, visible: true },
  { key: 11, label: `项目经理`, visible: false },
  { key: 12, label: `财务部项目负责人`, visible: true },
  { key: 13, label: `经营部项目负责人`, visible: true },
  { key: 14, label: `上传编号`, visible: true },
  { key: 15, label: `创建者`, visible: false },
  { key: 16, label: `创建时间`, visible: false },
  { key: 17, label: `修改者`, visible: false },
  { key: 18, label: `修改时间`, visible: false }
])

//校验单位信息
const companyValidation = (rule, value, callback) => {
  if (!form.value.companyNumber && !form.value.companyName) {
    callback(new Error('单位编号和单位名称不能都为空'))
  } else {
    callback()
  }
}
//校验金额信息
const priceValidation = (rule, value, callback) => {
  // if (!form.value.companyNumber && !form.value.companyName) {
  //   callback(new Error('单位编号和单位名称不能都为空'))
  // } else {
  //   callback()
  // }
}
const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    invoicingDate: undefined,
    companyNumber: undefined,
    companyName: undefined,
    projectNumber: undefined,
    includingTaxPrice: undefined,
    taxRate: undefined,
    uploadId: undefined,
    financeProjectResponsiblePerson: undefined,
    operationProjectResponsiblePerson: undefined
  },
  rules: {
    invoicingDate: [{ required: true, message: '开票日期不能为空', trigger: 'blur' }],
    companyNumber: [
      { validator: companyValidation, trigger: 'blur' }
    ],
    companyName: [
      { validator: companyValidation, trigger: 'blur' }
    ],
    projectNumber: [{ required: true, message: '工程编号不能为空', trigger: 'blur' }],
    includingTaxPrice: [{ required: true, message: '开票金额(含税价)不能为空', trigger: 'blur' }],
    taxRate: [{ required: true, message: '税率不能为空', trigger: 'blur' }],
    excludingTaxPrice: [{ required: true, message: '不含税金额不能为空', trigger: 'blur' }],
    financeProjectResponsiblePerson: [
      { required: true, message: '财务部项目负责人不能为空', trigger: 'blur' }
    ],
    operationProjectResponsiblePerson: [
      { required: true, message: '经营部项目负责人不能为空', trigger: 'blur' }
    ]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询应收管理列表 */
function getList() {
  loading.value = true
  listFinanceReceivable(proxy.addDateRange(queryParams.value, dateRange.value)).then((response) => {
    financeReceivableList.value = response.rows
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
    receivableId: null,
    invoicingDate: null,
    companyNumber: null,
    companyName: null,
    projectNumber: null,
    projectName: null,
    includingTaxPrice: null,
    taxRate: null,
    excludingTaxPrice: null,
    accountPaid: null,
    arrearage: null,
    warrantyDeposit: null,
    projectManager: null,
    uploadId: null,
    financeProjectResponsiblePerson: null,
    operationProjectResponsiblePerson: null,
    receivableType: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  }
  proxy.resetForm('financeReceivableRef')
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
  ids.value = selection.map((item) => item.receivableId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = '添加应收管理'
}

/** 修改按钮操作 */
function handleUpdate(row) {
  loading.value = true
  reset()
  const _receivableId = row.receivableId || ids.value
  getFinanceReceivable(_receivableId).then((response) => {
    loading.value = false
    form.value = response.data
    if (response.data.company != null && response.data.company != undefined) {
      form.value.companyNumber = response.data.company.companyNumber
      form.value.companyName = response.data.company.companyName
    }
    open.value = true
    title.value = '修改应收管理'
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs['financeReceivableRef'].validate((valid) => {
    if (valid) {
      buttonLoading.value = true
      if (form.value.receivableId != null) {
        updateFinanceReceivable(form.value)
          .then((response) => {
            proxy.$modal.msgSuccess('修改成功')
            open.value = false
            getAllListData()
            getList()
          })
          .finally(() => {
            buttonLoading.value = false
          })
      } else {
        addFinanceReceivable(form.value)
          .then((response) => {
            proxy.$modal.msgSuccess('新增成功')
            open.value = false
            getAllListData()
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
  const _receivableIds = row.receivableId || ids.value
  proxy.$modal
    .confirm('是否确认删除应收管理编号为"' + _receivableIds + '"的数据项？')
    .then(function () {
      loading.value = true
      return delFinanceReceivable(_receivableIds)
    })
    .then(() => {
      loading.value = true
      getAllListData()
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
    'biz/finance/receivable/export',
    {
      ...queryParams.value
    },
    `financeReceivable_${new Date().getTime()}.xlsx`
  )
}

/** 获取所有初始数据 */
function getAllListData() {
  getAllTaxRate()
  getAllFinanceProjectResponsiblePerson()
  getAllOperationProjectResponsiblePerson()
}

/** 获取所有税率 */
function getAllTaxRate() {
  listAllTaxRate().then((response) => {
    taxRateList.value = response.data
  })
}

/** 获取所有财务部项目负责人 */
function getAllFinanceProjectResponsiblePerson() {
  listAllFinanceProjectResponsiblePerson().then((response) => {
    financeProjectResponsiblePersonList.value = response.data
  })
}

/** 获取所有经营部项目负责人 */
function getAllOperationProjectResponsiblePerson() {
  listAllOperationProjectResponsiblePerson().then((response) => {
    operationProjectResponsiblePersonList.value = response.data
  })
}

getAllListData()
getList()
</script>
