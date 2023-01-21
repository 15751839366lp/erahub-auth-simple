<template>
  <div class="app-container">
    <div class="status-menu">
      <span @click="changeStatus(null)" :class="typeMenuClass.all">全部</span>
      <span @click="changeStatus('1')" :class="typeMenuClass.status1"> 通知 </span>
      <span @click="changeStatus('2')" :class="typeMenuClass.status2"> 公告 </span>
    </div>

    <el-empty v-if="!noticeList || noticeList.length == 0" description="暂无通知公告" />
    <div class="items-center" v-for="item of noticeList" :key="item.noticeId">
      <el-card shadow="hover" class="mt-5px" @click="getNoticeInfo(item)" style="cursor: pointer">
        <el-avatar class="user-avatar" :src="item.noticeCreator.avatar" :size="50" />
        <div class="ml-30px" style="display: inline-block">
          <div class="notice-title">{{ item.noticeTypeShow }} : {{ item.noticeTitle }}</div>
          <div class="nick-name"> {{ item.noticeCreator.nickName }}</div>
          <div class="create-time">{{ item.createTime }}</div>
        </div>
      </el-card>
    </div>

    <pagination
      v-show="total > 0"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      :total="total"
      @pagination="getList"
    />

    <!-- 通知公告详情 -->
    <el-dialog title="通知公告详情" v-model="noticeInfoOpen" width="700px" append-to-body>
      <el-form :model="noticeInfoForm" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="标题：">{{ noticeInfoForm.noticeTitle }}</el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="发布者：">{{
              noticeInfoForm.noticeCreator.nickName
            }}</el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="类别：">
              <div v-if="noticeInfoForm.noticeType === '1'">通知</div>
              <div v-else-if="noticeInfoForm.noticeType === '2'">公告</div>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="发布时间：">{{ noticeInfoForm.createTime }}</el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="内容：">{{ noticeInfoForm.noticeContent }}</el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="noticeInfoOpen = false">关 闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>
<script setup name="NoticeList">
import { selectPageNoticeListByIndex } from '@/api/basicservice/notice'

const noticeInfoOpen = ref(false)
const noticeInfoForm = ref({})
const total = ref(0)
const noticeList = ref([])
const queryParams = ref({
  pageNum: 1,
  pageSize: 10,
  noticeType: undefined
})
const typeMenuClass = ref({
  all: 'active-status',
  status1: '',
  status2: ''
})

/** 查询公告列表 */
function getList() {
  selectPageNoticeListByIndex(queryParams.value).then((response) => {
    if (!response) {
      return
    }
    noticeList.value =
      response.rows &&
      response.rows.map((item) => {
        if (item.noticeType == '1') {
          item.noticeTypeShow = '通知'
        } else if (item.noticeType == '2') {
          item.noticeTypeShow = '公告'
        }

        if (!item.noticeCreator.avatar) {
          item.noticeCreator.avatar = defAva
        }
        item.keys = []
        return item
      })
    total.value = response.total
  })
}

//查看公告详情
const getNoticeInfo = (notice) => {
  noticeInfoForm.value = notice
  noticeInfoOpen.value = true
}

/** 改变类别 */
function changeStatus(noticeType) {
  resetQuery()
  if (noticeType == null) {
    typeMenuClass.value.all = 'active-status'
  } else if (noticeType == '1') {
    typeMenuClass.value.status1 = 'active-status'
  } else if (noticeType == '2') {
    typeMenuClass.value.status2 = 'active-status'
  }
  queryParams.value.noticeType = noticeType
  getList()
}
/** 重置操作 */
function resetQuery() {
  typeMenuClass.value = {
    all: '',
    status1: '',
    status2: ''
  }
  queryParams.value = {
    pageNum: 1,
    pageSize: 10,
    noticeType: undefined
  }
}

getList()
</script>

<style lang="scss" scoped>
.status-menu {
  font-size: 15px;
  margin-top: 5px;
  margin-bottom: 20px;
  margin-left: 20px;
  color: #999;
}
.status-menu span {
  margin-right: 24px;
  cursor: pointer;
}
.active-status {
  cursor: pointer;
  color: #333;
  font-weight: bold;
}
.notice-title {
  font-size: 15px;
  font-weight: bold;
  display: flex;
  justify-content: space-between;
}
.create-time {
  color: #999;
  margin-top: 2px;
  font-size: 12px;
}
.nick-name {
  color: #999;
  margin-top: 2px;
  font-size: 12px;
  font-weight: bold;
}
</style>
