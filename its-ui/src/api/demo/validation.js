import request from '@/utils/request'

// 查询验证实例列表
export function listValidation(query) {
  return request({
    url: '/demo/valid/list',
    method: 'get',
    params: query
  })
}

// 查询验证实例详细
export function getValidation(validationId) {
  return request({
    url: '/demo/valid/' + validationId,
    method: 'get'
  })
}

// 新增验证实例
export function addValidation(data) {
  return request({
    url: '/demo/valid',
    method: 'post',
    data: data
  })
}

// 修改验证实例
export function updateValidation(data) {
  return request({
    url: '/demo/valid',
    method: 'put',
    data: data
  })
}

// 删除验证实例
export function delValidation(validationId) {
  return request({
    url: '/demo/valid/' + validationId,
    method: 'delete'
  })
}

// 导出验证实例
export function exportValidation(query) {
  return request({
    url: '/demo/valid/export',
    method: 'get',
    params: query
  })
}
