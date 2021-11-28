# DAAR_PROJECT_3
<!--
*** This is PROJECT 3 DAAR 'Working with Solidity'
-->
## Contact
This project was done by :
* AGREBI NOUR EL HOUDA - agrebinoor@gmail.com
* HOURI ORIANE - orianehouri@gmail.com 
## DESCRIPTION
In this project we created new contracts :
* Entreprise that contains owner, name, initial balance, and contributers ( list of users "smart contracts")
* Project that contains a first struct named project that is contained of owner, name, balance, contributers and a git link and another struct bounty that contains name, reward and boolean that is true if th bounty was fixed and false otherwise.
The functions : 
* Entreprise contract contains a function named create entreprise that return a new smart contract, addbalance function that returns the current balance of an entreprise, and a function that returns all the entreprises of a certain user.
* Project contract contains a function named create project that returns a new project, create bounty that returns a new bounty in a project, a function named push a fix that makes sure at first that the bounty is not already fixed then pushes a new fixe and add the reward to the fixers balance, another function called add balance that adds balance to the project and a final function named GiveMoney that at first makes sure that the list of contributers given are really contributers of the project then sends them money for sponsoring.
## How to run
please make sure to run the following for the project to work:
   ```npm install```
then run 
   ```npm run contracts:migrate```
then 
   ```npm run serve```


## Disclamer
Unfortunately we had issues with the front end that we couldn't fix, so it is possible that you will not be able to execute ""create entreprise or project"" but we rely on your understanding and we hope that you can check our backend code that is running with no issues and also our front end that we worked a lot on but is still lacking.
Thank you.
## Possible issues
* If you were fased with truffles issues when running npm please execute the following
```set NODE_OPTIONS=--openssl-legacy-provider```



