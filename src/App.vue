<template>
  <div>
    <form @submit.prevent="submitForm">
      <label>
        url:
        <input type="text" v-model="form.name" />
      </label>
      <button type="submit">Submit</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      form: {
        url: 'https://awdawdaw.aw/awdawd'
      }
    }
  },
  methods: {
    submitForm() {
      axios
        .post('https://s.tkjpedia.com/api/shorturl/', this.form)
        .then(response => {
          console.log(response.data)
        })
        .catch(error => {
          console.log(error)
        })
    }
  }
}
</script>

<style>

</style>
