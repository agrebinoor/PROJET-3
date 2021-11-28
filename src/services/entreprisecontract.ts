import Web3 from 'web3'
import ContractInterface from '../build/contracts/entreprise.json'

const win: any = window

const getEntreprise = async (): Promise<string> => {
  const method = 'eth_requestAccounts'
  const [account] = await win.ethereum.request({ method })
  return account
}

const getBalance = async (account: string) => {
  const method = 'eth_getBalance'
  const params = [account, 'latest']
  const balance = await win.ethereum.request({ method, params })
  return Web3.utils.fromWei(balance)
}

export const connect = async () => {
  if (win.ethereum) {
    const web3 = new Web3(win.ethereum)
    try {
      const account = await getEntreprise()
      const balance = await getBalance(account)
      const abi: any = ContractInterface.abi
      const address = ContractInterface.networks['5777'].address
      const contract = new web3.eth.Contract(abi, address, { from: account })
      return { address: account, contract, balance }
    } catch (error) {
      console.error(error)
    }
  } else {
    console.log('Not Dapp browser.')
  }
}
