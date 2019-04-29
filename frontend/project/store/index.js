/** グローバルステート */
export const state = () => ({
  counter: 0
})

export const actions = {
  async sample({ commit }) {
    // API通信
    // const response = await apiGetSomething()
    // commit('sample', response)
  }
}

export const mutations = {
  increment(state) {
    state.counter++
  }
}
