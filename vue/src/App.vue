<template>
  <div id="app">
    <nav
      class="navbar is-warning"
      role="navigation"
      aria-label="main navigation"
    >
      <div class="navbar-brand">
        <a class="navbar-item" href="http://localhost:8080/">
          <img src="../randompicturesofbeer/output-onlinepngtools.png" />
        </a>

        <a
          role="button"
          class="navbar-burger"
          aria-label="menu"
          aria-expanded="false"
          data-target="navbarBasicExample"
        >
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>

      <div id="navbarBasicExample" class="navbar-menu">
        <div class="navbar-start">
          <router-link class="navbar-item" v-bind:to="{ name: 'home' }">
            Home
          </router-link>

          <router-link class="navbar-item" :to="{ name: 'search' }">
            Search Breweries
          </router-link>

          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link"> BrewersOnly </a>

            <div class="navbar-dropdown">
              <router-link
                class="navbar-item"
                :to="{ name: 'registerBrewery' }"
                v-if="this.$store.state.isBrewer == true"
              >
                Add a Brewery
              </router-link>
              <router-link
                class="navbar-item"
                :to="{ name: 'addBeer' }"
                v-if="this.$store.state.isBrewer == true"
              >
                Add a Beer
              </router-link>
              <router-link
                class="navbar-item"
                :to="{ name: 'update' }"
                v-if="this.$store.state.isBrewer == true"
              >
                Manage Breweries
              </router-link>
              <hr class="navbar-divider" />
              <a class="navbar-item" href="https://www.youtube.com/watch?v=dQw4w9WgXcQ"> Report an issue </a>
            </div>
          </div>
        </div>
        <div class="navbar-end">
          <div class="navbar-item">
            <div class="buttons">
              <router-link :to="{ name: 'register' }" class="button is-black" v-if="$store.state.token==''">
                <strong>Sign up</strong>
              </router-link>
              <a :href="$router.resolve({ name: 'logout' }).href"
                class="button is-danger"
                v-bind:to="{ name: 'logout' }"
                v-if="$store.state.token != ''"
                ><div class="log"><h3>Logout</h3></div></a
              >
              <router-link
                class="button is-black"
                v-bind:to="{ name: 'login' }"
                v-else
              >
                <div class="log"><h3>Login</h3></div></router-link
              >
            </div>
          </div>
        </div>
      </div>
    </nav>
    <div id="nav">
      <header>
        <div id="container">
          <div id="top">
            <div class="beer-foam">
              <div class="foam-1"></div>
              <div class="foam-2"></div>
              <div class="foam-3"></div>
              <div class="foam-4"></div>
              <div class="foam-5"></div>
              <div class="foam-6"></div>
              <div class="foam-7"></div>
              <div class="foam-8"></div>
              <div class="foam-9"></div>
              <div class="foam-10"></div>
              <div class="foam-11"></div>
              <div class="foam-12"></div>
              <div class="foam-13"></div>
              <div class="foam-14"></div>
              <div class="foam-15"></div>
              
            </div>
            <div id="liquid">
              <div class="bubble bubble1"></div>
              <div class="bubble bubble2"></div>
              <div class="bubble bubble3"></div>
              <div class="bubble bubble4"></div>
              <div class="bubble bubble5"></div>
              <nav
                class="navbar"
                role="navigation"
                aria-label="dropdown navigation"
              ></nav>
            </div>
          </div>
          <div id="left">
            <img
              class="logo"
              src="../randompicturesofbeer/output-onlinepngtools.png"
            />
            <h1>GrogSpotter</h1>
          </div>
        </div>
      </header>
    </div>
    <router-view />
  </div>
</template>


<style scoped>


#app{
  background-image: url("https://townsquare.media/site/657/files/2022/09/attachment-josh-olalde-Ygu9Qx309s-unsplash.jpg?w=980&q=75");
  background-size: 100%;
  height: 100vh;
}

#left {
  display: flex;
  justify-content: start;
}

#right {
  display: flex;
  justify-content: flex-end;
}

.logo {
  width: 120px;
  height: 160px;
  margin-left: 70px;
  margin-top: 40px;
  opacity: 0.8;
}

#container {
  height: 200px;
  margin: 0 auto;
  overflow: hidden;
}

#container div {
  position: absolute;
}

#top {
  border-top: 0;
  border-radius: 0 0 30px 30px;
  height: 200px;
}

.homes {
  left: 1150px;
}

.log {
  left: 1150px;
  top: 100px;
}

#liquid {
  background-color: #f2c025;
  border: 10px solid #f2c025;
  bottom: 0;
  height: 200px;
  overflow: hidden;
  width: 100vw;
  display: flex;
}

#liquid:after {
  background-color: rgba(255, 255, 255, 0.25);
  bottom: -10px;
  content: "";
  height: 200px;
  left: -40px;
  position: absolute;
  transform: rotate(30deg);
  -webkit-transform: rotate(15deg);
  width: 110px;
}

#liquid .bubble {
  -webkit-animation-name: bubble;
  -webkit-animation-iteration-count: infinite;
  -webkit-animation-timing-function: linear;
  background-color: rgba(255, 255, 255, 0.2);
  bottom: 0;
  border-radius: 10px;
  height: 20px;
  width: 20px;
}

@-webkit-keyframes bubble {
  0% {
    bottom: 0;
  }

  50% {
    background-color: rgba(255, 255, 255, 0.2);
    bottom: 80px;
  }

  100% {
    background-color: rgba(255, 255, 255, 0);
    bottom: 160px;
  }
}

.bubble1 {
  left: 10px;
  -webkit-animation-delay: 1000ms;
  -webkit-animation-duration: 1000ms;
}

.bubble2 {
  left: 50px;
  -webkit-animation-delay: 700ms;
  -webkit-animation-duration: 1100ms;
}

.bubble3 {
  left: 100px;
  -webkit-animation-delay: 1200ms;
  -webkit-animation-duration: 1300ms;
}

.bubble4 {
  left: 130px;
  -webkit-animation-delay: 1100ms;
  -webkit-animation-duration: 700ms;
}

.bubble5 {
  left: 170px;
  -webkit-animation-delay: 1300ms;
  -webkit-animation-duration: 800ms;
}

/* Foam */

.beer-foam {
  position: absolute;
  bottom: 10px;
  height: 180px;
}

.foam-1,
.foam-2,
.foam-3,
.foam-4,
.foam-5,
.foam-6,
.foam-7,
.foam-8,
.foam-9,
.foam-10,
.foam-11,
.foam-12,
.foam-13,
.foam-14,
.foam-15 {
  float: left;
  position: absolute;
  z-index: 999;
  width: 50px;
  height: 50px;
  border-radius: 30px;
  background-color: #fefefe;
}
.foam-1 {
  top: -30px;
  left: -10px;
}
.foam-2 {
  top: -35px;
  left: 20px;
}
.foam-3 {
  top: -25px;
  left: 50px;
}
.foam-4 {
  top: -35px;
  left: 80px;
}
.foam-5 {
  top: -30px;
  left: 110px;
}
.foam-6 {
  top: -20px;
  left: 140px;
}
.foam-7 {
  top: -30px;
  left: 160px;
}

.foam-8 {
  top: -30px;
  left: 170px;
}
.foam-9 {
  top: -35px;
  left: 170px;
}
.foam-10 {
  top: -25px;
  left: 210px;
}
.foam-11 {
  top: -35px;
  left: 250px;
}
.foam-12 {
  top: -30px;
  left: 270px;
}
.foam-13 {
  top: -20px;
  left: 300px;
}
.foam-14 {
  top: -30px;
  left: 340px;
}

.foam-15 {
  top: -30px;
  left: 385px;
}

h1 {
  color: rgb(95, 0, 0);
  font-weight: 800;
  position: absolute;
  margin-left: 2em;
  font-family: "Prompt", sans-serif;
  font-size: 6em;
  padding-top: 30px;
  text-shadow: 1px 1px 2px red, 0 0 1em rgb(255, 0, 0), 0 0 0.2em rgb(95, 35, 0);
}
@media(max-width: 800px){
  h1 {
    font-size: 3em;
    
  }
  #left {
    display: flex;
    flex-direction: row;
    
  }
  #liquid {
    width: 100vw;
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
  #navbarBasicExample {
    display: flex;
    flex-direction: column;
    width: 100vw;
    background-color: gray;
    justify-content: center;
    justify-content: middle;
  }
  #navbar-start {
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
  .navbar-brand {
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
  
}

h2 {
  font-family: "Prompt", sans-serif;
  font-size: 2em;
  color: #0e83cd;
  padding-top: 10px;
}

.parent {
  padding: 0;
  margin-top: -130px;
  list-style: none;
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;

  -webkit-flex-flow: row wrap;
  justify-content: space-around;
}

.child {
  padding: 5px;
  width: 400px;
  height: 300px;
  margin-top: 10px;
  background-color: #fff;
  padding: 20px;
}
.navbar {
  z-index: 10000;
}

</style>
