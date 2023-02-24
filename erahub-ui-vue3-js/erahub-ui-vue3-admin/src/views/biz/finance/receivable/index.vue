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
      <el-form-item label="财务编号" prop="financeProjectNumber">
        <el-input
          v-model="queryParams.financeProjectNumber"
          placeholder="请输入财务编号"
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
      <el-form-item label="收款状态" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="请选择收款状态"
          clearable
          style="width: 200px"
        >
          <el-option
            v-for="dict in biz_finance_receivable_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
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
          type="info"
          plain
          icon="Upload"
          @click="handleImport"
          v-hasPermi="['biz:finance:receivable:import']"
          >导入</el-button
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
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="EditPen"
          @click=""
          v-hasPermi="['biz:finance:receivable:list']"
          >结清</el-button
        >
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
        :columns="columns"
      ></right-toolbar>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="Operation"
          @click="handleReceivableStatistics"
          v-hasPermi="['biz:finance:receivable:statistics']"
          >应收统计</el-button
        >
      </el-col>
    </el-row>

    <el-table
      v-loading="loading"
      :data="financeReceivableList"
      @selection-change="handleSelectionChange"
      :header-cell-class-name="handleHeaderClass"
      @header-click="handleHeaderCLick"
      v-if="showTable"
      border
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="应收账款ID" align="center" prop="receivableId" v-if="false" />
      <el-table-column
        label="开票日期"
        align="center"
        prop="invoicingDate"
        width="110"
        sortable="custom"
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
        label="财务工程编号"
        align="center"
        prop="financeProjectNumber"
        width="120"
        sortable="custom"
        show-overflow-tooltip
        v-if="columns[3].visible"
        fixed
      />
      <el-table-column
        label="工程编号"
        align="center"
        prop="projectNumber"
        width="120"
        sortable="custom"
        show-overflow-tooltip
        v-if="columns[4].visible"
        fixed
      />
      <el-table-column
        label="工程名称"
        align="center"
        prop="projectName"
        width="120"
        show-overflow-tooltip
        v-if="columns[5].visible"
      />
      <el-table-column
        label="开票金额(含税价)"
        align="center"
        prop="includingTaxPrice"
        width="140"
        sortable="custom"
        v-if="columns[6].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="税率"
        align="center"
        prop="taxRate"
        width="80"
        sortable="custom"
        v-if="columns[7].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="不含税金额"
        align="center"
        prop="excludingTaxPrice"
        width="120"
        sortable="custom"
        v-if="columns[8].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="收款金额"
        align="center"
        prop="accountPaid"
        width="120"
        sortable="custom"
        v-if="columns[9].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="应收余额"
        align="center"
        prop="arrearage"
        width="120"
        sortable="custom"
        v-if="columns[10].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="质保金"
        align="center"
        prop="warrantyDeposit"
        width="120"
        sortable="custom"
        v-if="columns[11].visible"
        show-overflow-tooltip
      />
      <el-table-column
        label="项目经理"
        align="center"
        prop="projectManager"
        width="120"
        v-if="columns[12].visible"
      />
      <el-table-column
        label="财务部项目负责人"
        align="center"
        prop="financeProjectResponsiblePerson"
        width="80"
        sortable="custom"
        v-if="columns[13].visible"
      />
      <el-table-column
        label="经营部项目负责人"
        align="center"
        prop="operationProjectResponsiblePerson"
        width="80"
        sortable="custom"
        v-if="columns[14].visible"
      />
      <el-table-column
        label="上传编号"
        align="center"
        prop="uploadId"
        width="120"
        sortable="custom"
        v-if="columns[15].visible"
      />
      <el-table-column
        label="备注"
        align="center"
        prop="remark"
        width="120"
        sortable="custom"
        v-if="columns[16].visible"
      />
      <el-table-column label="收款状态" align="center" prop="status" fixed="right">
        <template #default="scope">
          <dict-tag :options="biz_finance_receivable_status" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column
        label="创建者"
        align="center"
        prop="createBy"
        width="100"
        sortable="custom"
        show-overflow-tooltip
        v-if="columns[17].visible"
      />
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        width="180"
        sortable="custom"
        show-overflow-tooltip
        v-if="columns[18].visible"
      />
      <el-table-column
        label="修改者"
        align="center"
        prop="updateBy"
        width="100"
        show-overflow-tooltip
        v-if="columns[19].visible"
      />
      <el-table-column
        label="修改时间"
        align="center"
        prop="updateTime"
        width="180"
        show-overflow-tooltip
        v-if="columns[20].visible"
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
      <template #empty>
        <div class="flex items-center justify-center h-100%">
          <el-empty />
        </div>
      </template>
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
        <el-row>
          <el-col :span="12">
            <el-form-item label="单位编号" prop="companyNumber">
              <el-input v-model="form.companyNumber" placeholder="请输入单位编号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="单位名称" prop="companyName">
              <el-input v-model="form.companyName" placeholder="请输入单位名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="财务工程编号" prop="financeProjectNumber">
              <el-input v-model="form.financeProjectNumber" placeholder="请输入财务工程编号" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="工程编号" prop="projectNumber">
              <el-input v-model="form.projectNumber" placeholder="请输入工程编号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="工程名称" prop="projectName">
              <el-input v-model="form.projectName" placeholder="请输入工程名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="税率" prop="taxRate">
              <el-input v-model="form.taxRate" placeholder="请输入税率" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="不含税金额" prop="excludingTaxPrice">
              <el-input v-model="form.excludingTaxPrice" placeholder="请输入不含税金额" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="开票金额(含税价)" prop="includingTaxPrice">
              <el-input v-model="form.includingTaxPrice" placeholder="请输入开票金额(含税价)" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="质保金" prop="warrantyDeposit">
              <el-input v-model="form.warrantyDeposit" placeholder="请输入质保金" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="收款金额" prop="accountPaid">
              <el-input v-model="form.accountPaid" placeholder="请输入收款金额" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="应收余额" prop="arrearage">
              <el-input v-model="form.arrearage" placeholder="请输入应收余额" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="收款状态" prop="status">
              <el-select v-model="form.status" placeholder="请选择收款状态">
                <el-option
                  v-for="dict in biz_finance_receivable_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="项目经理" prop="projectManager">
              <el-input v-model="form.projectManager" placeholder="请输入项目经理" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="财务部项目负责人" prop="financeProjectResponsiblePerson">
              <el-input
                v-model="form.financeProjectResponsiblePerson"
                placeholder="请输入财务部项目负责人"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="经营部项目负责人" prop="operationProjectResponsiblePerson">
              <el-input
                v-model="form.operationProjectResponsiblePerson"
                placeholder="请输入经营部项目负责人"
              />
            </el-form-item>
          </el-col>
        </el-row>
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

    <!-- 应收数据导入对话框 -->
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
            <div class="el-upload__tip">
              <el-checkbox v-model="upload.updateSupport" />是否更新已经存在的应收数据
            </div>
            <span>仅允许导入xls、xlsx格式文件。</span>
            <el-link
              type="primary"
              :underline="false"
              style="font-size: 12px; vertical-align: baseline"
              @click="importTemplate"
              >下载模板</el-link
            >
          </div>
        </template>
      </el-upload>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitFileForm"
            >确 定</el-button
          >
          <el-button @click="upload.open = false">取 消</el-button>
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

import { getToken } from '@/utils/auth'

const router = useRouter()
const { proxy } = getCurrentInstance()
const { biz_finance_receivable_status } = proxy.useDict('biz_finance_receivable_status')

const taxRateList = ref([])
const financeProjectResponsiblePersonList = ref([])
const operationProjectResponsiblePersonList = ref([])

const financeReceivableList = ref([])
const open = ref(false)
const showTable = ref(true)
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
  { key: 3, label: `财务工程编号`, visible: true },
  { key: 4, label: `工程编号`, visible: true },
  { key: 5, label: `工程名称`, visible: false },
  { key: 6, label: `开票金额（含税价）`, visible: true },
  { key: 7, label: `税率`, visible: true },
  { key: 8, label: `不含税金额`, visible: true },
  { key: 9, label: `收款金额`, visible: true },
  { key: 10, label: `应收余额`, visible: true },
  { key: 11, label: `质保金`, visible: true },
  { key: 12, label: `项目经理`, visible: false },
  { key: 13, label: `财务部项目负责人`, visible: true },
  { key: 14, label: `经营部项目负责人`, visible: true },
  { key: 15, label: `上传编号`, visible: true },
  { key: 16, label: `备注`, visible: true },
  { key: 17, label: `创建者`, visible: false },
  { key: 18, label: `创建时间`, visible: false },
  { key: 19, label: `修改者`, visible: false },
  { key: 20, label: `修改时间`, visible: false }
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
    financeProjectNumber: undefined,
    projectNumber: undefined,
    includingTaxPrice: undefined,
    taxRate: undefined,
    uploadId: undefined,
    financeProjectResponsiblePerson: undefined,
    operationProjectResponsiblePerson: undefined,
    status: undefined
  },
  rules: {
    invoicingDate: [{ required: true, message: '开票日期不能为空', trigger: 'blur' }],
    companyNumber: [{ validator: companyValidation, trigger: 'blur' }],
    companyName: [{ validator: companyValidation, trigger: 'blur' }],
    includingTaxPrice: [{ required: true, message: '开票金额(含税价)不能为空', trigger: 'blur' }],
    status: [{ required: true, message: '状态不能为空', trigger: 'change' }]
  }
})

const { queryParams, form, rules } = toRefs(data)

/*** 应收数据导入参数 */
const upload = reactive({
  // 是否显示弹出层（应收导入）
  open: false,
  // 弹出层标题（应收导入）
  title: '',
  // 是否禁用上传
  isUploading: false,
  // 是否更新已经存在的应收数据
  updateSupport: 0,
  // 设置上传的请求头部
  headers: { Authorization: 'Bearer ' + getToken() },
  // 上传的地址
  url: import.meta.env.VITE_APP_BASE_API + '/biz/finance/receivable/importData'
})

/** 查询应收管理列表 */
function getList() {
  loading.value = true
  listFinanceReceivable(proxy.addDateRange(queryParams.value, dateRange.value)).then((response) => {
    financeReceivableList.value = response.rows
    total.value = response.total
    loading.value = false
    showTable.value = true
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
    financeProjectNumber: undefined,
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
  showTable.value = false
  dateRange.value = []
  proxy.resetForm('queryRef')
  queryParams.value.orderByColumn = null
  queryParams.value.isAsc = null
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

//排序
// 设置列的排序为我们自定义的排序
function handleHeaderClass({ column }) {
  column.order = column.multiOrder
}
// 点击表头进行排序
function handleHeaderCLick(column) {
  if (column.sortable !== 'custom') {
    return
  }
  switch (column.multiOrder) {
    case 'descending':
      column.multiOrder = 'ascending'
      break
    case 'ascending':
      column.multiOrder = ''
      break
    default:
      column.multiOrder = 'descending'
      break
  }
  handleOrderChange(column.property, column.multiOrder)
}
function handleOrderChange(prop, order) {
  let orderByArr = queryParams.value.orderByColumn ? queryParams.value.orderByColumn.split(',') : []
  let isAscArr = queryParams.value.isAsc ? queryParams.value.isAsc.split(',') : []
  let propIndex = orderByArr.indexOf(prop)
  if (propIndex !== -1) {
    if (order) {
      //排序里已存在 只修改排序
      isAscArr[propIndex] = order
    } else {
      //如果order为null 则删除排序字段和属性
      isAscArr.splice(propIndex, 1) //删除排序
      orderByArr.splice(propIndex, 1) //删除属性
    }
  } else {
    //排序里不存在则新增排序
    orderByArr.push(prop)
    isAscArr.push(order)
  }
  //合并排序
  queryParams.value.orderByColumn = orderByArr.join(',')
  queryParams.value.isAsc = isAscArr.join(',')
  getList()
}

/** 导入按钮操作 */
function handleImport() {
  upload.title = '应收数据导入'
  upload.open = true
}
/** 下载模板操作 */
function importTemplate() {
  proxy.download(
    '/biz/finance/receivable/importTemplate',
    {},
    `financeReceivable_template_${new Date().getTime()}.xlsx`
  )
}
/**文件上传中处理 */
const handleFileUploadProgress = (event, file, fileList) => {
  buttonLoading.value = true
  upload.isUploading = true
}
/** 文件上传成功处理 */
const handleFileSuccess = (response, file, fileList) => {
  upload.open = false
  upload.isUploading = false
  buttonLoading.value = false
  proxy.$refs['uploadRef'].handleRemove(file)
  proxy.$alert(
    "<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" +
      response.msg +
      '</div>',
    '导入结果',
    { dangerouslyUseHTMLString: true }
  )
  getList()
}
/** 提交上传文件 */
function submitFileForm() {
  proxy.$refs['uploadRef'].submit()
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

/** 跳转应收统计 */
function handleReceivableStatistics() {
  router.push({
    path: '/biz/finance/receivable-statistics/index'
  })
}

getAllListData()
getList()
</script>
