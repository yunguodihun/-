
<template>
  <div :class="{'has-logo':showLogo}" >
    <logo v-if="showLogo" :collapse="isCollapse" />
    <el-scrollbar :class="settings.sideTheme" wrap-class="scrollbar-wrapper">
      <el-menu
        :default-active="activeMenu"
        :collapse="isCollapse"
        :background-color="variables.menuBg"
        :text-color="variables.menuText"
        :unique-opened="true"
        :active-text-color="settings.theme"
        :collapse-transition="false"
        mode="vertical"
      >
        <sidebar-item
          v-for="(route, index) in sidebarRouters"
          :key="route.path  + index"
          :item="route"
          :base-path="route.path"
        />
      </el-menu>
    </el-scrollbar>
  </div>
</template>

<script>
  import { mapGetters, mapState } from "vuex";
  import Logo from "./Logo";
  import SidebarItem from "./SidebarItem";
  import variables from "@/assets/styles/variables.scss";

  export default {
    components: { SidebarItem, Logo },
    computed: {
      ...mapState(["settings"]),
      ...mapGetters(["sidebarRouters", "sidebar"]),
      activeMenu() {
        const route = this.$route;
        const { meta, path } = route;
        // if set path, the sidebar will highlight the path you set
        if (meta.activeMenu) {
          return meta.activeMenu;
        }
        return path;
      },
      showLogo() {
        return this.$store.state.settings.sidebarLogo;
      },
      variables() {
        return variables;
      },
      isCollapse() {
        return !this.sidebar.opened;
      }
    }
  };
</script>

<style scoped>
  .userProfile {
    position: relative;
    background-size: cover;
    height: 166px;
    width: 240px;
    background: url(../images/user-info.jpg) no-repeat;
  }
  .userProfile .profileImg {
    width: 50px;
    margin-left: 30px;
    padding: 35px 0;
    border-radius: 100%; }
  .userProfile .profileImg::before {
    -webkit-animation: 2.5s blow 0s linear infinite;
    animation: 2.5s blow 0s linear infinite;
    position: absolute;
    content: '';
    width: 50px;
    height: 50px;
    top: 35px;
    margin: 0 auto;
    border-radius: 50%;
    z-index: 0; }

  @-webkit-keyframes blow {
    0% {
      -webkit-box-shadow: 0 0 0 0px rgba(0, 0, 0, 0.1);
      box-shadow: 0 0 0 0px rgba(0, 0, 0, 0.1);
      opacity: 1;
      -webkit-transform: scale3d(1, 1, 0.5);
      transform: scale3d(1, 1, 0.5); }
    50% {
      -webkit-box-shadow: 0 0 0 10px rgba(0, 0, 0, 0.1);
      box-shadow: 0 0 0 10px rgba(0, 0, 0, 0.1);
      opacity: 1;
      -webkit-transform: scale3d(1, 1, 0.5);
      transform: scale3d(1, 1, 0.5); }
    100% {
      -webkit-box-shadow: 0 0 0 20px rgba(0, 0, 0, 0.1);
      box-shadow: 0 0 0 20px rgba(0, 0, 0, 0.1);
      opacity: 0;
      -webkit-transform: scale3d(1, 1, 0.5);
      transform: scale3d(1, 1, 0.5); } }

  @keyframes blow {
    0% {
      -webkit-box-shadow: 0 0 0 0px rgba(0, 0, 0, 0.1);
      box-shadow: 0 0 0 0px rgba(0, 0, 0, 0.1);
      opacity: 1;
      -webkit-transform: scale3d(1, 1, 0.5);
      transform: scale3d(1, 1, 0.5); }
    50% {
      -webkit-box-shadow: 0 0 0 10px rgba(0, 0, 0, 0.1);
      box-shadow: 0 0 0 10px rgba(0, 0, 0, 0.1);
      opacity: 1;
      -webkit-transform: scale3d(1, 1, 0.5);
      transform: scale3d(1, 1, 0.5); }
    100% {
      -webkit-box-shadow: 0 0 0 20px rgba(0, 0, 0, 0.1);
      box-shadow: 0 0 0 20px rgba(0, 0, 0, 0.1);
      opacity: 0;
      -webkit-transform: scale3d(1, 1, 0.5);
      transform: scale3d(1, 1, 0.5); } }
  .userProfile .profileImg img {
    width: 100%;
    border-radius: 100%; }
  .userProfile .profileText {
    padding: 5px 0px;
    position: relative; }
  .userProfile .profileText > a {
    color: #ffffff !important;
    font-size: 1rem;
    width: 100%;
    padding: 6px 30px;
    background: rgba(0, 0, 0, 0.5);
    display: block; }
  .userProfile .profileText > a:after {
    position: absolute;
    right: 20px;
    top: 20px; }
  .userProfile .prdropdownMenu {
    left: 0px;
    right: 0px;
    width: 180px;
    margin: 0 auto; }


</style>
