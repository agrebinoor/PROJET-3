import Web3 from 'web3'
import ContractInterface from '../build/contracts/projet.json'

const win: any = window

const getproject = async (): Promise<string> => {
  const method = 'eth_requestAccounts'
  const [account] = await win.ethereum.request({ method })
  return account
}

const getReward = async (account: string) => {
  const method = 'eth_getBalance'
  const params = [account, 'latest']
  const balance = await win.ethereum.request({ method, params })
  return Web3.utils.fromWei(balance)
}

export const connect = async () => {
  if (win.ethereum) {
    const web3 = new Web3(win.ethereum)
    try {
      const account = await getproject()
      const Reward = await getReward(account)
      const abi: any = ContractInterface.abi
      const address = ContractInterface.networks['5777'].address
      const contract = new web3.eth.Contract(abi, address, { from: account })
      return { address: account, contract, Reward }
    } catch (error) {
      console.error(error)
    }
  } else {
    console.log('Not Dapp browser.')
  }
}
