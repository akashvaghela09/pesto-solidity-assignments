# Lottery Smart Contract

The Lottery is a smart contract that allows users to participate in a lottery by sending Ether to the contract. The contract randomly selects a winner from the list of participants and awards the prize money to the winner. This contract is written in Solidity.

## Technical Details

### State Variables

1. admin: Holds the address of the contract admin.

2. winner: Holds the address of the winner of the lottery.

3. prizeMoney: Holds the total amount of Ether collected as prize money.

4. lotteryLocked: Holds a boolean value indicating whether the lottery is locked or not.

5. participantsList: Holds the list of addresses of the participants.

6. balanceBook: Maps the address of the participant to the amount of Ether they have sent.

### Functions

1. `enter()`: Allows users to participate in the lottery by sending Ether to the contract.

2. `claimReward()`: Allows the winner to claim the prize money.

3. `decideWinner()`: adminCheck: Randomly selects a winner from the list of participants and locks the lottery.

4. `startNewLottery()`: adminCheck: Resets all the lottery variables and deletes the list of participants.

5. `random()`: private view returns(uint): Generates a random number based on the admin address and the current block timestamp.

### Modifiers

1. `adminCheck()`: Checks if the caller is the contract admin.

### Assumptions

- The contract assumes that the participants are not the admin.
- The contract assumes that the participants send Ether greater than 0.
- The contract assumes that the winner claims the prize money.
- The contract assumes that the admin resets the lottery after the winner claims the prize money.

## Input Examples
| Function          | Input   | Output                                                   |
| ----------------- | ------- | -------------------------------------------------------- |
| enter()           | 1 ether | Participant's address and balance added to the contract. |
| claimReward()     | N/A     | Prize money transferred to the winner's address.         |
| decideWinner()    | N/A     | Winner's address get selected and lottery gets locked.   |
| startNewLottery() | N/A     | Lottery variables reset and participants list deleted.   |


***

## How to Run This File

To run this Solidity file using the Remix IDE, follow these steps:

1. Open the [Remix IDE](https://remix.ethereum.org) and upload the Solidity file.

2. Compile the file by clicking on the "Compile" button in the "Solidity Compiler" tab.

3. Deploy and test the smart contract using the "Deploy & Run Transactions" and "Remix Test" tabs.

That's it! You can now run your Solidity file and interact with the smart contract using the Remix IDE.

