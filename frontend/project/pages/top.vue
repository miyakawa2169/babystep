<template lang="pug">
  v-layout
    v-flex(xs12 sm6 offset-sm3)
      v-card(v-for="job in sampleJobs.jobs")
        .category {{job.categoryName}}
        v-card-title
          div
            h3.headline.mb-0 {{job.title}}
          .summary {{job.summary}}
          .job-information
            span.title 希望時間帯：{{job.desireDateTime}}
            span.title 場所{{job.place}}
          div {{todos}}

        v-card-actions
          v-btn(flat color="orange") 応援!
          v-btn(flat color="orange") 詳細

</template>

<script>
export default {
  computed: {
    sampleJobs() { return this.$store.state.jobs.sampleJobs }
  }
}
</script>
