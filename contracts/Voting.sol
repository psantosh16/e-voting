// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    Candidate[] public candidates;
    address owner;
    mapping(address => bool) public voters;

    uint256 public votingStart;
    uint256 public votingEnd;

    constructor(string[] memory _candidateNames, uint256 _durationInMinutes) {
        require(
            _candidateNames.length > 0,
            "At least one candidate is required."
        );
        require(_durationInMinutes > 0, "Duration should be greater than 0.");
        // loop through the candidate names and push them to the candidates array
        for (uint256 i = 0; i < _candidateNames.length; i++) {
            candidates.push(
                Candidate({name: _candidateNames[i], voteCount: 0})
            );
        }
        owner = msg.sender; // the address that deploys the contract is the owner
        votingStart = block.timestamp; // the current block timestamp when the contract is deployed
        votingEnd = block.timestamp + (_durationInMinutes * 1 minutes); // add the duration to the current block timestamp
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // Only Owner can add a candidate to the list
    function addCandidate(string memory _name) public onlyOwner {
        candidates.push(Candidate({name: _name, voteCount: 0}));
    }

    // Allow anyone to vote for a candidate
    function vote(uint256 _candidateIndex) public {
        require(!voters[msg.sender], "You have already voted.");
        require(
            _candidateIndex < candidates.length,
            "Invalid candidate index."
        );

        candidates[_candidateIndex].voteCount++; // increment the vote count of the candidate
        voters[msg.sender] = true; // mark the voter as true
    }

    // Get the total votes of a candidate
    function getAllVotesOfCandiates() public view returns (Candidate[] memory) {
        return candidates;
    }

    // Get the voting status
    function getVotingStatus() public view returns (bool) {
        return (block.timestamp >= votingStart && block.timestamp < votingEnd);
    }

    // Get the remaining time for the voting to end
    function getRemainingTime() public view returns (uint256) {
        require(block.timestamp >= votingStart, "Voting has not started yet.");
        if (block.timestamp >= votingEnd) {
            return 0;
        }
        return votingEnd - block.timestamp;
    }
}
