// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

contract SingleRoundVoting {
    // state variables
    address public admin;
    bool public votingStatus = false;
    bool public isDone = false;
    address public winner = address(0);
    uint256 public leadCount = 0;

    // struct to hold voter details
    struct Voter {
        address voterId;
        bool isVoted;
        uint256 voteCount;
    }

    mapping(address => Voter) internal voterList;

    // events
    event declareWinner(address indexed winner, uint256 indexed leadCount);

    // Store initial values
    constructor() {
        admin = msg.sender;
    }

    // register voter for voting
    function registerVoter() public {
        require(votingStatus == false, "Voting has started, can't register!");
        require(isDone == false, "Voting is already done!");
        require(msg.sender != admin, "Admin can't vote!");
        require(voterList[msg.sender].voterId == address(0), "Voter is already registered");

        voterList[msg.sender] = Voter(msg.sender, false, 0);

        return;
    }

    // vote for candidate
    function vote(address _candidate) public {
        require(votingStatus == true, "Voting haven't started, can't vote!");
        require(isDone == false, "Voting is already done!");
        require(voterList[_candidate].voterId != address(0), "Candidate not found!");
        require(msg.sender != admin, "Admin can't vote!");
        require(voterList[msg.sender].isVoted == false, "Already voted!");

        voterList[_candidate].voteCount += 1;
        Voter memory candidate = voterList[_candidate];

        // Check if eligible for winner
        if(candidate.voteCount > leadCount && candidate.voterId != winner){
            winner = _candidate;
            leadCount += 1;

            voterList[msg.sender].isVoted = true;
        }

        return;
    }

    // start voting
    function startVoting() public {
        require(msg.sender == admin, "Only admin can start voting!");
        require(votingStatus == false, "Can't start voting");
        require(isDone == false, "Voting is already done!");
        votingStatus = true;
        return;
    }

    // stop voting
    function stopVoting() public {
        require(msg.sender == admin, "Only admin can stop voting!");
        require(votingStatus == true, "Can't stop voting!");
        require(isDone == false, "Voting is already done!");
        votingStatus = false;
        isDone = true;

        emit declareWinner (winner, leadCount);
        return;
    }
}
