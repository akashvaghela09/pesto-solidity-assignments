# Marbles For Chocolates Smart Contracts

These smart contracts are written in Solidity programming language version 0.8.17. The Marbles contract allows users to store marbles, while the Exchange contract allows users to exchange marbles for Ethereum.

## Technical Details

### State Variables

1. Marble: struct to hold marble details, including the quantity and whether the account is open or not
2. marblesBook: mapping to store the marble details using the user's address as the key
3. price: uint256 value to indicate the price of one marble in wei

### Functions

1. openAccount(): function to open an account to store marbles
2. checkBalance(): function to check the marble balance of an account
3. purchase(): payable function to purchase marbles using Ethereum

### Assumptions
- The contract assumes that the price of one marble is 10 wei.
- The contract assumes that the user can only purchase marbles if they have an open account with sufficient marble balance.

| Function       | Input                                                             | Expected Output                 |
| -------------- | ----------------------------------------------------------------- | ------------------------------- |
| openAccount()  | _quantity: 100                                                    | N/A                             |
| checkBalance() | _address: 0x1234567890123456789012345678901234567890              | { quantity: 100, isOpen: true } |
| purchase()     | _owner: 0x1234567890123456789012345678901234567890, _quantity: 10 | N/A                             |



***

## How to Run This File

To run this Solidity file using the Remix IDE, follow these steps:

1. Open the [Remix IDE](https://remix.ethereum.org) and upload the Solidity file.

2. Compile the file by clicking on the "Compile" button in the "Solidity Compiler" tab.

3. Deploy and test the smart contract using the "Deploy & Run Transactions" and "Remix Test" tabs.

That's it! You can now run your Solidity file and interact with the smart contract using the Remix IDE.

