# CrowdFunding Smart Contract

The CrowdFunding is a smart contract that allows users to register new projects for funding, contribute to existing projects, and return funds to contributors if the funding target is not achieved. This contract is written in Solidity.

## Technical Details

### Structs

1. Contributor: Holds the details of the contributor, including the amount donated and their address.

2. Project: Holds the details of the project, including the project ID, name, target amount, collected amount, beneficiary address, list of contributors, and whether the project is open for funding.

### State Variables

1. admin: Holds the address of the contract admin.

2. projectIndex: Holds the index of the current project.

3. projectList: Maps the project ID to the Project struct.

### Functions

1. register(): Registers a new project for funding.

2. returnFunds(): Returns funds to contributors if the funding target is not achieved.

3. contribute(): Contributes funds to an existing project.

### Modifiers

1. isAdmin(): Checks if the caller is the contract admin.

2. isFundingOpen(): Checks if the project is open for funding.

### Assumptions

- The contract assumes that the project ID is unique.
- The contract assumes that the funding target is in Ether.
- The contract assumes that the beneficiary address is valid.

## Input Examples

| Function      | Input                             | Output                                              |
| ------------- | --------------------------------- | --------------------------------------------------- |
| register()    | `"Project A", 10 ether, 0x123...` | New project registered with the given details.      |
| returnFunds() | 0                                 | Funds returned to contributors and project closed.  |
| contribute()  | 0                                 | Funds contributed to the project and event emitted. |


***

## How to Run This File

To run this Solidity file using the Remix IDE, follow these steps:

1. Open the [Remix IDE](https://remix.ethereum.org) and upload the Solidity file.

2. Compile the file by clicking on the "Compile" button in the "Solidity Compiler" tab.

3. Deploy and test the smart contract using the "Deploy & Run Transactions" and "Remix Test" tabs.

That's it! You can now run your Solidity file and interact with the smart contract using the Remix IDE.
