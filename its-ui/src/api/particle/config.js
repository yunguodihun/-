import request from '@/utils/request'

// 查询颗粒配置列表
export function listConfig(query) {
  return request({
    url: '/particle/config/list',
    method: 'get',
    params: query
  })
}

// 查询颗粒配置详细
export function getConfig(configId) {
  return request({
    url: '/particle/config/' + configId,
    method: 'get'
  })
}

// 新增颗粒配置
export function addConfig(data) {
  return request({
    url: '/particle/config',
    method: 'post',
    data: data
  })
}

// 修改颗粒配置
export function updateConfig(data) {
  return request({
    url: '/particle/config',
    method: 'put',
    data: data
  })
}

// 删除颗粒配置
export function delConfig(configId) {
  return request({
    url: '/particle/config/' + configId,
    method: 'delete'
  })
}

// 导出颗粒配置
export function exportConfig(query) {
  return request({
    url: '/particle/config/export',
    method: 'get',
    params: query
  })
}