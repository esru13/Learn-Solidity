// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices choice) external {
        votes.push(Vote(choice, msg.sender));
    }

    function findVoteIndexByVoter(address _voter) internal view returns (int) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return int(i);
            }
        }
        return -1;
    }

    function hasVoted(address _voter) external view returns (bool) {
        return findVoteIndexByVoter(_voter) != -1;
    }

    function findChoice(address _voter) external view returns (Choices) {
        int index = findVoteIndexByVoter(_voter);
        require(index != -1, "Vote not found for the given address");
        return votes[uint(index)].choice;
    }
}
