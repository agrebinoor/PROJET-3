import { createStore } from 'vuex'
import * as Project from '../services/projectcontract'

export default createStore({
  state: {
    contract: null,
    account: {
      address: null,
      reward: 0,
    },
  },
  mutations: {
    updateEntreprise(state, { address, contract, reward }) {
      state.account.address = address
      state.account.reward = reward
      state.contract = contract
    },
  },
  actions: {
    async ProjectConnect(context) {
      const response = await Project.connect()
      if (response) {
        const { address, contract, reward } = response
        context.commit('updateproject', { address, contract, reward })
      }
    },
  },
  modules: {},
})
