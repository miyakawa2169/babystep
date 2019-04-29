<template lang="pug">
  v-layout
    v-flex(xs12 sm10)
      v-card
        .category {{job[0].categoryName}}
        v-card-title
          h2 {{job[0].title}}
        h3 お手伝い内容
        .summary {{job[0].summary}}
        h3 必要条件
        .job-information
          span.title 希望時間帯：{{job[0].desireDateTime}}
        h3 歓迎条件
        h3 お礼（任意）
        div 図書券 3,000円分
        h3 場所
        div {{job[0].place}}
        h3 歓迎条件

        v-card-actions
          v-btn(flat color="orange") 応募
          v-btn(flat color="orange" @click="back('jobs')") 一覧に戻る
</template>

<script>
export default {
  data() {
    return {
      jobs: this.$store.state.jobs.sampleJobs.jobs
    }
  },
  computed: {
    job() {
      return this.jobs.filter((job) => {
        if (job.id === this.id) {
          return job
        }
      })
    }
  },
  asyncData(context) {
    return {
      id: context.query.id
    }
  },
  methods: {
    back(to) {
      this.$router.push(`/${to}`)
    }
  }
}
</script>
