# Library Management System Smart Contracts

This smart contracts is written in Solidity programming language version 0.8.17. The BookRepository contract is the base contract for the Library contract. The Library contract allows users to open an account, borrow and return books, and close their account. 

## Technical details

### State Variables

1. **Book**: struct to hold book details, including the name, author, whether it is borrowed or not, borrower's address, due date, book ID, and the address of the member who added the book
2. **bookIndex**: uint256 value to indicate the index of the book in the bookRecords mapping
3. **bookRecords**: mapping to store book details using the book ID as the key
4. **admin**: address value to indicate the address of the admin of the contract
5. **fee**: uint256 value to indicate the membership fee for opening an account
6. **Books**: struct to hold book details, including the book ID and due date
7. **Member**: struct to hold member details, including the member's address, balance, list of borrowed books, and whether the account is active or not
8. **memberRecords**: mapping to store member details using the member's address as the key

### BookRepository Contract Functions

1. `getDetails()`: function to get book details by id from bookRecords mapping
2. `getList()`: function to get all books from bookRecords mapping and return as array
3. `addRecord()`: function to add new book to bookRecords mapping
4. `burn()`: function to burn book from bookRecords mapping / delete book

### Library Contract Functions

1. `openAccount()`: payable function to open an account for a new member
2. `borrowBook()`: function to borrow a book
3. `returnBook()`: function to return a book
4. `closeAccount()`: payable function to close a member's account


### Assumptions
- The contract assumes that the membership fee for opening an account is 5 ether.
- The contract assumes that a member can borrow a maximum of 2 books at a time.
- The contract assumes that there is a hard penalty for late return (balance becomes 0 and account is banned) if the book is returned more than 30 seconds late, and a soft penalty (balance is reduced by 1 ether) if the book is returned between 10 and 30 seconds late.


## Example
| Function                | Input                                | Expected Output                                                                                                                                                                                                                                                                                                              |
| ----------------------- | ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| getDetails() | _id: 0                               | { name: "Book 1", author: "Author 1", isBorrowed: false, borrower: address(0), dueDate: 0, bookId: 0, addedBy: 0x1234567890123456789012345678901234567890 }                                                                                                                                                                  |
| getList()               | N/A                                  | [ { name: "Book 1", author: "Author 1", isBorrowed: false, borrower: address(0), dueDate: 0, bookId: 0, addedBy: 0x1234567890123456789012345678901234567890 }, { name: "Book 2", author: "Author 2", isBorrowed: false, borrower: address(0), dueDate: 0, bookId: 1, addedBy: 0x1234567890123456789012345678901234567890 } ] |
| addRecord()             | _name: "Book 3", _author: "Author 3" | N/A                                                                                                                                                                                                                                                                                                                          |
| burn()                  | _id: 0                               | N/A                                                                                                                                                                                                                                                                                                                          |
| openAccount()           | N/A                                  | N/A                                                                                                                                                                                                                                                                                                                          |
| borrowBook()            | _id: 0                               | N/A                                                                                                                                                                                                                                                                                                                          |
| returnBook()            | _id: 0                               | N/A                                                                                                                                                                                                                                                                                                                          |
| closeAccount()          | N/A                                  | N/A                                                                                                                                                                                                                                                                                                                          |


***

## How to Run This File

To run this Solidity file using the Remix IDE, follow these steps:

1. Open the [Remix IDE](https://remix.ethereum.org) and upload the Solidity file.

2. Compile the file by clicking on the "Compile" button in the "Solidity Compiler" tab.

3. Deploy and test the smart contract using the "Deploy & Run Transactions" and "Remix Test" tabs.

That's it! You can now run your Solidity file and interact with the smart contract using the Remix IDE.

