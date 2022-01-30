import request from '@/utils/request'

// 查询文件存储列表
export function listFile(query) {
  return request({
    url: '/system/file/list',
    method: 'get',
    params: query
  })
}

// 查询文件存储详细
export function getFile(id) {
  return request({
    url: '/system/file/' + id,
    method: 'get'
  })
}

// 新增文件存储
export function addFile(data) {
  return request({
    url: '/system/file',
    method: 'post',
    data: data
  })
}

// 修改文件存储
export function updateFile(data) {
  return request({
    url: '/system/file',
    method: 'put',
    data: data
  })
}

// 删除文件存储
export function delFile(id) {
  return request({
    url: '/system/file/' + id,
    method: 'delete'
  })
}

// 导出文件存储
export function exportFile(query) {
  return request({
    url: '/system/file/export',
    method: 'get',
    params: query
  })
}

// 根据业务主键查询文件列表
export function getFilesBySearchId(searchId) {
  return request({
    url: '/system/file/getFilesBySearchId?searchId=' + searchId,
    method: 'get'
  })
}
