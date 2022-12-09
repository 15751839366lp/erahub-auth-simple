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
                  <div class="text-14px text-gray-400 mb-20px">{{ '项目数' }}</div>
                  <span
                    class="text-20px"
                    :start-val="0"
                    :end-val="totalSate.access"
                    :duration="2600"
                    >{{ 20 }}</span
                  >
                </div>
                <el-divider direction="vertical" />
                <div class="px-8px text-right">
                  <div class="text-14px text-gray-400 mb-20px">{{ '待办' }}</div>
                  <span
                    class="text-20px"
                    :start-val="0"
                    :end-val="totalSate.access"
                    :duration="2600"
                    >{{ 10 }}</span
                  >
                </div>
                <el-divider direction="vertical" border-style="dashed" />
                <div class="px-8px text-right">
                  <div class="text-14px text-gray-400 mb-20px">{{ '项目访问' }}</div>
                  <span
                    class="text-20px"
                    :start-val="0"
                    :end-val="totalSate.access"
                    :duration="2600"
                    >{{ 1234 }}</span
                  >
                </div>
              </div>
            </el-col>
          </el-row>
        </el-skeleton>
      </el-card>
    </div>

    <el-row class="mt-10px" :gutter="20" justify="space-between">
      <el-col :xl="16" :lg="16" :md="24" :sm="24" :xs="24" class="mb-20px">
        <el-card shadow="never">
          <template #header>
            <div class="flex justify-between">
              <span>{{ '项目类别' }}</span>
              <el-link type="primary" :underline="false">{{ '更多' }}</el-link>
            </div>
          </template>
          <el-skeleton :loading="loading" animated>
            <el-row>
              <el-col
                v-for="(item, index) in projects"
                :key="`card-${index}`"
                :xl="8"
                :lg="8"
                :md="12"
                :sm="24"
                :xs="24"
              >
                <el-card shadow="hover">
                  <div class="flex items-center">
                    <Iconify :icon="item.icon" :size="25" class="mr-10px" />
                    <span class="text-16px">{{ item.name }}</span>
                  </div>
                  <div class="mt-15px text-14px text-gray-400">{{ item.message }}</div>
                  <div class="mt-20px text-12px text-gray-400 flex justify-between">
                    <span>{{ item.personal }}</span>
                    <span>{{ formatTime(item.time, 'yyyy-MM-dd') }}</span>
                  </div>
                </el-card>
              </el-col>
            </el-row>
          </el-skeleton>
        </el-card>

        <el-card shadow="never" class="mt-10px">
          <el-skeleton :loading="loading" animated>
            <el-row :gutter="20" justify="space-between">
              <el-col :xl="10" :lg="10" :md="24" :sm="24" :xs="24">
                <el-card shadow="hover" class="mb-20px">
                  <el-skeleton :loading="loading" animated>
                    <Echart :options="pieOptionsData" :height="300" />
                  </el-skeleton>
                </el-card>
              </el-col>
              <el-col :xl="14" :lg="14" :md="24" :sm="24" :xs="24">
                <el-card shadow="hover" class="mb-20px">
                  <el-skeleton :loading="loading" animated>
                    <Echart :options="barOptionsData" :height="300" />
                  </el-skeleton>
                </el-card>
              </el-col>
              <el-col :span="24">
                <el-card shadow="hover" class="mb-20px">
                  <el-skeleton :loading="loading" animated :rows="4">
                    <Echart :options="lineOptionsData" :height="350" />
                  </el-skeleton>
                </el-card>
              </el-col>
            </el-row>
          </el-skeleton>
        </el-card>
      </el-col>
      <el-col :xl="8" :lg="8" :md="24" :sm="24" :xs="24" class="mb-20px">
        <el-card shadow="never">
          <template #header>
            <span>{{ '快捷入口' }}</span>
          </template>
          <el-skeleton :loading="loading" animated>
            <el-row>
              <el-col v-for="item in shortcut" :key="`team-${item.name}`" :span="8" class="mb-20px">
                <div class="flex items-center">
                  <Iconify :icon="item.icon" class="mr-10px" />
                  <el-link type="default" :underline="false" :href="item.url">
                    {{ item.name }}
                  </el-link>
                </div>
              </el-col>
            </el-row>
          </el-skeleton>
        </el-card>
        <el-card shadow="never" class="mt-10px">
          <template #header>
            <div class="flex justify-between">
              <span>{{ '通知公告' }}</span>
              <el-link type="primary" :underline="false">{{ '更多' }}</el-link>
            </div>
          </template>
          <el-skeleton :loading="loading" animated>
            <div v-for="(item, index) in notice" :key="`dynamics-${index}`">
              <div class="flex items-center">
                <img :src="avatar" alt="" class="w-35px h-35px rounded-[50%] mr-20px" />
                <div>
                  <div class="text-14px">
                    <Highlight :keys="item.keys.map((v) => v)">
                      {{ item.type }} : {{ item.title }}
                    </Highlight>
                  </div>
                  <div class="mt-15px text-12px text-gray-400">
                    {{ formatTime(item.date, 'yyyy-MM-dd') }}
                  </div>
                </div>
              </div>
              <el-divider />
            </div>
          </el-skeleton>
        </el-card>
        <el-card shadow="never" class="mt-10px">
          <template #header>
            <span>{{ '指数' }}</span>
          </template>
          <el-skeleton :loading="loading" animated>
            <Echart :options="radarOptionData" :height="400" />
          </el-skeleton>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Index">
import { ElRow, ElCol, ElSkeleton, ElCard, ElDivider } from 'element-plus'
import Echart from '@/components/Echart'
import { set } from 'lodash-es'
import { pieOptions, barOptions, lineOptions, radarOption } from '@/data/echarts-data'
import useUserStore from '@/store/modules/user'
import { formatTime } from '@/utils'

const userStore = useUserStore()
const loading = ref(true)
const avatar = userStore.avatar
const nickName = userStore.nickName

// 获取统计数
let totalSate = reactive({
  project: 0,
  access: 0,
  todo: 0
})

const getCount = async () => {
  const data = {
    project: 40,
    access: 2340,
    todo: 10
  }
  totalSate = Object.assign(totalSate, data)
}

// // 获取项目数
let projects = reactive([])
const getProject = async () => {
  const data = [
    {
      name: 'Github',
      icon: 'akar-icons:github-fill',
      message: 'Github简介',
      personal: 'Archer',
      time: new Date()
    },
    {
      name: 'Vue',
      icon: 'logos:vue',
      message: 'Vue简介',
      personal: 'Archer',
      time: new Date()
    },
    {
      name: 'Angular',
      icon: 'logos:angular-icon',
      message: 'Vue简介',
      personal: 'Archer',
      time: new Date()
    },
    {
      name: 'React',
      icon: 'logos:react',
      message: 'React简介',
      personal: 'Archer',
      time: new Date()
    },
    {
      name: 'Webpack',
      icon: 'logos:webpack',
      message: 'Webpack简介',
      personal: 'Archer',
      time: new Date()
    },
    {
      name: 'Vite',
      icon: 'vscode-icons:file-type-vite',
      message: 'Vite简介',
      personal: 'Archer',
      time: new Date()
    }
  ]
  projects = Object.assign(projects, data)
}

// 获取通知公告
let notice = reactive([])
const getNotice = async () => {
  const data = [
    {
      title: '系统升级版本',
      type: '通知',
      keys: ['通知', '升级'],
      date: new Date()
    },
    {
      title: '系统凌晨维护',
      type: '公告',
      keys: ['公告', '维护'],
      date: new Date()
    },
    {
      title: '系统升级版本',
      type: '通知',
      keys: ['通知', '升级'],
      date: new Date()
    },
    {
      title: '系统凌晨维护',
      type: '公告',
      keys: ['公告', '维护'],
      date: new Date()
    }
  ]
  notice = Object.assign(notice, data)
}

// 获取快捷入口
let shortcut = reactive([])

const getShortcut = async () => {
  const data = [
    {
      name: 'Github',
      icon: 'akar-icons:github-fill',
      url: 'https://github.com/'
    },
    {
      name: 'Vue',
      icon: 'logos:vue',
      url: 'https://cn.vuejs.org/'
    },
    {
      name: 'Vite',
      icon: 'vscode-icons:file-type-vite',
      url: 'https://cn.vitejs.dev/'
    },
    {
      name: 'Angular',
      icon: 'logos:angular-icon',
      url: 'https://angular.cn/'
    },
    {
      name: 'React',
      icon: 'logos:react',
      url: 'https://react.docschina.org/'
    },
    {
      name: 'Webpack',
      icon: 'logos:webpack',
      url: 'https://www.webpackjs.com/'
    }
  ]
  shortcut = Object.assign(shortcut, data)
}

// 获取指数
let radarOptionData = reactive(radarOption)

const getRadar = async () => {
  const data = [
    { name: '引用', max: 65, personal: 42, team: 50 },
    { name: '贡献', max: 160, personal: 30, team: 140 },
    { name: '热度', max: 300, personal: 20, team: 28 },
    { name: '产量', max: 130, personal: 35, team: 35 },
    { name: '关注', max: 100, personal: 80, team: 90 }
  ]
  set(
    radarOptionData,
    'radar.indicator',
    data.map((v) => {
      return {
        name: v.name,
        max: v.max
      }
    })
  )
  set(radarOptionData, 'series', [
    {
      name: '指数',
      type: 'radar',
      data: [
        {
          value: data.map((v) => v.personal),
          name: '个人'
        },
        {
          value: data.map((v) => v.team),
          name: '团队'
        }
      ]
    }
  ])
}

const pieOptionsData = reactive(pieOptions)

// 用户来源
const getUserAccessSource = async () => {
  const data = [
    { value: 335, name: '直接访问' },
    { value: 310, name: '邮件营销' },
    { value: 234, name: '联盟广告' },
    { value: 135, name: '视频广告' },
    { value: 1548, name: '搜索引擎' }
  ]
  set(
    pieOptionsData,
    'legend.data',
    data.map((v) => v.name)
  )
  if (pieOptionsData != null && pieOptionsData.series != null) {
    pieOptionsData.series[0].data = data.map((v) => {
      return {
        name: v.name,
        value: v.value
      }
    })
  }
}

const barOptionsData = reactive(barOptions)

// 周活跃量
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

const lineOptionsData = reactive(lineOptions)

// 每月销售总额
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
      type: 'line',
      itemStyle: {},
      data: data.map((v) => v.actual),
      animationDuration: 2800,
      animationEasing: 'quadraticOut'
    }
  ])
}

const getAllApi = async () => {
  await Promise.all([
    getCount(),
    getProject(),
    getNotice(),
    getShortcut(),
    getRadar(),
    getUserAccessSource(),
    getWeeklyUserActivity(),
    getMonthlySales()
  ])
  loading.value = false
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
