import request from '@/utils/request'

// 查询邮件记录列表
export function listMailRecord(query) {
  return request({
    url: '/basicservice/mailRecord/list',
    method: 'get',
    params: query
  })
}

// 查询邮件记录详细
export function getMailRecord(mailRecordId) {
  return request({
    url: '/basicservice/mailRecord/' + mailRecordId,
    method: 'get'
  })
}

// 新增邮件记录
export function sendMail(data) {
  return request({
    url: '/basicservice/mailRecord/send',
    method: 'post',
    data: data
  })
}

// 删除邮件记录
export function delMailRecord(mailRecordId) {
  return request({
    url: '/basicservice/mailRecord/' + mailRecordId,
    method: 'delete'
  })
}
