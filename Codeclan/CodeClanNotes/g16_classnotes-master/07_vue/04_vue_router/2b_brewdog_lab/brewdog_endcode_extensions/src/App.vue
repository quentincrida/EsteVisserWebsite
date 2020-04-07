<template>
  <div id="app">
    <vuedog-navbar/>
    <vuedog-header title = "VueDog"/>
    <vuedog-header v-if="!beers.length" title="LOADING..."/>
    <router-view :beers="beers" :favourites="favourites" id="view"/>
  </div>
</template>

<script>
import VuedogHeader from '@/components/VuedogHeader'
import VuedogNavBar from '@/components/VuedogNavBar'

export default {
  name: 'app',
  components: {
    'vuedog-header': VuedogHeader,
    'vuedog-navbar': VuedogNavBar
  },
  data(){
    return  {
      beers: [],
    }
  },
  computed: {
    favourites: function(){
      return this.beers.filter(beer => beer.isFavourite)
    }
  },
  methods: {
    getBeers: function(){
      const promises = [1,2,3,4,5].map(num => {
        return fetch(`https://api.punkapi.com/v2/beers?page=${num}&per_page=80`)
        .then(res => res.json())
      })

      Promise.all(promises)
      .then(data => {
        const beerData = data.reduce((flat, toFlatten) => flat.concat(toFlatten), [])
        beerData.forEach(beer => beer.isFavourite = false)
        this.beers = beerData
      })
      .then(()=> this.sortBeers("name"));
    },

    sortBeers: function(property){
      this.beers.sort((a, b) => {
        return a[property] < b[property] ? -1 : 1
      })
    }
  },
  mounted(){

    this.getBeers()

  }
}
</script>

<style lang="css" scoped>
#app {
  background-color: #6EC3F4;
}

</style>
