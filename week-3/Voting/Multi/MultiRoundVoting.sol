// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

contract MultiRoundVoting {
    // Voting related states
    address public admin;
    uint256 public votingRounds = 0;
    uint256 public currentRound = 0;
    bool public isRunning = false;
    
    // Result related states
    address public winner = address(0);
    uint256 public leadCount = 0;

    // struct to hold voter details
    struct Voter {
        address voterId;
        bool isVoted;
        uint256 voteCount;
    }

    mapping(uint256 => mapping(address => Voter)) public voterList;

    // events
    event declareWinner(address indexed winner, uint256 indexed leadCount);

    // Store initial values
    constructor(uint256 _votingRounds) {
        admin = msg.sender;
        votingRounds = _votingRounds;
    }

    // register voter for voting
    function registerVoter() public voterChecks roundRunningChecks {
        require(voterList[currentRound+1][msg.sender].voterId == address(0), "Already registered");

        // Register new voter in voting list with default values
        voterList[currentRound+1][msg.sender] = Voter(msg.sender, false, 0);

        return;
    }

    // vote for candidate
    function vote (address _candidate) public voterChecks roundStopChecks {
        // Make sure Voter is valid
        require(voterList[currentRound][msg.sender].voterId != address(0), "Voter not registered!"); 
        require(voterList[currentRound][msg.sender].isVoted == false, "Already voted!"); 

        Voter storage candidate = voterList[currentRound][_candidate];

        // Update voting status for voter
        candidate.voteCount += 1; 
        voterList[currentRound][msg.sender].isVoted = true; 

        // Check if eligible for winner
        if(leadCount < candidate.voteCount && candidate.voterId != winner){
            winner = candidate.voterId;
            leadCount += 1;
        }

        return;
    }

    // start voting round
    function startVoting() public adminChecks roundRunningChecks {
        isRunning = true;

        // Update current round count
        currentRound++;

        return;
    }

    // stop voting round
    function stopVoting() public adminChecks roundStopChecks {
        // mark voting round as done
        isRunning = false;

        // declare voting round results
        emit declareWinner (winner, leadCount);

        // Reset winner values after each voting round
        leadCount = 0;
        winner = address(0);

        return;
    }

    // modifiers

    // Check if caller is admin
    modifier adminChecks () {
        require(msg.sender == admin, "Unauthorised access! Admin permissions required!");
        
        _;
    }

    // Check if caller is voter
    modifier voterChecks () {
        require(msg.sender != admin, "Admin can't vote!");

        _;
    }

    // Check if voting round is running
    modifier roundStopChecks () {
        require(currentRound <= votingRounds, "Voting rounds are already done!");
        require(isRunning == true, "Voting round is not running!");

        _;
    }

    // Check if voting round is not running
    modifier roundRunningChecks () {
        require(currentRound < votingRounds, "Voting rounds are already done!");
        require(isRunning == false, "Voting has already started!");

        _;
    }
}
