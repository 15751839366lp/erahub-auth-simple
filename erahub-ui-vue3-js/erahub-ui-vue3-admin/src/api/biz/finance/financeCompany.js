import request from '@/utils/request'

// 查询单位管理列表
export function listFinanceCompany(query) {
  return request({
    url: '/biz/finance/company/list',
    method: 'get',
    params: query
  })
}

// 查询单位管理详细
export function getFinanceCompany(companyId) {
  return request({
    url: '/biz/finance/company/' + companyId,
    method: 'get'
  })
}

// 新增单位管理
export function addFinanceCompany(data) {
  return request({
    url: '/biz/finance/company',
    method: 'post',
    data: data
  })
}

// 修改单位管理
export function updateFinanceCompany(data) {
  return request({
    url: '/biz/finance/company',
    method: 'put',
    data: data
  })
}

// 删除单位管理
export function delFinanceCompany(companyId) {
  return request({
    url: '/biz/finance/company/' + companyId,
    method: 'delete'
  })
}
