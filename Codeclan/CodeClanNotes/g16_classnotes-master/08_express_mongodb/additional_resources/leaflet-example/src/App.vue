<template>
  <div id="app">
    <div id="heading">
    <h1>A simple Leaflet Map in Vue</h1>
    <p>Click a marker to view more details</p>
    <p>Click the map to add a marker</p>
  </div>

    <VueMap />
  </div>
</template>

<script>
import VueMap from './components/Map.vue'

export default {
  name: 'app',
  components: {
    VueMap
  }
}
</script>

<style>
#heading {
  text-align: center;
}
</style>
