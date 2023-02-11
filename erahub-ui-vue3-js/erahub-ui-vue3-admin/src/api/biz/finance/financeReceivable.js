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

// 获取所有税率
export function listAllTaxRate() {
  return request({
    url: '/biz/finance/receivable/selectAllTaxRate',
    method: 'get'
  })
}

// 获取所有财务部项目负责人
export function listAllFinanceProjectResponsiblePerson() {
  return request({
    url: '/biz/finance/receivable/selectAllFinanceProjectResponsiblePerson',
    method: 'get'
  })
}

// 获取所有经营部项目负责人
export function listAllOperationProjectResponsiblePerson() {
  return request({
    url: '/biz/finance/receivable/selectAllOperationProjectResponsiblePerson',
    method: 'get'
  })
}