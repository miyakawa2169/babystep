<template lang="pug">
  v-layout
    v-flex(xs12 sm12)
      v-card.ma-5(v-for="job in sampleJobs.jobs")
        .category {{job.categoryName}}
        v-card-title
          div
            h3.headline {{job.title}}
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
