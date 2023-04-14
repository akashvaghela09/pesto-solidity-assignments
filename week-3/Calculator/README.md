# Calculator Smart Contract

The Calculator is a smart contract that performs basic arithmetic operations such as addition, subtraction, multiplication, division, and modulo. This contract is written in Solidity.

## Technical Details

### Functions

1. addition(): Takes two integers as input and returns their addition.

2. subtraction(): Takes two integers as input and returns their subtraction. Uses int data type to hold negative values.

3. multiplication(): Takes two integers as input and returns their multiplication.

4. division(): Takes two integers as input and returns their division.

5. modulo(): Takes two integers as input and returns their modulo.

### Assumptions

- The contract assumes that the input values are integers.
- The contract assumes that the division and modulo functions will not result in a divide-by-zero error.

## Input Examples
| Function         | Input | Output |
| ---------------- | ----- | ------ |
| addition()       | 5, 3  | 8      |
| subtraction()    | 5, 3  | 2      |
| multiplication() | 5, 3  | 15     |
| division()       | 10, 2 | 5      |
| modulo()         | 5, 3  | 125    |


***

## How to Run This File

To run this Solidity file using the Remix IDE, follow these steps:

1. Open the [Remix IDE](https://remix.ethereum.org) and upload the Solidity file.

2. Compile the file by clicking on the "Compile" button in the "Solidity Compiler" tab.

3. Deploy and test the smart contract using the "Deploy & Run Transactions" and "Remix Test" tabs.

That's it! You can now run your Solidity file and interact with the smart contract using the Remix IDE.