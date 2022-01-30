import request from '@/utils/request'

// 查询数据清单列表
export function listTable(query) {
  return request({
    url: '/particle/table/list',
    method: 'get',
    params: query
  })
}

// 查询db数据库列表
export function listGenTable(query) {
  return request({
    url: '/particle/table/gen/table/list',
    method: 'get',
    params: query
  })
}

// 查询数据清单详细
export function getParticleTable(tableId) {
  return request({
    url: '/particle/table/' + tableId,
    method: 'get'
  })
}

// 查询数据清单详细
export function getParticleTableByTableIdAndRoleId(tableId,roleId) {
  return request({
    url: '/particle/table/' + tableId + '/' + roleId,
    method: 'get'
  })
}

// 新增数据清单
export function addTable(data) {
  return request({
    url: '/particle/table',
    method: 'post',
    data: data
  })
}

// 修改数据清单
export function updateParticleTable(data) {
  return request({
    url: '/particle/table',
    method: 'put',
    data: data
  })
}

// 删除数据清单
export function delTable(tableId) {
  return request({
    url: '/particle/table/' + tableId,
    method: 'delete'
  })
}

// 导出数据清单
export function exportTable(query) {
  return request({
    url: '/particle/table/export',
    method: 'get',
    params: query
  })
}

// 导入表
export function importTable(data) {
  console.log("data："+JSON.stringify(data))
  return request({
    url: '/particle/table/importTable',
    method: 'post',
    params: data
  })
}
