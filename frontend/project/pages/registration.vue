<template lang="pug">
  v-form(v-model="valid" ref="form")
    v-text-field(
      v-model="name"
      :rules="nameRules"
      :counter="10"
      label="依頼主名"
      required
    )
    v-text-field(
      v-model="address"
      :counter="10"
      label="住所"
      required
    )
    v-text-field(
      v-model="time"
      :counter="20"
      label="希望時間帯"
      required
    )
    v-textarea(
      v-model="aboutJob"
      counter="30"
      label="依頼内容について"
      required
    )
    v-btn(@click="jobRegistration") 送信
    v-btn(@click="clear") クリア
</template>

<script>
import { mapActions } from 'vuex'

export default {
  data() {
    return {
      valid: true,
      name: 'sampleData',
      nameRules: [
        v => !!v || 'name is required!'
      ],
      address: 'sampleData',
      time: 'sampleData',
      aboutJob: 'sampleData'
    }
  },
  computed: {
    progress() {
      return Math.min(100, this.aboutJob.length * 10)
    },
    color() {
      return ['error', 'warning', 'success'][Math.floor(this.progress / 40)]
    }
  },
  methods: {
    ...mapActions({
      jobRegistration: 'registration/jobRegistration'
    }),
    clear() {
      this.$refs.form.reset()
    }
  }
}
</script>
