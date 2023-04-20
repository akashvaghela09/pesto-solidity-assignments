# Multi-Round Voting Smart Contract

The Multi-Round Voting is a smart contract that allows voters to participate in multiple rounds of voting. The contract keeps track of the number of voting rounds, the current round, and whether the voting is running or not. The contract also keeps track of the winner and the number of votes they received. This contract is written in Solidity.


## Technical Details

### State Variables

1. admin: Holds the address of the contract admin.

2. votingRounds: Holds the total number of voting rounds.

3. currentRound: Holds the current round number.

4. isRunning: Holds a boolean value indicating whether the voting is running or not.

5. winner: Holds the address of the winner of the voting.

6. leadCount: Holds the total number of votes received by the winner.

7. voterList: Maps the round number to the voter's address and their voting details.

### Functions

1. `registerVoter()`: Allows voters to register for voting.

2. `vote()`: Allows voters to vote for a candidate.

3. `startVoting()`: Starts a new round of voting.

4. `stopVoting()`: Stops the current round of voting and declares the winner.

### Modifiers

1. `adminChecks()`: Checks if the caller is the contract admin/deployer.

2. `voterChecks()`: Checks if the caller is a voter.

3. `roundStopChecks()`: Checks if the current round of voting is stopped.

4. `roundRunningChecks()`: Checks if the current round of voting is running.

### Assumptions

- The contract assumes that the admin is not a voter.
- The contract assumes that the voters can only vote once per round.
- The contract assumes that the winner is declared at the end of each round.
- The contract assumes that the admin starts and stops the voting rounds.

## Input Examples
| Function        | Input            | Output                                                                                |
| --------------- | ---------------- | ------------------------------------------------------------------------------------- |
| registerVoter() | None             | Voter's address and default voting details added to the contract.                     |
| vote()          | candidateAddress | Voter's vote count updated and winner's address and lead count updated if applicable. |
| startVoting()   | None             | New round of voting started.                                                          |
| stopVoting()    | None             | Winner's address and lead count declared and current round of voting stopped.         |


***

## How to Run This File

To run this Solidity file using the Remix IDE, follow these steps:

1. Open the [Remix IDE](https://remix.ethereum.org) and upload the Solidity file.

2. Compile the file by clicking on the "Compile" button in the "Solidity Compiler" tab.

3. Deploy and test the smart contract using the "Deploy & Run Transactions" and "Remix Test" tabs.

That's it! You can now run your Solidity file and interact with the smart contract using the Remix IDE.

