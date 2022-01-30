<template>
  <div v-if="isExternal" :style="styleExternalIcon" class="svg-external-icon svg-icon" v-on="$listeners" />
</template>

<script>

export default {
  name: 'template',
  props: {
  },
  computed: {
  }
}
</script>

<style scoped>
</style>
