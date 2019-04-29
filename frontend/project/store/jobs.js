/** 案件のステート */
export const state = () => ({
  sampleJobs: {
    jobs: [
      {
        id: '1',
        categoryId: '12',
        categoryName: 'category 12',
        title: '案件タイトル1',
        summary: '案件の概要文…',
        place: '東京都茅場町…',
        desireDateTime: '午前中~夕方',
        price: '1000',
        photo: '/sample/photo/path.jpg'
      },
      {
        id: '2',
        categoryId: '13',
        categoryName: 'category 13',
        title: '案件タイトル2',
        summary: '案件の概要文…',
        place: '東京都茅場町…',
        desireDateTime: '午前中~夕方',
        price: '1000',
        photo: '/sample/photo/path.jpg'
      },
      {
        id: '3',
        categoryId: '15',
        categoryName: 'category 15',
        title: '案件タイトル3',
        summary: '案件の概要文…',
        place: '東京都茅場町…',
        desireDateTime: '午前中~夕方',
        price: '1000',
        photo: '/sample/photo/path.jpg'
      }
    ]
  }
})
