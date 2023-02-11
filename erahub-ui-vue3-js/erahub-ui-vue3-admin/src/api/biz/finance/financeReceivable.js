import request from '@/utils/request'

// 查询应收管理列表
export function listFinanceReceivable(query) {
  return request({
    url: '/biz/finance/receivable/list',
    method: 'get',
    params: query
  })
}

// 查询应收管理详细
export function getFinanceReceivable(receivableId) {
  return request({
    url: '/biz/finance/receivable/' + receivableId,
    method: 'get'
  })
}

// 新增应收管理
export function addFinanceReceivable(data) {
  return request({
    url: '/biz/finance/receivable',
    method: 'post',
    data: data
  })
}

// 修改应收管理
export function updateFinanceReceivable(data) {
  return request({
    url: '/biz/finance/receivable',
    method: 'put',
    data: data
  })
}

// 删除应收管理
export function delFinanceReceivable(receivableId) {
  return request({
    url: '/biz/finance/receivable/' + receivableId,
    method: 'delete'
  })
}
