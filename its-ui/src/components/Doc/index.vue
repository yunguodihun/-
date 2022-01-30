<template>
  <div>
    <svg-icon icon-class="question" @click="goto"/>
  </div>
</template>

<script>
  export default {
    name: 'Doc',
    data() {
      return {
        url: 'http://47.116.72.206/'
      }
    },
    methods: {
      goto() {
        window.open(this.url)
      }
    }
  }
</script>
