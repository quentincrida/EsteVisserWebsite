<template lang="html">
  <div id="view">
    <Header v-if="['crawl'].indexOf($route.name)"/>
    <router-view id="view"/>
  </div>
</template>

<script>

import Header from '@/components/Header'

export default {
  name: 'app',
  components: {
    Header
  }
}
</script>
<style >
  body {
    margin: 0
  }
</style>
<style lang="css" scoped>

#view {
  background-color: black;
  height:100vh;
}
</style>
