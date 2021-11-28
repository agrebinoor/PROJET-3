pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import "./BuildCollective.sol";

contract userProjects is BuildCollective {
  struct project {
     User owner;
     string name;
     uint256 balance;
     User[] contributers;
     string gitlink;
  }
  struct bounty {
    string name;
    uint256 reward;
    bool fix;
  }

mapping ( address => bounty) public bounties;
mapping (address => project) public userprojects;
mapping(address => bool) contributerExists;


bounty[] public bounties_list;
project[] public projects;

function Project(address projectAddress) public view returns (project memory) {
    return userprojects[projectAddress];
  }
event ProjectCreated(address indexed userAddress, project indexed Project);

  function createProject(string memory _name, address[] memory _contributers_addresses, string memory link) public {
    projects.length++;
    userprojects[msg.sender].owner = users[msg.sender];
    userprojects[msg.sender].name = _name;
    userprojects[msg.sender].balance = 0;
    userprojects[msg.sender].gitlink = link;

    uint256 length = _contributers_addresses.length;

    for (uint256 i = 0; i < length; i+=1) {
        userprojects[msg.sender].contributers.push(users[_contributers_addresses[i]]);
        contributerExists[_contributers_addresses[i]] = true;

    }
    emit ProjectCreated(msg.sender, userprojects[msg.sender]);

    }


//create bounty
event bountyCreated(address indexed userAddress, bounty indexed Bounty);

function CreateBounty(uint256 reward, string memory name) public payable {
    require(msg.value > 0);
    bounties_list.length++;
    bounties[msg.sender].name = name;
    bounties[msg.sender].reward = reward;
    bounties[msg.sender].fix = false;
    emit bountyCreated(msg.sender, bounties[msg.sender]);

}

//push a fix to bounty
function Push_a_fix(address _bounty) public payable returns (bool){
    require(bounties[_bounty].fix == false);
    bounties[_bounty].fix = true;
    users[msg.sender].balance = bounties[_bounty].reward;
    
}

//add balance to a project
function addBalance(uint256 amount) public returns (bool){
    userprojects[msg.sender].balance += amount;
    return true;
  }


//give money to contributers
function GiveMoney(uint256 spons_money, address[] memory beneficiaries) public returns (string[] memory){
    uint256 length = beneficiaries.length;
    string[] memory sponsored;
    uint256 j = 0;
    for (uint256 i = 0; i < length; i+=1) {
        require(contributerExists[beneficiaries[i]]);
        users[beneficiaries[i]].balance = spons_money;
        sponsored[j+1] = users[beneficiaries[i]].username;
    return sponsored;
}
}


//returns the current user projects
  function whatAreUsersProjects() public view returns (project memory) {
  return userprojects[msg.sender];
}
}


