<template>
  <div class="relative h-screen">
    <div></div>
    <div
      class="
        flex flex-col
        absolute
        top-0
        left-0
        right-0
        bottom-0
        justify-center
      "
    >
      <p class="flex flex-row justify-center">{{ welcome }}</p>
      <p class="flex flex-row justify-center">{{ repo }}</p>
      <div class="bg-white p-6 rounded-lg">
        <form @submit.prevent="submitForm" class="flex flex-row justify-center">
          <input
            class="border border-gray-400 p-2 rounded-lg w-1/2"
            type="text"
            v-model="form.url"
          />
          <button
            type="submit"
            class="
              bg-indigo-500
              text-white
              px-4
              py-4
              mx-4
              rounded-lg
              hover:bg-indigo-600
            "
          >
            Shorten
          </button>
        </form>
      </div>
      <div v-if="shortUrl" class="flex flex-col">
        <div class="bg-white p-6 rounded-lg">
          <form @submit.prevent="copyText" class="flex flex-row justify-center">
            <input
              class="border border-gray-400 p-2 rounded-lg w-1/2"
              type="text"
              v-model="shortUrl"
            />
            <button
              @click="copyText"
              class="
                bg-indigo-500
                text-white
                px-4
                py-4
                mx-4
                rounded-lg
                hover:bg-indigo-600
              "
            >
              Copy
            </button>
          </form>
        </div>
      </div>
      <div v-else-if="shortUrlError" class="flex flex-col">
        <div class="bg-white p-6 rounded-lg">
          <div class="flex flex-row justify-center">
            <p class="border border-gray-400 p-2 rounded-lg text-red-500">
              {{ shortUrlError }}
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

const baseUrl = process.env.VUE_APP_BASE_URL;

export default {
  data() {
    return {
      form: {
        url: "",
      },
      shortUrl: null,
      shortUrlError: null,
      welcome: "",
      welcomeText:
        "This is a simple shortlink / shorturl project. This can shorten your long url to be very short.",
      repo: "",
      repoText:
        "Backend: https://github.com/man20820/shorturl-backend, Frontend: https://github.com/man20820/shorturl-frontend",
    };
  },
  mounted() {
    this.typeWelcomeMessage();
    this.typeRepoMessage();
  },

  methods: {
    submitForm() {
      axios
        .post(`${baseUrl}api/shorturl`, this.form)
        .then((response) => {
          //console.log(response.data);
          // this.shortUrl = response.data.short_url
          this.shortUrl = `${baseUrl}` + response.data.short_url;
        })
        .catch((error) => {
          //console.log(error.response.data.error);
          this.shortUrlError = error.response.data.error;
          this.shortUrl = null;
        });
    },
    copyText() {
      navigator.clipboard
        .writeText(this.shortUrl)
        .then(() => {
          console.log("Text copied to clipboard");
        })
        .catch((err) => {
          console.error("Failed to copy text: ", err);
        });
    },
    typeWelcomeMessage() {
      let i = 0;
      const typing = setInterval(() => {
        this.welcome += this.welcomeText[i++];
        if (i === this.welcomeText.length) {
          clearInterval(typing);
        }
      }, 100);
    },
    typeRepoMessage() {
      let i = 0;
      const typing = setInterval(() => {
        this.repo += this.repoText[i++];
        if (i === this.repoText.length) {
          clearInterval(typing);
        }
      }, 100);
    },
  },
};
</script>

<style>
</style>
