<template lang="html">
  <div v-if="films">
    <ul>
      <FilmListItem v-for="(film, index) in films" :key="index" :film="film" />
    </ul>
  </div>
</template>

<script>
import FilmListItem from'./FilmListItem';

export default {
  name: 'film-list',
  props:['films'],
  components: {
    FilmListItem
  }
}
</script>

<style lang="css" scoped>
</style>
