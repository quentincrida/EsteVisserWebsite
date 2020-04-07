<template lang="html">
  <div id="filmDetail">
    <div id="detailWrapper">
      <h2>{{film.title}}</h2>
      <div id="flexWrapper">
        <div class="film-details">
          <p><span>Episode</span>: {{film.episode_id}}</p>
          <p><span>Director</span>: {{film.director}}</p>
          <p><span>Release Date</span> {{film.release_date}}</p>
          <router-link :to="{ name: 'crawl', params: {film} }">See Crawl</router-link>
        </div>
      </div>
    </div>


  </div>
</template>

<script>
export default {
  name: 'film-detail',
  props: ['film']
}
</script>

<style lang="css" scoped>

a {
  color: yellow;
  text-decoration: none;
  font-style: italic;
  font-weight: bold;
  font-size: 2em;
}
.film-details {
  color: yellow;
  font-variant: small-caps;
}
#filmDetail {
  box-sizing: border-box;
  height: 50vh;
  width: 25vw;
  padding: 10px;
  border: 1px solid yellow;
  margin-right:10px;
}

#detailWrapper {
  box-sizing: border-box;
  padding: 10px;
  height: 100%;
  border-radius: 3px;
}

#flexWrapper {
  display: flex;
  justify-content: space-between;
}

#left, #right {
  width: 45%;
}

#right img {
  width: 100%;
}

#left p:first-child {
  margin-top: 0;
}

h2 {
  color: yellow;
  margin: 10px 0 20px;
  padding: 0;
}

p span {
  font-weight: bold;
}

</style>
