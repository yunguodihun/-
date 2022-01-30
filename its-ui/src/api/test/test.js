import request from '@/utils/request'

// 查询test列表
export function listTest(query) {
  return request({
    url: '/test/test/list',
    method: 'get',
    params: query
  })
}

// 查询test详细
export function getTest(id) {
  return request({
    url: '/test/test/' + id,
    method: 'get'
  })
}

// 新增test
export function addTest(data) {
  return request({
    url: '/test/test',
    method: 'post',
    data: data
  })
}

// 修改test
export function updateTest(data) {
  return request({
    url: '/test/test',
    method: 'put',
    data: data
  })
}

// 删除test
export function delTest(id) {
  return request({
    url: '/test/test/' + id,
    method: 'delete'
  })
}

// 导出test
export function exportTest(query) {
  return request({
    url: '/test/test/export',
    method: 'get',
    params: query
  })
}