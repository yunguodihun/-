import request from '@/utils/request'

// 查询简历信息列表
export function listVitae(query) {
  return request({
    url: '/demo/vitae/list',
    method: 'get',
    params: query
  })
}

// 查询简历信息详细
export function getVitae(vitaeId) {
  return request({
    url: '/demo/vitae/' + vitaeId,
    method: 'get'
  })
}

// 新增简历信息
export function addVitae(data) {
  return request({
    url: '/demo/vitae',
    method: 'post',
    data: data
  })
}

// 修改简历信息
export function updateVitae(data) {
  return request({
    url: '/demo/vitae',
    method: 'put',
    data: data
  })
}

// 删除简历信息
export function delVitae(vitaeId) {
  return request({
    url: '/demo/vitae/' + vitaeId,
    method: 'delete'
  })
}

// 导出简历信息
export function exportVitae(query) {
  return request({
    url: '/demo/vitae/export',
    method: 'get',
    params: query
  })
}
