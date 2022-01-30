import request from '@/utils/request'

// 查询代码生成业务字段列表
export function listColumn(query) {
  return request({
    url: '/system/column/list',
    method: 'get',
    params: query
  })
}

// 查询代码生成业务字段详细
export function getColumn(columnId) {
  return request({
    url: '/system/column/' + columnId,
    method: 'get'
  })
}

// 新增代码生成业务字段
export function addColumn(data) {
  return request({
    url: '/system/column',
    method: 'post',
    data: data
  })
}

// 修改代码生成业务字段
export function updateColumn(data) {
  return request({
    url: '/system/column',
    method: 'put',
    data: data
  })
}

// 删除代码生成业务字段
export function delColumn(columnId) {
  return request({
    url: '/system/column/' + columnId,
    method: 'delete'
  })
}

// 导出代码生成业务字段
export function exportColumn(query) {
  return request({
    url: '/system/column/export',
    method: 'get',
    params: query
  })
}
