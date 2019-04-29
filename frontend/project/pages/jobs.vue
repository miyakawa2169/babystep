<template lang="pug">
  v-layout
    v-flex(xs12 sm8 offset-sm2)
      v-card(v-for="job in sampleJobs.jobs")
        .category {{job.categoryName}}
        v-card-title
          div
            h3.headline.mb-0 {{job.title}}
        .summary {{job.summary}}
        .job-information
          span.title 希望時間帯：{{job.desireDateTime}}
          span.title 場所{{job.place}}

        v-card-actions
          v-btn(flat color="orange") 応援!
          //- nuxt-link.no-decoration(to="/job?id=1111")
          v-btn(flat color="orange" @click="goDetail(job.id)") 詳細

</template>

<script>
export default {
  computed: {
    sampleJobs() { return this.$store.state.jobs.sampleJobs }
  },
  methods: {
    goDetail(id) { this.$router.push('/job?id=' + id) }
  }
}
</script>

<style lang="sass" scoped>
</style>
