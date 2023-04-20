// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

// BookRepository contract is the base contract for Library contract
contract BookRepository {
    // Book struct is used to store book details
    struct Book {
        string name;
        string author;
        bool isBorrowed;
        address borrower;
        uint256 dueDate;
        uint256 bookId;
        address addedBy;
    }

    // declare state variables
    address public admin;
    uint256 public bookIndex = 0;
    mapping(uint256 => Book) public bookRecords;

    // set admin address on contract deployment
    constructor() {
        admin = msg.sender;
    }

    // get book details by id from bookRecords mapping
    function getDetails(uint256 _id) public view returns (Book memory) {
        Book storage book = bookRecords[_id];
        // check if book exist
        require(book.addedBy != address(0), "Book don't exist!");

        return bookRecords[_id];
    }

    // get all books from bookRecords mapping and return as array
    function getList() public view returns (Book[] memory) {
        Book[] memory bookList = new Book[](bookIndex);

        // loop through bookRecords mapping and add to bookList array
        for (uint256 i = 0; i < bookIndex; i++) {
            bookList[i] = bookRecords[i];
        }

        return bookList;
    }

    // add new book to bookRecords mapping
    function addRecord(
        string memory _name,
        string memory _author
    ) public onlyAdmin {
        // add new book to bookRecords mapping with bookIndex as key and Book struct as value
        bookRecords[bookIndex] = Book(
            _name,
            _author,
            false,
            address(0),
            0,
            bookIndex,
            msg.sender
        );

        // increment bookIndex
        bookIndex++;

        return;
    }

    // burn book from bookRecords mapping / delete book
    function burn(uint256 _id) public onlyAdmin {
        // check if book exist
        require(_id >= 0 && _id <= bookIndex, "Invalid book id!");
        require(
            bookRecords[_id].isBorrowed == false,
            "Can't burn borrowed book!"
        );

        // delete book from bookRecords mapping
        delete bookRecords[_id];

        return;
    }

    // modifier to check if msg.sender is admin
    modifier onlyAdmin() {
        require(
            admin == msg.sender,
            "Unauthorised access, admin permissions required!"
        );

        _;
    }
}
