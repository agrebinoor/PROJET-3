import { createStore } from 'vuex'
import * as Entreprise from '../services/entreprisecontract'

export default createStore({
  state: {
    contract: null,
    account: {
      address: null,
      balance: 0,
    },
  },
  mutations: {
    updateEntreprise(state, { address, contract, balance }) {
      state.account.address = address
      state.account.balance = balance
      state.contract = contract
    },
  },
  actions: {
    async EntrepriseConnect(context) {
      const response = await Entreprise.connect()
      if (response) {
        const { address, contract, balance } = response
        context.commit('updateEntreprise', { address, contract, balance })
      }
    },
  },
  modules: {},
})
