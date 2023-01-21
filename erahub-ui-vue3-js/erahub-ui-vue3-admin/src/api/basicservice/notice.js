import request from '@/utils/request'

// 查询公告列表
export function listNotice(query) {
  return request({
    url: '/basicservice/notice/list',
    method: 'get',
    params: query
  })
}

// 获取通知公告列表（index展示）
export function selectPageNoticeListByIndex(query) {
  return request({
    url: '/basicservice/notice/selectPageNoticeListByIndex',
    method: 'get',
    params: query
  })
}

// 获取最新通知公告列表
export function getLatestNotice(latestNoticeNumber) {
  return request({
    url: '/basicservice/notice/getLatestNotice/' + latestNoticeNumber,
    method: 'get'
  })
}

// 查询公告详细
export function getNotice(noticeId) {
  return request({
    url: '/basicservice/notice/' + noticeId,
    method: 'get'
  })
}

// 新增公告
export function addNotice(data) {
  return request({
    url: '/basicservice/notice',
    method: 'post',
    data: data
  })
}

// 修改公告
export function updateNotice(data) {
  return request({
    url: '/basicservice/notice',
    method: 'put',
    data: data
  })
}

// 删除公告
export function delNotice(noticeId) {
  return request({
    url: '/basicservice/notice/' + noticeId,
    method: 'delete'
  })
}
