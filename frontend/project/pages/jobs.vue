<template lang="pug">
  v-layout
    v-flex(xs12 sm12)
      v-card.ma-5(v-for="job in jobs")
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
import { mapActions } from 'vuex'
export default {
  data() {
    return {
    }
  },
  computed: {
    sampleJobs() { return this.$store.state.jobs.sampleJobs },
    jobs() { return this.$store.state.jobs.jobs }

  },
  created() {
    this.fetchJobs()
  },
  methods: {
    ...mapActions({
      fetchJobs: 'jobs/fetchJobs'
    }),
    goDetail(id) { this.$router.push('/job?id=' + id) }
  }
}
</script>

<style lang="sass" scoped>
</style>
