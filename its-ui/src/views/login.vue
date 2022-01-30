<template>
  <div class="login">
  	<div>
    <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form">
    	<div  class="sys-title">
        ITS管理平台
    	</div>
    	<div  class="sys-title-en">
    	</div>
    	<div  class="login-form-div">
    	<span class="span_angle"></span>
	    <span class="span_angle"></span>
	    <span class="span_angle"></span>
	    <span class="span_angle"></span>
    	<div class="form-background">
    	<div style="text-align: center;padding-bottom: 10px;">
      <span class="title">用户登录</span>
      </div>
      <el-form-item prop="username">
        <el-input v-model="loginForm.username" type="text" auto-complete="off" placeholder="账号">
          <svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          v-model="loginForm.password"
          type="password"
          auto-complete="off"
          placeholder="密码"
          @keyup.enter.native="handleLogin"
        >
          <svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="code">
        <el-input
          v-model="loginForm.code"
          auto-complete="off"
          placeholder="验证码"
          style="width: 63%"
          @keyup.enter.native="handleLogin"
        >
          <svg-icon slot="prefix" icon-class="validCode" class="el-input__icon input-icon" />
        </el-input>
        <div class="login-code">
          <img :src="codeUrl" @click="getCode" />
        </div>
      </el-form-item>
      <el-checkbox v-model="loginForm.rememberMe" style="margin:0px 0px 25px 0px;color: #ffffff;">记住密码</el-checkbox>
      <el-form-item style="width:100%;">
        <el-button
          :loading="loading"
          size="medium"
          type="primary"
          style="width:100%;"
          @click.native.prevent="handleLogin"
        >
          <span v-if="!loading">登 录</span>
          <span v-else>登 录 中...</span>
        </el-button>
      </el-form-item>
      </div>
       </div>
    </el-form>
    </div>
    <!--  底部  -->
    <div class="el-login-footer">
      <span>技术支持:江苏长天智远交通科技有限公司</span>
    </div>
  </div>
</template>

<script>
import { getCodeImg } from "@/api/login";
import Cookies from "js-cookie";
import { encrypt, decrypt } from '@/utils/jsencrypt'

export default {
  name: "Login",
  data() {
    return {
      codeUrl: "",
      cookiePassword: "",
      loginForm: {
        username: "",
        password: "",
        rememberMe: false,
        code: "",
        uuid: ""
      },
      loginRules: {
        username: [
          { required: true, trigger: "blur", message: "用户名不能为空" }
        ],
        password: [
          { required: true, trigger: "blur", message: "密码不能为空" }
        ],
        code: [{ required: true, trigger: "change", message: "验证码不能为空" }]
      },
      loading: false,
      redirect: undefined
    };
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect;
      },
      immediate: true
    }
  },
  created() {
    this.getCode();
    this.getCookie();
  },
  methods: {
    getCode() {
      getCodeImg().then(res => {
        this.codeUrl = "data:image/gif;base64," + res.img;
        this.loginForm.uuid = res.uuid;
      });
    },
    getCookie() {
      const username = Cookies.get("username");
      const password = Cookies.get("password");
      const rememberMe = Cookies.get('rememberMe')
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password: password === undefined ? this.loginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
      };
    },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true;
          if (this.loginForm.rememberMe) {
            Cookies.set("username", this.loginForm.username, { expires: 30 });
            Cookies.set("password", encrypt(this.loginForm.password), { expires: 30 });
            Cookies.set('rememberMe', this.loginForm.rememberMe, { expires: 30 });
          } else {
            Cookies.remove("username");
            Cookies.remove("password");
            Cookies.remove('rememberMe');
          }
          this.$store
            .dispatch("Login", this.loginForm)
            .then(() => {
              this.$router.push({ path: this.redirect || "/" });
            })
            .catch(() => {
              this.loading = false;
              this.getCode();
            });
        }
      });
    }
  }
};
</script>

<style rel="stylesheet/scss" lang="scss" >
.login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  background-image: url("../assets/image/bj.png");
  background-size: cover;
}
.title {
  margin: 0px auto 10px auto;
  text-align: center;
  font-size: 21px;
  color: #01A8B6;
}
.login-form-div{
	position: relative;
	border: 3px solid #076297;
	background: #0BA1F8;
	width: 450px;
	background:rgba(11,161,248, 0.1) none repeat scroll !important;
	padding: 15px 45px 5px 45px;
	margin-left:12%;
}
.login-form {
	/*position: relative;
	border: 3px solid #076297;*/
  /*border-radius: 0px;
  broder:3px solid #0BA1F8;*/
  /*background: #0BA1F8;*/
  /*opacity:0.2;*/
  width: 100%;
 /* padding: 25px 25px 5px 25px;*/
  .el-input {
    height: 38px;
    border: 3px solid #076297;
    border-radius: 0px;
    background:rgba(11,161,248, 0.1) none repeat scroll !important;
    input {
    	color: #ffffff;
      height: 33px;
      border: 0px solid #076297;
    	border-radius: 0px;
    	background:rgba(11,161,248, 0.1) none repeat scroll !important;
      padding-top: 3px;
    }
  }
  .input-icon {
    height: 39px;
    width: 14px;
    margin-left: 2px;
  }
}
.login-tip {
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}
.login-code {
  width: 33%;
  height: 38px;
  float: right;
  img {
    cursor: pointer;
    vertical-align: middle;
  }
}
.el-login-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 16px;
  letter-spacing: 1px;

}
/*框 左上角*/
.login-form-div .span_angle:nth-child(1){
    position: absolute;
    left: -2px;
    top: -2px;
    padding: 15px;
    border-style: solid;
    border-color: #01E1EB;
    border-width: 5px 0 0 5px;
}
/*框 右上角*/
.login-form-div .span_angle:nth-child(2){
    position: absolute;
    right: -2px;
    top: -2px;
    padding: 15px;
    border-style: solid;
    border-color: #0BA1F8;
    border-width: 5px 5px 0 0;
}
/*框 左下角*/
.login-form-div .span_angle:nth-child(3){
    position: absolute;
    right: -2px;
    bottom: -2px;
    padding: 15px;
    border-style: solid;
    border-color: #01E1EB;
    border-width: 0 5px 5px 0;
}
/*框 右下角*/
.login-form-div .span_angle:nth-child(4){
    position: absolute;
    left: -2px;
    bottom: -2px;
    padding: 15px;
    border-style: solid;
    border-color: #0BA1F8;
    border-width: 0 0 5px 5px;
}

.sys-title {
  color: #01E1EB;
  font-size: 32px;
  font-family: Arial;
  letter-spacing:10px;
  text-align: center;
  width: 600px;
  font-weight: bold;
}
.sys-title-en {
  color: #01E1EB;
  font-size: 15px;
  font-family: Arial;
  letter-spacing:2px;
  text-align: center;
  width: 600px;
  padding-bottom: 25px;
}

</style>
<style rel="stylesheet/scss" lang="scss" scoped  >
  .el-login-title {
      height: 40px;
      line-height: 40px;
      position: fixed;
      top: 100px;
      width: 100%;
      text-align: center;
      font-family: Arial;
      font-size: 26px;
      letter-spacing:10px;
  }
  .el-button--primary {
      color: #011F2F;
      background-color: #01E1EB;
      border-color: #01E1EB;
  }
  .el-button--primary:hover, .el-button--primary:focus {
  		color: #011F2F;
      background-color: #01E1EB;
      border-color: #01E1EB;

  }
  .el-button--medium {
      border-radius: 0px;
  }
  .el-checkbox__inner{
  	background:rgba(11,161,248, 0.1) none repeat scroll !important;
  	border: 3px solid #076297;
  	border-radius: 0px;
  	width: 18px;
    height: 18px;
  }
  input:-internal-autofill-selected {
      background-color: rgba(11,161,248, 0.1) !important;
      background-image: none !important;
      color: rgb(0, 0, 0) !important;
  }
</style>
