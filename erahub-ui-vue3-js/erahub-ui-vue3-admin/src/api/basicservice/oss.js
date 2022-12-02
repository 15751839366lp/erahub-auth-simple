import request from '@/utils/request'

// 查询OSS对象存储列表
export function listOss(query) {
  return request({
    url: '/basicservice/oss/list',
    method: 'get',
    params: query
  })
}

// 查询OSS对象基于id串
export function listByIds(ossId) {
  return request({
    url: '/basicservice/oss/listByIds/' + ossId,
    method: 'get'
  })
}

// 批量新增OSS对象存储
export function addOssBatch(data) {
  return request({
    url: '/basicservice/oss/addOssBatch',
    method: 'post',
    data: data
  })
}

// 删除OSS对象存储
export function delOss(ossId) {
  return request({
    url: '/basicservice/oss/' + ossId,
    method: 'delete'
  })
}

// 删除临时文件
export function delTempFiles(fileNames) {
  return request({
    url: '/basicservice/oss/removeTempFiles/' + fileNames,
    method: 'delete'
  })
}