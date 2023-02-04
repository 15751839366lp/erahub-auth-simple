import request from '@/utils/request'

// 查询ERP合同列表
export function listFinanceERPContract(query) {
  return request({
    url: '/biz/finance/erpcontract/list',
    method: 'get',
    params: query
  })
}

// 查询ERP合同详细
export function getFinanceERPContract(contractId) {
  return request({
    url: '/biz/finance/erpcontract/' + contractId,
    method: 'get'
  })
}

// 新增ERP合同
export function addFinanceERPContract(data) {
  return request({
    url: '/biz/finance/erpcontract',
    method: 'post',
    data: data
  })
}

// 修改ERP合同
export function updateFinanceERPContract(data) {
  return request({
    url: '/biz/finance/erpcontract',
    method: 'put',
    data: data
  })
}

// 删除ERP合同
export function delFinanceERPContract(contractId) {
  return request({
    url: '/biz/finance/erpcontract/' + contractId,
    method: 'delete'
  })
}
