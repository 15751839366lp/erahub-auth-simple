<template>
  <div class="app-container home">
    <div>
      <el-card shadow="never">
        <el-skeleton :loading="loading" animated>
          <el-row :gutter="20" justify="space-between">
            <el-col :xl="12" :lg="12" :md="12" :sm="24" :xs="24">
              <div class="flex items-center">
                <img :src="avatar" alt="" class="w-70px h-70px rounded-[50%] mr-20px" />
                <div>
                  <div class="text-20px text-700">
                    {{ 'Welcome' }} {{ nickName }} {{ 'HappyDay' }}
                  </div>
                  <div class="mt-10px text-14px text-gray-500"> {{ 'Toady' }}，20℃ - 32℃！ </div>
                </div>
              </div>
            </el-col>
            <el-col :xl="12" :lg="12" :md="12" :sm="24" :xs="24">
              <div class="flex h-70px items-center justify-end <sm:mt-10px">
                <div class="px-8px text-right">
                  <div class="text-14px text-gray-400 mb-20px">{{ '未收回笔数' }}</div>
                  <count-to
                    class="text-20px"
                    :start-val="0"
                    :end-val="totalSate.total"
                    :duration="1000"
                  ></count-to>
                </div>
                <el-divider direction="vertical" />
                <div class="px-8px text-right">
                  <div class="text-14px text-gray-400 mb-20px mr-10px">{{ '未收回金额' }}</div>
                  <count-to
                    class="text-20px"
                    :start-val="0"
                    :end-val="totalSate.total_arrearage"
                    :decimals="decimals"
                    :duration="1000"
                  ></count-to>
                </div>
                <el-divider direction="vertical" />
                <div class="px-8px text-right">
                  <div class="text-14px text-gray-400 mb-20px mr-10px">{{ '应收回笔数' }}</div>
                  <count-to
                    class="text-20px"
                    :start-val="0"
                    :end-val="totalSate.total_including_tax_price"
                    :decimals="decimals"
                    :duration="1000"
                  ></count-to>
                </div>
                <el-divider direction="vertical" border-style="dashed" />
                <div class="px-8px text-right">
                  <div class="text-14px text-gray-400 mb-20px mr-10px">{{ '质保金' }}</div>
                  <count-to
                    class="text-20px"
                    :start-val="0"
                    :end-val="totalSate.total_warranty_deposit"
                    :decimals="decimals"
                    :duration="1000"
                  ></count-to>
                </div>
              </div>
            </el-col>
          </el-row>
        </el-skeleton>
      </el-card>
    </div>

    <el-row class="mt-10px" :gutter="20" justify="space-between">
      <el-col :xl="13" :lg="13" :md="24" :sm="24" :xs="24" class="mb-20px">
        <el-card shadow="never" class="mt-10px">
          <el-skeleton :loading="loading" animated>
            <el-row :gutter="20" justify="space-between">
              <el-col :xl="12" :lg="12" :md="24" :sm="24" :xs="24">
                <el-card shadow="hover" class="mb-20px">
                  <el-skeleton :loading="loading" animated>
                    <Echart
                      :options="pieOptionsData"
                      :height="300"
                      @clickFunction="pieChartClick"
                    />
                  </el-skeleton>
                </el-card>
              </el-col>
              <el-col :xl="12" :lg="12" :md="24" :sm="24" :xs="24">
                <el-card shadow="hover" class="mb-20px">
                  <el-skeleton :loading="loading" animated>
                    <Echart
                      :options="barOptionsData"
                      :height="300"
                      @clickFunction="barChartClick"
                    />
                  </el-skeleton>
                </el-card>
              </el-col>
              <el-col :span="24">
                <el-card shadow="hover" class="mb-20px">
                  <el-skeleton :loading="loading" animated :rows="4">
                    <Echart
                      :options="lineOptionsData"
                      :height="350"
                      @clickFunction="lineChartClick"
                    />
                  </el-skeleton>
                </el-card>
              </el-col>
            </el-row>
          </el-skeleton>
        </el-card>
      </el-col>
      <el-col :xl="11" :lg="11" :md="24" :sm="24" :xs="24" class="mb-20px">
        <el-card shadow="never" class="mt-10px">
          <el-skeleton :loading="loading" animated>
            <el-button type="primary" icon="Refresh" @click="handleRefresh">重制</el-button>
            <el-table
              v-loading="tableLoading"
              :data="financeReceivableList"
              v-if="showTable"
              border
              class="mt-10px"
            >
              <el-table-column label="应收账款ID" align="center" prop="receivableId" v-if="false" />
              <el-table-column
                label="开票日期"
                align="center"
                prop="invoicingDate"
                width="110"
                fixed
              >
                <template #default="scope">
                  <span>{{ parseTime(scope.row.invoicingDate, '{y}-{m}-{d}') }}</span>
                </template>
              </el-table-column>
              <el-table-column
                label="单位名称"
                align="center"
                prop="company.companyName"
                width="100"
                fixed
                show-overflow-tooltip
              />
              <el-table-column
                label="应收余额"
                align="center"
                prop="arrearage"
                width="120"
                show-overflow-tooltip
              />
              <el-table-column
                label="开票金额(含税价)"
                align="center"
                prop="includingTaxPrice"
                width="90"
                show-overflow-tooltip
              />
              <el-table-column
                label="税率"
                align="center"
                prop="taxRate"
                width="80"
                show-overflow-tooltip
              />
              <el-table-column label="工程编号" align="center" prop="projectNumber" width="100" />
              <el-table-column
                label="操作"
                align="center"
                class-name="small-padding fixed-width"
                width="100"
                fixed="right"
              >
                <template #default="scope">
                  <el-button link type="primary" icon="Operation" @click="handleShowInfo(scope.row)"
                    >详情</el-button
                  >
                </template>
              </el-table-column>
            </el-table>
            <pagination
              v-show="total > 0"
              :total="total"
              :pager-count="5"
              layout="total, prev, pager, next, jumper"
              v-model:page="queryParams.pageNum"
              v-model:limit="queryParams.pageSize"
              @pagination="getList"
            />
          </el-skeleton>
        </el-card>
      </el-col>
    </el-row>

    <el-dialog title="应收详情" v-model="financeReceivableInfoOpen" width="800px" append-to-body>
      <el-form ref="financeReceivableRef" :model="financeReceivableInfoForm" label-width="150px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="发布时间：">{{
              parseTime(financeReceivableInfoForm.invoicingDate, '{y}-{m}-{d}')
            }}</el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="单位编号：" prop="companyNumber">
              {{ financeReceivableInfoForm.company.companyNumber }}
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="单位名称：" prop="companyName">
              {{ financeReceivableInfoForm.company.companyName }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="工程编号：" prop="projectNumber">
              {{ financeReceivableInfoForm.projectNumber }}
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="工程名称：" prop="projectName">
              {{ financeReceivableInfoForm.projectName }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="税率：" prop="taxRate">
              {{ financeReceivableInfoForm.taxRate }}
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="不含税金额：" prop="excludingTaxPrice">
              {{ financeReceivableInfoForm.excludingTaxPrice }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="开票金额(含税价)：" prop="includingTaxPrice">
              {{ financeReceivableInfoForm.includingTaxPrice }}
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="质保金：" prop="warrantyDeposit">
              {{ financeReceivableInfoForm.warrantyDeposit }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="收款金额：" prop="accountPaid">
              {{ financeReceivableInfoForm.accountPaid }}
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="应收余额：" prop="arrearage">
              {{ financeReceivableInfoForm.arrearage }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="收款状态：">
              {{ biz_finance_receivable_status[financeReceivableInfoForm.status || '0'].label }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="项目经理：" prop="projectManager">
              {{ financeReceivableInfoForm.projectManager }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="财务部项目负责人：" prop="financeProjectResponsiblePerson">
              {{ financeReceivableInfoForm.financeProjectResponsiblePerson }}
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="经营部项目负责人：" prop="operationProjectResponsiblePerson">
              {{ financeReceivableInfoForm.operationProjectResponsiblePerson }}
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="备注：" prop="remark">
              {{ financeReceivableInfoForm.remark }}
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="financeReceivableInfoOpen = false">关 闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Index">
import { ElRow, ElCol, ElSkeleton, ElCard, ElDivider } from 'element-plus'
import Echart from '@/components/Echart'
import { set } from 'lodash-es'
import { barOptions, lineOptions } from '@/data/echarts-data'
import useUserStore from '@/store/modules/user'
import {
  listFinanceReceivable,
  listStatisticsData,
  listArrearageGroupByCompanyName
} from '@/api/biz/finance/financeReceivable'

const { proxy } = getCurrentInstance()
const { biz_finance_receivable_status } = proxy.useDict('biz_finance_receivable_status')
// const router = useRouter()
const userStore = useUserStore()

const loading = ref(true)
const avatar = userStore.avatar
const nickName = userStore.nickName

//count-to 的小数位数
const decimals = ref(2)

//列表详细数据
const financeReceivableList = ref([])
const financeReceivableInfoForm = ref(null)
const financeReceivableInfoOpen = ref(false)
const showTable = ref(true)
const tableLoading = ref(true)
const total = ref(0)
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
    operationProjectResponsiblePerson: undefined,
    status: '0'
  },
  statisticsParams: {
    pageNum: 1,
    pageSize: 10,

    arrearageCompanyStatus: '0',
    arrearageReceivableStatus: '0',
    arrearageRanking: 10,

    // arrearageCompanyStatus: '0',
    // arrearageResponsibleStatus: '0',
    // arrearageRanking: 10,

    // arrearageCompanyStatus: '0',
    // arrearageResponsibleStatus: '0',
    // arrearageRanking: 10,

    companyStatus: '0',
    receivableStatus: '0'
  },
  rules: {}
})
const { queryParams, statisticsParams } = toRefs(data)

// 获取统计数
let totalSate = reactive({
  total_including_tax_price: 0,
  total_arrearage: 0,
  total_warranty_deposit: 0,
  total: 0
})

const getStatisticsCount = async () => {
  listStatisticsData(statisticsParams.value).then((response) => {
    //将字符串转为数值
    response.data.total_including_tax_price = Number(response.data.total_including_tax_price)
    response.data.total_arrearage = Number(response.data.total_arrearage)
    response.data.total_warranty_deposit = Number(response.data.total_warranty_deposit)
    response.data.total = Number(response.data.total)

    totalSate = Object.assign(totalSate, response.data)
  })
}

// 单位未收款
const pieOptionsData = reactive({
  title: {
    text: '单位未收款（top' + statisticsParams.value.arrearageRanking + '）',
    left: 'center'
  },
  tooltip: {
    confine: true,
    trigger: 'item',
    formatter: '{b} <br/> {c} 元 ({d}%)'
  },
  series: [
    {
      name: '单位未收款',
      type: 'pie',
      radius: '55%',
      center: ['50%', '60%'],
      data: []
    }
  ]
})

function pieChartClick(_echartRef) {
  _echartRef.on('click', function (params) {
    reset()
    queryParams.value.companyName = params.name
    getList()
  })
}

const getUserAccessSource = async () => {
  listArrearageGroupByCompanyName(statisticsParams.value).then((response) => {
    if (pieOptionsData != null && pieOptionsData.series != null) {
      pieOptionsData.series[0].data = response.data.map((v) => {
        return {
          name: v.company_name,
          value: v.total_arrearage
        }
      })
    }
  })
}

// 周活跃量
const barOptionsData = reactive(barOptions)

function barChartClick(_echartRef) {
  _echartRef.on('click', function (params) {
    console.log(params.name + ':' + params.data)
  })
}

const getWeeklyUserActivity = async () => {
  const data = [
    { value: 13253, name: '周一' },
    { value: 34235, name: '周二' },
    { value: 26321, name: '周三' },
    { value: 12340, name: '周四' },
    { value: 24643, name: '周五' },
    { value: 1322, name: '周六' },
    { value: 1324, name: '周日' }
  ]
  set(
    barOptionsData,
    'xAxis.data',
    data.map((v) => v.name)
  )
  set(barOptionsData, 'series', [
    {
      name: '每周用户活跃量',
      data: data.map((v) => v.value),
      type: 'bar'
    }
  ])
}

// 每月销售总额
const lineOptionsData = reactive(lineOptions)

function lineChartClick(_echartRef) {
  _echartRef.on('click', function (params) {
    console.log(params.name + ':' + params.data)
  })
}

const getMonthlySales = async () => {
  const data = [
    { estimate: 100, actual: 120, name: '一月' },
    { estimate: 120, actual: 82, name: '二月' },
    { estimate: 161, actual: 91, name: '三月' },
    { estimate: 134, actual: 154, name: '四月' },
    { estimate: 105, actual: 162, name: '五月' },
    { estimate: 160, actual: 140, name: '六月' },
    { estimate: 165, actual: 145, name: '七月' },
    { estimate: 114, actual: 250, name: '八月' },
    { estimate: 163, actual: 134, name: '九月' },
    { estimate: 185, actual: 56, name: '十月' },
    { estimate: 118, actual: 99, name: '十一月' },
    { estimate: 123, actual: 123, name: '十二月' }
  ]
  set(
    lineOptionsData,
    'xAxis.data',
    data.map((v) => v.name)
  )
  set(lineOptionsData, 'series', [
    {
      name: '预计',
      smooth: true,
      type: 'line',
      data: data.map((v) => v.estimate),
      animationDuration: 2800,
      animationEasing: 'cubicInOut'
    },
    {
      name: '实际',
      smooth: true,
      type: 'bar',
      itemStyle: {},
      data: data.map((v) => v.actual),
      animationDuration: 2800,
      animationEasing: 'quadraticOut'
    }
  ])
}

const getAllApi = async () => {
  await Promise.all([
    getStatisticsCount(),
    getUserAccessSource(),
    getWeeklyUserActivity(),
    getMonthlySales()
  ])

  getList()
  loading.value = false
}

/** 重制按钮操作 */
function handleRefresh() {
  reset()
  getList()
}

/** 重制查询条件操作 */
function reset() {
  queryParams.value = {
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
    operationProjectResponsiblePerson: undefined,
    status: '0'
  }
}

/** 查询应收管理列表 */
function getList() {
  tableLoading.value = true
  listFinanceReceivable(queryParams.value).then((response) => {
    financeReceivableList.value = response.rows
    total.value = response.total
    tableLoading.value = false
    showTable.value = true
  })
}

function handleShowInfo(row) {
  financeReceivableInfoForm.value = row
  financeReceivableInfoOpen.value = true
}

getAllApi()
</script>

<style lang="scss" scoped>
@media (max-width: 639.9px) {
  .\<sm\:mt-10px {
    margin-top: 10px;
  }
}
.rounded-\[50\%\] {
  border-radius: 50%;
}
</style>
