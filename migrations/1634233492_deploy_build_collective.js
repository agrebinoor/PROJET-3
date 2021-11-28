const BuildCollective = artifacts.require('BuildCollective')
const Project = artifacts.require('projet')
const Entreprise = artifacts.require('Entreprise')

module.exports = function (deployer) {
  deployer.deploy(BuildCollective)
  deployer.deploy(Project)
  deployer.deploy(Entreprise)

}
