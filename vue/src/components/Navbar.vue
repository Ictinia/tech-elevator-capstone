<template>
  <div id="navbar">
    <div
      class="lg:px-12 px-5 md:flex md:justify-between md:items-center md:h-20 mx-auto h-16 bg-white border-b font-sans"
    >
      <div class="flex items-center justify-between">
        <router-link :to="{ name: 'home' }" class="h-16 flex items-center">
          <img src="../assets/planeteer-logo.png" class="h-12 md:h-12 w-auto" />
        </router-link>

        <div class="left-1/2 md:left-1/3 absolute my-10 w-5/12">
          <div>
            <label
              for="default-search"
              class="mb-2 !text-sm !font-medium text-gray-900 sr-only"
              >Search</label
            >
            <div class="relative hidden lg:block">
              <div class="absolute inset-y-0 left-0 flex items-center pl-3">
                <svg
                  aria-hidden="true"
                  class="w-5 h-5 text-gray-500 dark:text-gray-400"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                  ></path>
                </svg>
              </div>
              <input
                type="text"
                id="default-search"
                class="placeholder-gray-400 block md:w-full !pl-10 !h-12 !font-normal !text-md text-black-400 border active:text-black border-gray-300 rounded-full bg-gray-50 focus:outline-none cursor-text pt-[0.1rem] focus:text-md"
                placeholder="Search Locations, Attractions..."
                @keypress.enter="goToSearchResults"
              />
            </div>
          </div>
        </div>

        <!-- Mobile menu button -->
        <div class="flex md:hidden z-50" :v-show="searchDrawer">
          <button @click="searchDrawer = !searchDrawer">
            <svg
              aria-hidden="true"
              class="w-7 h-7 text-black dark:text-gray-400"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
              ></path>
            </svg>
          </button>
          <button
            type="button"
            :show="showMenu"
            @click="showMenu = !showMenu"
            class="text-gray-800 hover:text-gray-400 focus:outline-none focus:text-gray-400"
          >
            <div
              class="relative flex overflow-hidden items-center justify-end w-[50px] transform transition-all duration-200"
            >
              <div
                class="flex flex-col justify-between w-[20px] h-[20px] transform transition-all duration-300 origin-center overflow-hidden"
              >
                <div
                  class="bg-black h-[2px] w-7 transform transition-all duration-300 origin-left group-focus:translate-y-6 delay-100"
                ></div>
                <div
                  class="bg-black h-[2px] w-7 rounded transform transition-all duration-300 group-focus:translate-y-6 delay-75"
                ></div>
                <div
                  class="bg-black h-[2px] w-7 transform transition-all duration-300 origin-left group-focus:translate-y-6"
                ></div>

                <div
                  class="absolute items-center justify-between transform transition-all duration-500 top-2.5 -translate-x-10 group-focus:translate-x-0 flex w-0 group-focus:w-12"
                >
                  <div
                    class="absolute bg-black h-[2px] w-5 transform transition-all duration-500 rotate-0 delay-300 group-focus:rotate-45"
                  ></div>
                  <div
                    class="absolute bg-black h-[2px] w-5 transform transition-all duration-500 -rotate-0 delay-300 group-focus:-rotate-45"
                  ></div>
                </div>
              </div>
            </div>
          </button>
          <div
            :class="showMenu ? 'flex' : 'hidden'"
            @click="showMenu = !showMenu"
            class="bg-gray-400 h-full left-0 fixed top-0 w-full opacity-20"
          ></div>

          <div
            class="bg-white flex flex-col h-full overflow-y-auto fixed right-0 top-0 w-64 z-50 duration-500 transform ease-in-out transition-all"
            :class="showMenu ? 'translate-x-0' : 'translate-x-full'"
          >
            <div class="flex-col flex items-center mt-6 px-4">
              <button
                class="text-md bg-cyan-600 border border-cyan-600 text-white rounded-lg pt-3 ps-4 h-14 flex justify-center px-4 leading-8 font-medium w-11/12 mb-2 hover:bg-cyan-600/[0.9] hover:border-cyan-500"
                @click="showSignup"
                v-if="!isLoggedIn"
              >
                Sign Up
              </button>
              <button
                class="text-md text-black border border-gray-200 bg-gray-200 rounded-lg pt-3 ps-4 h-14 flex justify-center px-4 leading-8 font-medium w-11/12 hover:bg-gray-300"
                @click="showLogin"
                v-if="!isLoggedIn"
              >
                Login
              </button>
              <button
                class="text-md text-black border border-green-500 bg-green-500 rounded-lg pt-3 ps-4 h-14 flex justify-center px-4 leading-8 font-medium w-11/12 hover:bg-green-500/90 mb-2"
                v-if="isLoggedIn"
                @click="
                  create = true;
                  focusCreate();
                "
              >
                Create Itinerary
              </button>

              <button
                class="text-md text-black border border-cyan-500 bg-cyan-500 rounded-lg pt-3 ps-4 h-14 flex justify-center px-4 leading-8 font-medium w-11/12 hover:bg-cyan-500/90 mb-2"
                v-if="isLoggedIn"
                @click="showMenu = !showMenu"
              >
                <router-link :to="{ name: 'my-itinerary' }">
                  My Itineraries
                </router-link>
              </button>

              <button
                class="text-md text-black border border-gray-200 bg-gray-200 rounded-lg pt-3 ps-4 h-14 flex justify-center px-4 leading-8 font-medium w-11/12 hover:bg-gray-300 mb-2"
                @click="logout"
                v-if="isLoggedIn"
              >
                Logout
              </button>
            </div>
          </div>
        </div>
      </div>

      <div
        class="hidden md:flex flex-col mt-8 space-y-4 md:space-y-0 md:flex-row md:items-center md:space-x-2 md:mt-0"
      >
        <button
          class="h-full items-center flex flex-col hover:text-black/80"
          @click="searchDrawer = true"
        >
          <svg
            aria-hidden="true"
            class="w-9 h-9 text-black dark:text-gray-400 lg:hidden justify-center items-center mr-5"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
            ></path>
          </svg>
          <p class="lg:hidden !text-xs m-0 p-0 mr-5 hover:text-black/80">
            Search
          </p>
        </button>
        <div
          class="lg:hidden transform bottom-0 left-0 w-full fixed h-full overflow-hidden ease-in-out transition-all duration-500 z-50"
          :class="searchDrawer ? 'translate-x-[30%]' : 'translate-x-full'"
        >
          <div
            class="fixed bg-black opacity-0 inset-0 z-10"
            @click="searchDrawer = !searchDrawer"
            v-show="searchDrawer"
          ></div>
          <div class="relative block bg-white h-20 z-30 w-full">
            <div class="absolute inset-y-0 left-0 flex items-center w-full">
              <svg
                aria-hidden="true"
                class="w-5 h-5 text-gray-500 dark:text-gray-400 absolute left-4"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                ></path>
              </svg>
              <input
                type="text"
                id="mobile-search"
                class="block w-8/12 !pl-10 !h-12 !font-normal !text-md text-gray-400 border border-gray-300 rounded-full bg-gray-50 focus:outline-none cursor-text pt-[0.1rem] focus:text-md"
                placeholder="Search Locations, Attractions..."
                @keypress.enter="goToSearchResults"
              />
            </div>
          </div>
        </div>
        <button
          class="text-md bg-cyan-600 border border-cyan-600 text-white rounded-full px-4 leading-8 h-12 hover:bg-cyan-600/[0.9]"
          @click="showSignup"
          v-if="!isLoggedIn"
        >
          Sign Up
        </button>
        <button
          class="text-md text-gray-500 border bg-gray-100 border-gray-200 rounded-full px-4 leading-8 h-12 hover:bg-gray-200"
          @click="showLogin"
          v-if="!isLoggedIn"
        >
          Login
        </button>
        <div
          v-if="isLoggedIn"
          class="h-full items-center flex flex-col hover:cursor-pointer hover:text-green-600"
          @click="
            create = !create;
            focusCreate();
          "
        >
          <svg
            class="h-9 w-9 text-green-600 justify-center items-center mr-5"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <circle cx="12" cy="12" r="10" />
            <line x1="12" y1="8" x2="12" y2="16" />
            <line x1="8" y1="12" x2="16" y2="12" />
          </svg>
          <p class="text-xs m-0 p-0 mr-5 hover:text-green-600">
            Create Itinerary
          </p>
        </div>
        <AppDropdown
          class="h-full items-center flex flex-col hover:cursor-pointer hover:text-cyan-500"
          v-if="isLoggedIn"
        >
          <!-- <div></div> -->
          <!-- <template slot="toggler">
            <button
              class="relative flex items-center focus:outline-none pl-5 pr-3 py-2 rounded-lg bg-gray-300 text-gray-800 font-semibold"
            >
              Click me
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                class="ml-1 h-5 w-5 fill-current text-gray-700"
              >
                <path
                  d="M15.3 9.3a1 1 0 0 1 1.4 1.4l-4 4a1 1 0 0 1-1.4 0l-4-4a1 1 0 0 1 1.4-1.4l3.3 3.29 3.3-3.3z"
                ></path>
              </svg>
            </button>
          </template> -->
          <AppDropdownContent class="z-50">
            <AppDropdownItem>
              <div>
                <router-link class="w-full" :to="{ name: 'my-itinerary' }">
                  <button
                    class="text-md text-gray-500 px-4 leading-8 h-12 w-full"
                    v-if="isLoggedIn"
                  >
                    My Itineraries
                  </button>
                </router-link>
              </div>
            </AppDropdownItem>
            <AppDropdownItem>
              <div @click="logout">
                <button
                  class="text-md text-gray-500 px-4 leading-8 h-12 w-full"
                  v-if="isLoggedIn"
                >
                  Logout
                </button>
              </div>
            </AppDropdownItem>
          </AppDropdownContent>
        </AppDropdown>
      </div>
    </div>
    <login
      v-show="isOpen"
      :isOpen="isOpen"
      :isLogin="isLogin"
      :isSignup="isSignup"
      @close="closeLogin"
    />
    <div
      class="md:hidden transform bottom-0 left-0 w-full fixed h-full overflow-hidden ease-in-out transition-all duration-500 z-50"
      :class="searchDrawer ? 'translate-x-[40%]' : 'translate-x-full'"
    >
      <div
        class="fixed bg-black opacity-0 inset-0 z-10"
        @click="searchDrawer = !searchDrawer"
        v-show="searchDrawer"
      ></div>
      <div class="relative block bg-white h-16 z-30 w-full">
        <div class="absolute inset-y-0 left-0 flex items-center w-full">
          <svg
            aria-hidden="true"
            class="w-5 h-5 text-gray-500 dark:text-gray-400 absolute left-4"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
            ></path>
          </svg>
          <input
            type="text"
            id="small-search"
            class="block w-7/12 !pl-10 !h-12 !font-normal !text-md text-gray-400 border border-gray-300 rounded-full bg-gray-50 focus:outline-none cursor-text pt-[0.1rem] focus:text-md"
            placeholder="Search Locations, Attractions..."
            @keypress.enter="goToSearchResults"
          />
        </div>
      </div>
    </div>

    <div
      class="transform bottom-0 left-0 w-full bg-gray-100 fixed h-full overflow-hidden ease-in-out transition-all duration-500 z-50"
      :class="create ? 'translate-y-0' : 'translate-y-full'"
    >
      <button
        type="button"
        class="rounded-md p-2 absolute right-3 top-3 text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500"
        @click="
          create = !create;
          itinerary.name = 'Name your trip';
          itinerary.date = currentDate();
        "
      >
        <span class="sr-only">Close menu</span>
        <!-- Heroicon name: outline/x -->
        <svg
          class="h-6 w-6"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          aria-hidden="true"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M6 18L18 6M6 6l12 12"
          />
        </svg>
      </button>
      <div class="h-screen w-screen md:flex">
        <div
          class="relative overflow-hidden md:flex w-1/2 bg-cyan-600 justify-around items-center hidden"
        >
          <img
            src="https://www.tpl.org/wp-content/uploads/2021/05/8_2021_Cincinnati-Ohio_header.jpg"
            class="absolute object-cover w-full h-full z-0"
            alt=""
          />
        </div>
        <div
          class="flex md:w-1/2 justify-center py-10 items-center bg-white h-full"
        >
          <form
            class="bg-white w-4/6 relative h-full"
            v-on:submit.prevent="
              createItinerary();
              create = false;
            "
          >
            <div class="flex absolute top-[30%] w-full items-center py-2 mb-4">
              <input
                ref="itinerary"
                id="itinerary"
                class="tracking-tighter outline-none text-big border-none overflow-auto"
                type="text"
                name="itinerary"
                v-model="itinerary.name"
              />
            </div>
            <div class="flex absolute top-[45%] w-full items-center py-2 mb-4">
              <t-datepicker
                v-model="itinerary.date"
                :date-formatter="dateFormatter"
                :date-parser="dateParser"
                date-format="YYYY-MM-DD"
                user-format="M / D"
              >
              </t-datepicker>
            </div>
            <button
              type="submit"
              class="block absolute bottom-0 w-full text-3xl bg-green-600 my-auto py-2 rounded-2xl text-white font-semibold"
            >
              Get Started
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Login from "../components/Login.vue";
import AppDropdown from "../components/AppDropdown.vue";
import AppDropdownContent from "../components/AppDropdownContent.vue";
import AppDropdownItem from "../components/AppDropdownItem.vue";
import ItineraryService from "../services/ItineraryService";
import moment from "moment";

export default {
  name: "navbar",
  components: {
    Login,
    AppDropdown,
    AppDropdownContent,
    AppDropdownItem,
  },

  data() {
    return {
      isOpen: false,
      isLogin: false,
      isSignup: false,
      showMenu: false,
      searchDrawer: false,
      showNavbar: false,
      create: false,
      itinerary: {
        name: "Name your trip",
        date: this.currentDate(),
      },
      searchTerm: "",
    };
  },

  computed: {
    isLoggedIn: function () {
      if (this.$store.state.token != "") {
        return true;
      } else {
        return false;
      }
    },
  },

  methods: {
    hamburgerMenu() {},
    showSignup() {
      this.isOpen = true;
      this.isSignup = true;
      this.showMenu = false;
    },
    showLogin() {
      this.isOpen = true;
      this.isLogin = true;
      this.showMenu = false;
    },
    closeLogin() {
      this.isOpen = false;
      this.isLogin = false;
      this.isSignup = false;
    },
    async logout() {
      this.showMenu = false;
      this.$store.commit("LOGOUT");
      this.$router.push("/");
    },
    createItinerary() {
      const newItinerary = {
        user_id: this.$store.state.user.id,
        name: this.itinerary.name,
        date: this.itinerary.date,
      };

      ItineraryService.createItinerary(newItinerary)
        .then((response) => {
          if (response.status === 201) {
            this.$router.push(`/itineraries`);
          }
        })
        .catch((error) => {
          this.handleErrorResponse(error, "adding");
        });
    },
    currentDate() {
      const current = new Date();
      return current.toISOString().substring(0, 10);
    },
    goToSearchResults(event) {
      let searchTerm = event.target.value;
      this.$router.push({
        name: "landmark-search",
        query: { term: searchTerm },
      });
    },
    searchLandmarks(term) {
      return this.$store.state.landmarks.filter((l) => {
        return l.name.toLowerCase().includes(term.toLowerCase());
      });
    },
    close() {
      this.$emit("close");
    },
    focusCreate: function () {
      return document.getElementById("itinerary").focus();
    },
    handleErrorResponse(error, verb) {
      if (error.response) {
        this.errorMsg =
          "Error " +
          verb +
          " card. Response received was '" +
          error.response.statusText +
          "'.";
      } else if (error.request) {
        this.errorMsg = "Error " + verb + " card. Server could not be reached.";
      } else {
        this.errorMsg =
          "Error " + verb + " card. Request could not be created.";
      }
    },
    dateFormatter(date, format) {
      return moment(date).format(format);
    },
    dateParser(date, format) {
      return moment(date, format).toDate();
    },
  },
};
</script>
