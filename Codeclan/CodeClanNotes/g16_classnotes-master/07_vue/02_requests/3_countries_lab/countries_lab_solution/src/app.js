import Vue from 'vue';

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: '#app',
    data: {
      countries: [],
      selectedCountry: null,
      favCountries: []
    },
    computed: {
      neighbouringCountries: function(){
        return this.countries.filter((country) => {
          return this.selectedCountry.borders.includes(country.alpha3Code)
        });
      },
      globalPopulation: function(){
        return this.countries.reduce((total, country) => total + country.population, 0);
      },
      neighbouringPop: function(){
        return this.neighbouringCountries.reduce((total, country) => total + country.population, 0)
      }
    },
    mounted() {
      this.fetchCountries();
    },
    methods: {
      fetchCountries: function(){
        fetch("https://restcountries.eu/rest/v2/all")
        .then(res => res.json())
        .then(data => this.countries = data)
      },
      addCountryToList: function(){

        this.favCountries.push(this.selectedCountry);
      }
    }
  })
})
