import { checkNull } from "@/utils/base.js";
/**
 * @param {string} path
 * @returns {Boolean}
 */
export function isExternal(path) {
  return /^(https?:|mailto:|tel:)/.test(path)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validUsername(str) {
  const valid_map = ['admin', 'editor']
  return valid_map.indexOf(str.trim()) >= 0
}

/**
 * @param {string} url
 * @returns {Boolean}
 */
export function validURL(url) {
  const reg = /^(https?|ftp):\/\/([a-zA-Z0-9.-]+(:[a-zA-Z0-9.&%$-]+)*@)*((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])){3}|([a-zA-Z0-9-]+\.)*[a-zA-Z0-9-]+\.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|[a-zA-Z]{2}))(:[0-9]+)*(\/($|[a-zA-Z0-9.,?'\\+&%$#=~_-]+))*$/
  return reg.test(url)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validLowerCase(str) {
  const reg = /^[a-z]+$/
  return reg.test(str)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validUpperCase(str) {
  const reg = /^[A-Z]+$/
  return reg.test(str)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validAlphabets(str) {
  const reg = /^[A-Za-z]+$/
  return reg.test(str)
}

/**
 * @param {string} email
 * @returns {Boolean}
 */
export function validEmail(email) {
  const reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  return reg.test(email)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function isString(str) {
  if (typeof str === 'string' || str instanceof String) {
    return true
  }
  return false
}

/**
 * @param {Array} arg
 * @returns {Boolean}
 */
export function isArray(arg) {
  if (typeof Array.isArray === 'undefined') {
    return Object.prototype.toString.call(arg) === '[object Array]'
  }
  return Array.isArray(arg)
}

/**
 * 验证整数大于0
 * @param value
 * @returns {boolean}
 */
export function validIntGreaterThanZero(value) {
  if (/^\+?[1-9][0-9]*$/.test(value)) {
    return true;
  }else{
    return false;
  }
}

/**
 * 验证浮点大于0
 * @param value
 * @returns {boolean}
 */
export function validFloatGreaterThanZero(value) {
  if (/^(\d+)(\.\d+)?$/.test(value)) {
    return true;
  }else{
    return false;
  }
}

/**
 * 验证整数
 * @param value
 * @returns {boolean}
 */
export function validIntegerNum(value) {
  if (/^\d+$/.test(value)) {
    return true;
  }else{
    return false;
  }
}

/**
 * 验证浮点
 * @param value
 * @returns {boolean}
 */
export function validFloatNum(value) {
  if (/^(-?\d+)(\.\d+)?$/.test(value)) {
    return true;
  }else{
    return false;
  }
}

/**
 * 验证数字
 * @param value
 * @returns {boolean}
 */
export function validNumber(value) {
  const n = Number(value);
  if (isNaN(n)){
    return false;
  }else{
    return true;
  }
}

/**
 * 验证经度
 * @param value
 * @returns {boolean}
 */
export function validLng(value) {
  if (/^(\-|\+)?(((\d|[1-9]\d|1[0-7]\d|0{1,3})\.\d{0,17})|(\d|[1-9]\d|1[0-7]\d|0{1,3})|180\.0{0,17}|180)$/.test(value)){
    return true;
  }else{
    return false;
  }
}

/**
 * 验证纬度
 * @param value
 * @returns {boolean}
 */
export function validLat(value) {
  if (/^(\-|\+)?([0-8]?\d{1}\.\d{0,17}|90\.0{0,17}|[0-8]?\d{1}|90)$/.test(value)){
    return true;
  }else{
    return false;
  }
}

/**
 * 验证中文
 * @param value
 * @returns {boolean}
 */
export function validChinese(value) {
  if (/^[\u4e00-\u9fa5]+$/.test(value)){
    return true;
  }else{
    return false;
  }
}

/**
 * 验证英文
 * @param value
 * @returns {boolean}
 */
export function validEnglish(value) {
  if (/^[A-Za-z]+$/.test(value)){
    return true;
  }else{
    return false;
  }
}

/**
 * 验证身份证
 * @param value
 * @returns {boolean}
 */
export function validIdentityCard(value) {
  if (/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|30|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}([0-9]|x|X)$/.test(value)){
    return true;
  }else{
    return false;
  }
}

/**
 * 验证车牌号
 * @param value
 * @returns {boolean}
 */
export function validLicensePlateNumber(value) {
  if (/^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$/.test(value)){
    return true;
  }else{
    return false;
  }
}

/**
 * 验证IP
 * @param value
 * @returns {boolean}
 */
export function validIp(value) {
  if (/^(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.)(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.){2}([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))$/.test(value)){
    return true;
  }else{
    return false;
  }
}

/*===============================elementUI验证===START===============================*/


/**
 * elementUI验证数字
 * @param rule
 * @param value
 * @param callback
 */
export const validateNumber = (rule, value, callback) => {
  if (checkNull(value)) {
    callback();
  } else {
    const n = Number(value);
    if (isNaN(n)){
      callback(new Error("必须是数值"));
    }else{
      callback();
    }
  }
}





/*===============================elementUI验证===END===============================*/
