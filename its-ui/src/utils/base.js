/**
 * 通用js方法封装处理

 */

const baseURL = process.env.VUE_APP_BASE_API

// 日期格式化
export function parseTime(time, pattern) {
  if (arguments.length === 0 || !time) {
    return null
  }
  const format = pattern || '{y}-{m}-{d} {h}:{i}:{s}'
  let date
  if (typeof time === 'object') {
    date = time
  } else {
    if ((typeof time === 'string') && (/^[0-9]+$/.test(time))) {
      time = parseInt(time)
    } else if (typeof time === 'string') {
      time = time.replace(new RegExp(/-/gm), '/')
    }
    if ((typeof time === 'number') && (time.toString().length === 10)) {
      time = time * 1000
    }
    date = new Date(time)
  }
  const formatObj = {
    y: date.getFullYear(),
    m: date.getMonth() + 1,
    d: date.getDate(),
    h: date.getHours(),
    i: date.getMinutes(),
    s: date.getSeconds(),
    a: date.getDay()
  }
  const time_str = format.replace(/{(y|m|d|h|i|s|a)+}/g, (result, key) => {
    let value = formatObj[key]
    // Note: getDay() returns 0 on Sunday
    if (key === 'a') { return ['日', '一', '二', '三', '四', '五', '六'][value] }
    if (result.length > 0 && value < 10) {
      value = '0' + value
    }
    return value || 0
  })
  return time_str
}

// 字符串转换成时间,时间格式为yyyy-MM-dd
export function convertDateFromString(dateString) {
  if (dateString) {
    const date = new Date(dateString.replace(/-/, '/'))
    return date
  }
}

// 字符串转换成时间,时间格式为yyyy-MM-dd hh:mm:ss
export function convertTimeFromString(timeString) {
  if (timeString) {
    const arrTime = timeString.split(' ')
    const sTime = arrTime[0].split('-')
    const date = new Date(sTime[0], sTime[1] - 1, sTime[2])
    return date
  }
}

// 表单重置
export function resetForm(refName) {
  if (this.$refs[refName]) {
    this.$refs[refName].resetFields()
  }
}

// 添加日期范围
export function addDateRange(params, dateRange) {
  var search = params
  search.beginTime = ''
  search.endTime = ''
  if (dateRange != null && dateRange !== '') {
    search.beginTime = this.dateRange[0]
    search.endTime = this.dateRange[1]
  }
  return search
}

// 回显数据字典
export function selectDictLabel(datas, value) {
  var actions = []
  Object.keys(datas).some((key) => {
    if (datas[key].dictValue === ('' + value)) {
      actions.push(datas[key].dictLabel)
      return true
    }
  })
  return actions.join('')
}

// 回显数据字典（字符串数组）
export function selectDictLabels(datas, value, separator) {
  var actions = []
  var currentSeparator = undefined === separator ? ',' : separator
  var temp = value.split(currentSeparator)
  Object.keys(value.split(currentSeparator)).some((val) => {
    Object.keys(datas).some((key) => {
      if (datas[key].dictValue === ('' + temp[val])) {
        actions.push(datas[key].dictLabel + currentSeparator)
      }
    })
  })
  return actions.join('').substring(0, actions.join('').length - 1)
}

// 通用下载方法
export function download(fileName) {
  window.location.href = baseURL + '/common/download?fileName=' + encodeURI(fileName) + '&delete=' + true
}

// 字符串格式化(%s )
export function sprintf(str) {
  var args = arguments; var flag = true; var i = 1
  str = str.replace(/%s/g, function() {
    var arg = args[i++]
    if (typeof arg === 'undefined') {
      flag = false
      return ''
    }
    return arg
  })
  return flag ? str : ''
}

// 转换字符串，undefined,null等转化为""
export function praseStrEmpty(str) {
  if (!str || str === 'undefined' || str === 'null') {
    return ''
  }
  return str
}

/**
 * 构造树型结构数据
 * @param {*} data 数据源
 * @param {*} id id字段 默认 'id'
 * @param {*} parentId 父节点字段 默认 'parentId'
 * @param {*} children 孩子节点字段 默认 'children'
 * @param {*} rootId 根Id 默认 0
 */
export function handleTree(data, id, parentId, children, rootId) {
  id = id || 'id'
  parentId = parentId || 'parentId'
  children = children || 'children'
  rootId = rootId || Math.min.apply(Math, data.map(item => { return item[parentId] })) || 0
  // 对源数据深度克隆
  const cloneData = JSON.parse(JSON.stringify(data))
  // 循环所有项
  const treeData = cloneData.filter(father => {
    const branchArr = cloneData.filter(child => {
      // 返回每一项的子级数组
      return father[id] === child[parentId]
    })
    branchArr.length > 0 ? father.children = branchArr : ''
    // 返回第一层
    return father[parentId] === rootId
  })
  return treeData !== '' ? treeData : data
}

// 数值前补零
export function pad(num, n) {
  var len = num.toString().length
  while (len < n) {
    num = '0' + num
    len++
  }
  return num
}

// 日期加减
export function addDate(date, dadd) {
  date = date.valueOf()
  date = date + dadd * 24 * 60 * 60 * 1000
  return new Date(date)
}

// 判断非空
export function checkNull(value) {
  if (value != null) {
    const v = value.replace(/(^\s*)|(\s*$)/g, '')
    return (v === null || v === 'null' || typeof (v) === 'undefined' || v === '')
  } else {
    return true
  }
}

// 获取当月第一天
export function getFirstDayOfMonth(date) {
  date.setDate(1)
  return parseTime(date, '{y}-{m}-{d}')
}

// 获取当季第一天
export function getFirstDayOfSeason(date) {
  var month = date.getMonth()
  if (month < 3) {
    date.setMonth(0)
  } else if (month > 2 && month < 6) {
    date.setMonth(3)
  } else if (month > 5 && month < 9) {
    date.setMonth(6)
  } else if (month > 8 && month < 11) {
    date.setMonth(9)
  }
  date.setDate(1)
  return parseTime(date, '{y}-{m}-{d}')
}

// 获取当年第一天
export function getFirstDayOfYear(date) {
  date.setDate(1)
  date.setMonth(0)
  return parseTime(date, '{y}-{m}-{d}')
}

// 四舍五入保留2位小数
export function getFixed(data) {
  return data.toFixed(2)
}

// 获取当前时间戳
export function getCurrentTimestamp() {
  let currentTimestamp = new Date().valueOf()
  return currentTimestamp
}
