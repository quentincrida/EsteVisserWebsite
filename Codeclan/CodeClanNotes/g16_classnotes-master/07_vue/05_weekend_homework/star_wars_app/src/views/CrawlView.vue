<template lang="html">
  <div v-if="film">
    <section class="intro">
      A long time ago, in a galaxy far,<br> far away....
    </section>
    <section class="logo">
      <img src="../assets/code-wars-logo.png" alt="">
      <audio v-on:loadeddata="waitForIt">
        <source src="../assets/star-wars-theme-song.mp3" />
      </audio>
    </section>
    <div id="board">
      <div id="content">
        <p id="title">Episode {{film.episode_id}}</p>
        <p id="subtitle">{{film.title}}</p>
        <br>
        <p>{{film.opening_crawl}}</p>
      </div>
    </div>
  </div>

</template>

<script>
export default {
  name: 'crawl-view',
  props: ['film'],
  methods: {
    waitForIt(){
      let audioPlayer = event.target;
      setTimeout(function() { audioPlayer.play(); }, 8000)
    }
  }
}
</script>

<style lang="css" scoped>
.intro {
  position: absolute;
  left: 25%;
  top: 45%;
  z-index: 1;
  animation: intro 5s ease-out 1s;
  color: rgb(75, 213, 238);
  font-weight: 400;
  font-size: 300%;
  opacity: 0;
}

@keyframes intro {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 1;
  }
  90% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

.logo {
  position: absolute;
  top: 30vh;
  left: 30vw;
  z-index: 1;
  margin: auto;
  animation: logo 9s ease-out 9s;
  opacity: 0;
}

.logo svg {
  width: inherit;
}

/* Scale the logo down and maintain it centered */
@keyframes logo {
  0% {
    width: 18em;
    transform: scale(2.75);
    opacity: 1;
  }
  50% {
    opacity: 1;
    width: 18em;
  }
  100% {
    opacity: 0;
    transform: scale(0.1);
    width: 18em;
  }
}

p {
  color: #FFFF82;
}

/* Set the font, lean the board, position it */
#board {
  font-family: Century Gothic, CenturyGothic, AppleGothic, sans-serif;
  transform: perspective(300px) rotateX(25deg);
  transform-origin: 50% 100%;
  text-align: justify;
  position: absolute;
  margin-left: -9em;
  font-weight: bold;
  overflow: hidden;
  font-size: 350%;
  height: 50em;
  width: 18em;
  bottom: 0;
  left: 50%;
}

#board:after {
  position: absolute;
  content: ' ';
  bottom: 60%;
  left: 0;
  right: 0;
  top: 0;
}

/* Set the scrolling animation and position it */
#content {
  animation: scroll 100s linear 16s;
  position: absolute;
  top: 100%;
}

#title, #subtitle {
  text-align: center;
}

@keyframes scroll {
  0% {
    top: 100%;
  }
  100% {
    top: -170%;
  }
}
</style>
