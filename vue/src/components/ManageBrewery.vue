<template>
  <div  style="background-image: url('https://media.istockphoto.com/id/488101157/photo/beer-tasting.jpg?s=612x612&w=0&k=20&c=ZZhqEAqKy4g11PxwTNlXUFscphS_ZHmcDS7q8xi2xJg=');">
    <h1>Your Brewery</h1>
    <ul>
      <li class="brewery" v-for="brewery in breweries" :key="brewery.breweryID">
        {{ brewery.breweryName }}
      </li>
    </ul>
    <div>
      <h1>Update Brewery Info</h1>
      <button class="button-87" v-on:click="show = !show">
        Update Brewery Info
      </button>
      <button class="button-87" v-on:click="showAddBeer = !showAddBeer">
        Add a Beer
      </button>
      <add-beer v-if="showAddBeer == true" :breweryId="breweries[0].breweryID"
        >Add a Beer</add-beer
      >
    </div>
    <button class="button-87" @click="grabBeers()">Manage Beers?</button>
    <div v-for="beer in beers" :key="beer.beerId">
      <h2>{{ beer.beerName }}</h2>
      <button class="button-87" @click="deleteBeer(beer.beerId)">
        Delete this beer.
      </button>
    </div>
    <form
      id="add-brewery"
      v-show="show == true"
      v-on:submit.prevent="updateBrewery"
    >
      <div>
        <label for="brewery-Name" />
        <input
          type="text"
          id="brewery_name"
          v-model="breweries[0].breweryName"
        />
      </div>
      <div>
        <select
          name="select-state"
          id="select-state"
          aria-placeholder="Select State"
          v-model="breweries[0].stateAbv"
        >
          <option value="PA">Pennsylvania</option>
        </select>
      </div>
      <div>
        <label for="street-address" />
        <input
          type="text"
          id="street-address"
          placeholder="Street Address"
          onfocus="this.placeholder = ''"
          onblur="this.placeholder = 'Street Address'"
          v-model="breweries[0].streetAddress"
        />
      </div>
      <div>
        <label for="city" />
        <input
          type="text"
          id="city"
          placeholder="City"
          onfocus="this.placeholder = ''"
          onblur="this.placeholder = 'City'"
          v-model="breweries[0].city"
        />
      </div>
      <div>
        <label for="zip" />
        <input
          type="text"
          id="zip"
          placeholder="Zip"
          onfocus="this.placeholder = ''"
          onblur="this.placeholder = 'Zip'"
          v-model="breweries[0].zip"
        />
      </div>
      <div>
        <label for="time-open" />
        <input
          type="time"
          id="time=open"
          placeholder="11:00"
          onfocus="this.placeholder = ''"
          onblur="this.placeholder = '11:00'"
          v-model="breweries[0].timeOpen"
        />
      </div>
      <div>
        <label for="time-closed" />
        <input
          type="time"
          id="time=closed"
          placeholder="23:00"
          onfocus="this.placeholder = ''"
          onblur="this.placeholder = '23:00'"
          v-model="breweries[0].timeClosed"
        />
      </div>
      <div>
        <textarea
          name="brewery-history"
          id="brewery-history"
          rows="8"
          cols="50"
          placeholder="Brewery History"
          onfocus="this.placeholder = ''"
          onblur="this.placeholder = 'Brewery History'"
          v-model="breweries[0].history"
        ></textarea>
      </div>
      <button class="button-78" id="fix" type="submit">Submit</button>
    </form>
  </div>
</template>

<script>
import BackendServices from "../services/BackendServices";
import AddBeer from "./AddBeer.vue";
export default {
  components: { AddBeer },

  data() {
    return {
      breweryID: 4,
      showBeers: false,
      show: false,
      showAddBeer: false,
      beers: [],
      updatedBrewery: {
        breweryName: "",
        streetAddress: "",
        city: "",
        stateAbv: "",
        zip: "",
        timeOpen: "",
        timeClosed: "",
        history: "",
        brewer_id: this.$store.state.user.id,
      },

      breweries: [],
    };
  },

  methods: {
    deleteBeer(id) {
      BackendServices.deleteBeer(id);
    },
    updateBrewery() {
      BackendServices.updateBrewery(
        this.breweries[0].breweryID,
        this.breweries[0]
      ).then(() => {
        this.resetForm();
      });
      this.$alert("Brewery updated successfully!", "Nice!", "success");
    },
    resetForm() {
      this.updatedBrewery = {};
    },
    grabBeers() {
      BackendServices.getBeerList(this.breweries[0].breweryID).then(
        (returned) => {
          returned.data.forEach((element) => {
            this.beers.push(element);
          });
        }
      );
      this.showBeers = true;
    },
  },
  created() {
    this.updatedBrewery = BackendServices.findBreweriesByBrewerId(
      this.$store.state.user.id
    ).then((response) => {
      response.data.forEach((element) => {
        this.breweries.push(element);
        console.log(this.breweries[0]);
      });
    });
    this.breweryID = this.breweries[0].breweryID;
  },
};
</script>

<style scoped>
#rootMB {
  background-image: url("https://media.istockphoto.com/id/488101157/photo/beer-tasting.jpg?s=612x612&w=0&k=20&c=ZZhqEAqKy4g11PxwTNlXUFscphS_ZHmcDS7q8xi2xJg=");
  height: 100vh;
  background-size: auto;
}
textarea {
  width: 100%;
}
.button-87 {
  margin: auto;
}
h2 {
  text-align: center;
  color:antiquewhite;
}
#fix {
  width: 100%;
}
</style>