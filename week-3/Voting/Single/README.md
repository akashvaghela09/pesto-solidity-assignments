# Single-Round Voting Smart Contract

The Single-Round Voting is a smart contract that allows voters to participate in a single round of voting. The contract keeps track of the voting status, whether the voting is done or not, the winner, and the number of votes they received. This contract is written in Solidity.

## Technical Details

### State Variables

1. admin: address of the contract admin
2. votingStatus: boolean value to indicate if voting is open or not
3. isDone: boolean value to indicate if voting is finished or not
4. winner: address of the candidate with the most votes
5. leadCount: number of votes the winning candidate has over the second highest candidate

#### Struct

1. Voter: struct to hold voter details, including their address, whether they have voted or not, and the number of votes they have cast

#### Mapping

1. voterList: mapping to store the voter details using their address as the key

#### Events

1. declareWinner: event to declare the winner of the voting and the number of votes they received

#### Functions

1. `constructor()`: constructor function to set the admin address
2. `registerVoter()`: function to register a voter for voting
3. `vote()`: function to allow a voter to cast their vote for a candidate
4. `startVoting()`: function to start the voting process
5. `stopVoting()`: function to stop the voting process and declare the winner. It also emits the declareWinner event.

### Assumptions

- The contract assumes that only the admin can start and stop the voting process.
- The contract assumes that the admin cannot vote.
- The contract assumes that each voter can only vote once.


***

## How to Run This File

To run this Solidity file using the Remix IDE, follow these steps:

1. Open the [Remix IDE](https://remix.ethereum.org) and upload the Solidity file.

2. Compile the file by clicking on the "Compile" button in the "Solidity Compiler" tab.

3. Deploy and test the smart contract using the "Deploy & Run Transactions" and "Remix Test" tabs.

That's it! You can now run your Solidity file and interact with the smart contract using the Remix IDE.

