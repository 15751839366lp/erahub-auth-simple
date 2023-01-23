import request from '@/utils/request'

// 查询邮件账号列表
export function listMailAccount(query) {
  return request({
    url: '/basicservice/mailAccount/list',
    method: 'get',
    params: query
  })
}

// 查询邮件账号列表
export function getAllMailAccount() {
  return request({
    url: '/basicservice/mailAccount/getAllMailAccount',
    method: 'get'
  })
}

// 查询邮件账号详细
export function getMailAccount(mailAccountId) {
  return request({
    url: '/basicservice/mailAccount/' + mailAccountId,
    method: 'get'
  })
}

// 新增邮件账号
export function addMailAccount(data) {
  return request({
    url: '/basicservice/mailAccount',
    method: 'post',
    data: data
  })
}

// 修改邮件账号
export function updateMailAccount(data) {
  return request({
    url: '/basicservice/mailAccount',
    method: 'put',
    data: data
  })
}

// 删除邮件账号
export function delMailAccount(mailAccountId) {
  return request({
    url: '/basicservice/mailAccount/' + mailAccountId,
    method: 'delete'
  })
}
