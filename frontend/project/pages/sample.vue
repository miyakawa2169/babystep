<template lang="pug">
  .content-wrapper
    .content content here & {{name}}
    v-card.jobs(v-for="job in sampleJobs.jobs")
      v-card-title.title タイトル：{{job.title}}
      .summary サマリー：{{job.summary}}
</template>

<script>
const sampleJobs = {
  jobs: [
    {
      id: '1',
      categoryId: '12',
      title: '案件タイトル',
      summary: '案件の概要文…',
      place: '東京都茅場町…',
      startTime: '0900',
      endTime: '1900',
      price: '1000',
      isHoliday: true,
      photo: '/sample/photo/path.jpg'
    },
    {
      id: '2',
      categoryId: '13',
      title: '案件タイトル2',
      summary: '案件の概要文…',
      place: '東京都茅場町…',
      startTime: '0900',
      endTime: '1900',
      price: '1000',
      isHoliday: true,
      photo: '/sample/photo/path.jpg'
    },
    {
      id: '3',
      categoryId: '13',
      title: '案件タイトル3',
      summary: '案件の概要文…',
      place: '東京都茅場町…',
      startTime: '0900',
      endTime: '1900',
      price: '1000',
      isHoliday: true,
      photo: '/sample/photo/path.jpg'
    }
  ]
}

export default {
  data: function () {
    return {
      name: 'name!',
      sampleJobs: sampleJobs
    }
  },
  mounted() {
    console.log('aaa')
  },
  methods: {
    hoge: function (temp) {
      if (temp) {
      }
      this.name = 'aaaa'
    }
  }
}
</script>
