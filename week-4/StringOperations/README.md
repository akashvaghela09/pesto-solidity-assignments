# StringOperations Smart Contract

The StringOperations is a smart contract that performs string operations. It contains functions to find the length of a string, find the index of the first occurrence of a character, and replace every occurrence of a character in a string. This StringOperations smart contract is written in Solidity.

## Technical Details

### Functions

1. `findLength()`: The findLength function takes a string as input and returns the length of the string in bytes. It uses the bytes function to convert the string to bytes and returns the length of the bytes array.

2. `findAtIndex()`: The findAtIndex function takes a string and an index as input and returns the character at the given index. It uses the bytes function to convert the string to bytes and returns the byte at the given index. If the index is out of range, it throws an error.

3. `replaceAllOccurence()`: The replaceAllOccurence function takes a string, a character to replace, and a replacement character as input and returns the string with every occurrence of the character replaced with the replacement character. It uses the bytes function to convert the string to bytes and iterates over the bytes array to replace the character.

### Assumptions
- All the characters in the string are ASCII characters and do not include Unicode characters.

## Examples
| Function            | Input                     | Output          |
| ------------------- | ------------------------- | --------------- |
| findLength          | "Hello, world!"           | 13              |
| findAtIndex         | "Hello, world!", 7        | 'w'             |
| replaceAllOccurence | "Hello, world!", "l", "z" | "Hezzo, worzd!" |


***

## How to Run This File

To run this Solidity file using the Remix IDE, follow these steps:

1. Open the [Remix IDE](https://remix.ethereum.org) and upload the Solidity file.

2. Compile the file by clicking on the "Compile" button in the "Solidity Compiler" tab.

3. Deploy and test the smart contract using the "Deploy & Run Transactions" and "Remix Test" tabs.

That's it! You can now run your Solidity file and interact with the smart contract using the Remix IDE.


