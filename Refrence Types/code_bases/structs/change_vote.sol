// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;
    mapping(address => uint) public voteIndexByVoter;

    function createVote(Choices choice) external {
        require(voteIndexByVoter[msg.sender] == 0, "Address has already voted");
        votes.push(Vote(choice, msg.sender));
        voteIndexByVoter[msg.sender] = votes.length;
    }

    function changeVote(Choices choice) external {
        uint index = voteIndexByVoter[msg.sender];
        require(index > 0, "No existing vote found for the sender");
        votes[index - 1].choice = choice;
    }

    function findChoice(address _voter) external view returns (Choices) {
        uint index = voteIndexByVoter[_voter];
        require(index > 0, "Vote not found for the given address");
        return votes[index - 1].choice;
    }
}
