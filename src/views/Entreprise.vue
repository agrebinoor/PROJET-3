<template lang="html">
  <div class="home" v-if="!account">
    <form @submit.prevent="CreateEntreprise">
      <card
        title="Enter Entreprise Name here">
        <input
          type="text"
          class="input-name"
          v-model="nameE"
          placeholder="Type name here"
        />
      </card>
      <card
        title="Enter Contributer Addresse here">
        <input
          type="text"
          class="input-name"
          v-model="contributers"
          placeholder="Type contributer address here"
        />
      </card>
    </form>
  </div>
  <div class="home" v-if="account">
    <div class="card-home-wrapper">
      <card
        :title="account.name"
        :subtitle="`${balance} Ξ\t\t${account.balance} Tokens`"
        :gradient="true">
      </card>
    </div>
  </div>
</template>


<script lang="ts">
import { defineComponent, computed } from 'vue'
import { useStore } from 'vuex'
import Card from '@/components/Card.vue'
import store from '@/store/entreprise'

export default defineComponent({
  components: { Card },
  setup() {
    const store = useStore()
    const address = computed(() => store.state.account.address)
    const balance = computed(() => store.state.account.balance)
    const contract = computed(() => store.state.contract)
    return { address, contract, balance }
  },
  data() {
    const account = null
    const name = ''
    const contributers =null
    return { account, name, contributers }
  },
  methods: {
    async updateAccount() {
      const { address, contract } = this
      this.account = await contract.methods.entreprise(address).call()
    },
    async CreateEntreprise() {
      const { contract, name, contributers } = this
      const name_entrep = name.trim().replace(/ /g, '_')
      await contract.methods.CreateEntreprise(name_entrep, contributers).send()
      await this.updateAccount()
      this.name = ''
    },
    async addTokens() {
      const { contract } = this
      await contract.methods.addBalance(200).send()
      await this.updateAccount()
    },
  },
  async mounted() {
    const { address, contract } = this
    const account = await contract.methods.entreprise(address).call()
    if (account.registered) this.account = account
  },
})
</script>
  
<style lang="css" scoped>
.home {
  padding: 24px;
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  max-width: 500px;
  margin: auto;
}



.explanations {
  padding: 12px;
}

.button-link {
  display: inline;
  appearance: none;
  border: none;
  background: none;
  color: inherit;
  text-decoration: underline;
  font-family: inherit;
  font-size: inherit;
  font-weight: inherit;
  padding: 0;
  margin: 0;
  cursor: pointer;
}

.input-username {
  background: transparent;
  border: none;
  padding: 12px;
  outline: none;
  width: 100%;
  color: white;
  font-family: inherit;
  font-size: 1.3rem;
}

.input-ownername {
  background: transparent;
  border: none;
  padding: 12px;
  outline: none;
  width: 100%;
  color: white;
  font-family: inherit;
  font-size: 1.3rem;
}
</style>

