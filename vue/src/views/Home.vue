<template>
  <div class="font-sans">
    <div class="relative bg-green-600">
      <img
        src="https://www.tpl.org/wp-content/uploads/2021/05/8_2021_Cincinnati-Ohio_header.jpg"
        class="absolute object-cover w-full h-full"
        alt=""
      />

      <div class="relative">
        <div
          class="absolute top-0 left-0 w-full h-full flex items-center justify-center"
        >
          <h1
            class="flex text-white text-big sm:ml-2 font-bold z-20 mt-96 tracking-widest"
          >
            PLAN A TOUR IN CINCINNATI
          </h1>
        </div>
      </div>

      <div class="relative bg-gray-900 bg-opacity-40 lg:h-[36rem] h-96 z-0">
        <div class="flex h-full w-full justify-center align-middle"></div>

        <div
          class="absolute right-5 bottom-5 lg:right-14 lg:bottom-8 flex-col mt-8 space-y-4 md:space-y-0 md:flex-row md:items-center md:space-x-2 md:mt-0"
        ></div>
      </div>
    </div>
    <body>
      <div class="mx-8 md:mx-12 lg:mx-28 xl:mx-40 2xl:mx-64 mt-10">
        <h1 class="text-2xl font-semibold">Popular Categories</h1>
        <div class="w-full h-full">
          <nav>
            <ul class="flex relative pb-4 overflow-auto">
              <li class="inline-block pr-4">
                <button
                  class="text-gray-500 hover:text-black font-semibold leading-8 h-12 hover:decoration-2 hover:underline hover:underline-offset-[16px] !py-4"
                >
                  <span>All</span>
                </button>
              </li>
              <li class="inline-block pr-4">
                <button
                  class="text-gray-500 hover:text-black font-semibold leading-8 h-12 hover:decoration-2 hover:underline hover:underline-offset-[16px] !py-4"
                  v-scroll-to="{ element: '#Food' }"
                >
                  <span>Food</span>
                </button>
              </li>
              <li class="inline-block pr-4">
                <button
                  class="text-gray-500 hover:text-black font-semibold leading-8 h-12 hover:decoration-2 hover:underline hover:underline-offset-[16px] !py-4"
                  v-scroll-to="{ element: '#Sports' }"
                >
                  <span>Sports</span>
                </button>
              </li>
              <li class="inline-block pr-4">
                <button
                  class="text-gray-500 hover:text-black font-semibold leading-8 h-12 hover:decoration-2 hover:underline hover:underline-offset-[16px] !py-4"
                  v-scroll-to="{ element: '#Brewery' }"
                >
                  <span>Brewery</span>
                </button>
              </li>
              <li class="inline-block pr-4">
                <button
                  class="text-gray-500 hover:text-black font-semibold leading-8 h-12 hover:decoration-2 hover:underline hover:underline-offset-[16px] !py-4"
                  v-scroll-to="{ element: '#Historic' }"
                >
                  <span>Historic</span>
                </button>
              </li>
              <li class="inline-block pr-4">
                <button
                  class="text-gray-500 hover:text-black font-semibold leading-8 h-12 hover:decoration-2 hover:underline hover:underline-offset-[16px] !py-4"
                  v-scroll-to="{ element: '#Haunted' }"
                >
                  <span>Haunted</span>
                </button>
              </li>
            </ul>
          </nav>
        </div>
      </div>

      <section class="mx-8 md:mx-12 lg:mx-28 xl:mx-40 2xl:mx-64">
        <div class="w-full">
          <section
            v-for="category in this.$store.state.categories"
            v-bind:key="category.id"
            class="overflow-hidden"
            :id="category"
          >
            <div class="py-2 border-b-gray-300 border-b">
              <h2 class="text-2xl font-semibold">{{ category }}</h2>
            </div>
            <div
              class="flex relative gap-x-4 gap-y-8 my-5 w-full overflow-x-auto no-scrollbar"
            >
              <landmarkCard
                v-for="landmark in landmarkFilter(category)"
                v-bind:key="landmark.id"
                v-bind:landmark="landmark"
              >
              </landmarkCard>
            </div>
          </section>
        </div>
      </section>
    </body>
  </div>
</template>

<script>
import landmarkService from "../services/LandmarkService";
import landmarkCard from "../components/LandmarkCard";

export default {
  name: "home",
  data() {
    return {};
  },
  components: {
    landmarkCard,
  },
  methods: {
    landmarkFilter(category) {
      return this.$store.state.landmarks.filter((landmark) => {
        if (landmark.category.includes(category)) {
          return landmark;
        }
      });
    },
  },
  created() {
    landmarkService.getAllLandmarks().then((response) => {
      this.$store.commit("SET_LANDMARKS", response.data);
    });
    landmarkService.getAllCategories().then((response) => {
      this.$store.commit("SET_CATEGORIES", response.data);
    });
  },
  mounted() {
    window.scrollTo(0, 0);
  },
};
</script>
