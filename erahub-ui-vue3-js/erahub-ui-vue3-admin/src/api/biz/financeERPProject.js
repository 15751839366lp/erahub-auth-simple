import request from '@/utils/request'

// 查询ERP工程明细列表
export function listFinanceERPProject(query) {
  return request({
    url: '/biz/financeERPProject/list',
    method: 'get',
    params: query
  })
}

// 查询ERP工程明细详细
export function getFinanceERPProject(projectId) {
  return request({
    url: '/biz/financeERPProject/' + projectId,
    method: 'get'
  })
}

// 新增ERP工程明细
export function addFinanceERPProject(data) {
  return request({
    url: '/biz/financeERPProject',
    method: 'post',
    data: data
  })
}

// 修改ERP工程明细
export function updateFinanceERPProject(data) {
  return request({
    url: '/biz/financeERPProject',
    method: 'put',
    data: data
  })
}

// 删除ERP工程明细
export function delFinanceERPProject(projectId) {
  return request({
    url: '/biz/financeERPProject/' + projectId,
    method: 'delete'
  })
}
