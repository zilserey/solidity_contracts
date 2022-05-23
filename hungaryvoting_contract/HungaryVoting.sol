// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract HungaryVoting {

    string public question = "Who do you want to be the next prime minister of Hungary?";
    string[] public candidates = ["O1G", "MZP"];
    mapping(address => uint256) public userVotingMap;
    mapping(uint => address) votersRegistry;
    uint public countedVoters;
    address[] votersList;


    function getCandidates() public view returns (string[] memory) {
        return candidates;
    }

    function getVoters() public returns (address[] memory) {
         
        votersList = new address[](0);

        for (uint i = 0; i < countedVoters; i++) {
            votersList.push(votersRegistry[i]);
        }

        return votersList;
    }

    function castVote() public {
        require(userVotingMap[msg.sender] == 0);
        userVotingMap[msg.sender]++;
        votersRegistry[countedVoters] = msg.sender;
        countedVoters++;
    }

}

