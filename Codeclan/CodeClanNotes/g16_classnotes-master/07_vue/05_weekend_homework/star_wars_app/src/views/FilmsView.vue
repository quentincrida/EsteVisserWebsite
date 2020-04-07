<template lang="html">
  <div v-if="films" id="view">
    <FilmList :films="films"/>
    <FilmDetail v-if="selectedFilm" :film="selectedFilm" />
  </div>
</template>

<script>

import FilmList from '@/components/FilmList';
import FilmDetail from '@/components/FilmDetail';
import {eventBus} from '@/main.js';

export default {
  name: 'film-view',
  data(){
    return {
      films: [],
      selectedFilm: null
    }
  },
  components: {
    FilmList,
    FilmDetail
  },
  mounted(){
    fetch('https://swapi.co/api/films/')
    .then(response => response.json())
    .then((data) => {
      this.films = data.results.sort((a, b) => {
        return a.episode_id - b.episode_id
      })
    })

    eventBus.$on('film-selected', (film) => {
      this.selectedFilm = film
    })

  }
}
</script>

<style lang="css" scoped>
#view {
  display: flex;
  justify-content: space-around;
}
</style>
