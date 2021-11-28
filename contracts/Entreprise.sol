pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "./BuildCollective.sol";


//the contract userenterprises inherits from BuildCollective
// is structured as entreprise with name, owner(a user), a balace and a list (array of users) of contributers

contract User_entreprises is BuildCollective{
  struct Entreprise {
     User owner;
     string name;
     uint256 balance;
     bool registered;
     User[] contributers;
  }

Entreprise[] public Entreprises;
event EntrepriseCreated(address indexed userAddress, Entreprise indexed entreprise);


// we map the user_address to its enerprises
mapping (address => Entreprise) public userEntreprises;

 function entreprise(address entrepriseAddress) public view returns (Entreprise memory) {
    return userEntreprises[entrepriseAddress];
  }
// Create an entreprise with the owner being the current user
  function createEntreprise(string memory _name, address[] memory _contributers_addresses) public {
    Entreprises.length++;
    userEntreprises[msg.sender].owner = users[msg.sender];
    userEntreprises[msg.sender].name = _name;
    userEntreprises[msg.sender].balance = 0;
    userEntreprises[msg.sender].registered = true;
    uint256 length = _contributers_addresses.length;

    for (uint256 i = 0; i < length; i+=1) {
        userEntreprises[msg.sender].contributers.push(users[_contributers_addresses[i]]);
    }
    emit EntrepriseCreated(msg.sender, userEntreprises[msg.sender]);

    }

//add balance to the entreprise
  function addBalance(uint256 amount) public returns (bool){
    userEntreprises[msg.sender].balance += amount;
    return true;
  }
//returns the current user entreprises
  function whatAreUsersEnterprises() public view returns (Entreprise memory) {
  return userEntreprises[msg.sender];
}
}
