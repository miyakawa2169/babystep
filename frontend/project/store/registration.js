/** 登録 */
export const state = () => ({
  /** 依頼主名 */
  name: '',
  /** 住所 */
  address: '',
  /** 希望時間帯 */
  time: '',
  /** 依頼内容について */
  aboutJob: ''
})

/** 登録アクション */
export const actions = {
  async jobRegistration({ commit, state }) {
    console.log('jobRegistration')
    const response = await this.$axios.post(
      '',
      state.name,
      state.address,
      state.time,
      state.aboutJob
    )
    console.log('%c response :', 'background-color:lightgray', response)
  }
}
