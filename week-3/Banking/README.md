# Banking Smart Contract

The Banking smart contract is a decentralized application that allows users to create an account, deposit and withdraw funds, transfer funds to other accounts, and check their account balance. The contract is written in Solidity.

## Technical Details

### Account Struct

The Account struct contains the wallet address of the user and their account balance.
### Record Book Mapping

The recordBook mapping is used to store the account details of the users. It maps the user's address to their Account struct.

### Functions

1. createAccount(): Creates a new account for the user with an initial balance of 0.

2. deposite(): Deposits funds into the user's account.

3. withdraw(uint256 _amount): Withdraws funds from the user's account.

4. fundTransfer(address payable _beneficiary, uint256 _amount): Transfers funds from the user's account to another account.

5. checkBalance(): Returns the user's account balance.

### Modifiers

1. userExist(): Checks if the user has an account in the bank.

2. checkFundAvailability(uint256 _amount): Checks if the user has sufficient funds to withdraw or transfer.

## Assumptions

- The contract assumes that the user's wallet address is their unique identifier.
- The contract assumes that the user has sufficient funds to withdraw or transfer.
- The contract assumes that the user has already created an account before depositing or withdrawing funds.

## Input Examples
| Function                                                    | Input             | Output                                                                                          |
| ----------------------------------------------------------- | ----------------- | ----------------------------------------------------------------------------------------------- |
| createAccount()                                             | N/A               | New account created for the user.                                                               |
| deposite()                                                  | 5 ether           | User's account balance updated to 5 ether.                                                      |
| withdraw(uint256 _amount)                                   | 2 ether           | User's account balance updated to 3 ether.                                                      |
| fundTransfer(address payable _beneficiary, uint256 _amount) | 0x123..., 1 ether | User's account balance updated to 2 ether and beneficiary's account balance updated to 1 ether. |
| checkBalance()                                              | N/A               | Returns the user's account balance.                                                             |


***

## How to Run This File

To run this Solidity file using the Remix IDE, follow these steps:

1. Open the [Remix IDE](https://remix.ethereum.org) and upload the Solidity file.

2. Compile the file by clicking on the "Compile" button in the "Solidity Compiler" tab.

3. Deploy and test the smart contract using the "Deploy & Run Transactions" and "Remix Test" tabs.

That's it! You can now run your Solidity file and interact with the smart contract using the Remix IDE.