// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

import "./BookRepository.sol";

// Library contract is the main contract for the library
contract Library is BookRepository {
    // Membership fee for opening account
    uint256 fee = 5 ether;

    // Books that are borrowed by a member
    struct Books {
        uint256 bookId;
        uint256 dueDate;
    }

    // Member struct to store member details
    struct Member {
        address payable memberId;
        uint256 balance;
        Books[] books;
        bool isActive;
    }

    // memberRecords mapping to store member details
    mapping(address => Member) public memberRecords;

    // open account for new member
    function openAccount() public payable {
        // checks before opening account
        require(
            memberRecords[msg.sender].memberId == address(0),
            "Account already exist"
        );

        require(
            msg.value == fee,
            "Pay 5 ETH membership fee for account opening!"
        );

        // add new member to memberRecords mapping
        Member storage newMember = memberRecords[msg.sender];
        newMember.memberId = payable(msg.sender);
        newMember.balance = fee;
        newMember.isActive = true;

        return;
    }

    // book borrowing function
    function borrowBook(uint256 _id) public accountChecks {
        Books[] storage borrowedList = memberRecords[msg.sender].books;

        require(borrowedList.length < 2, "Can't borrow more than 2 books!");

        Book storage book = bookRecords[_id];

        require(
            book.addedBy != address(0) && book.isBorrowed == false,
            "Not available for borrowing!"
        );

        // update data in book repository
        uint256 dueDate = block.timestamp + 60;
        book.isBorrowed = true;
        book.borrower = msg.sender;
        book.dueDate = dueDate;

        // update data in member mapping
        Books memory newBook = Books({bookId: _id, dueDate: dueDate});

        borrowedList.push(newBook);

        return;
    }

    // book returning function
    function returnBook(uint256 _id) public accountChecks {
        Book storage book = bookRecords[_id];

        // check if book exist and is borrowed
        require(
            book.addedBy != address(0) && book.isBorrowed == true,
            "Can't return this book!"
        );

        require(book.borrower == msg.sender, "Not borrowed by you!");

        uint256 currentTime = block.timestamp;

        // hard penalty for late return
        if (currentTime > book.dueDate && currentTime - book.dueDate > 30) {
            memberRecords[msg.sender].balance = 0;
            memberRecords[msg.sender].isActive = false;
        }
        // soft penalty for late return
        else if (
            currentTime > book.dueDate && currentTime - book.dueDate > 10
        ) {
            memberRecords[msg.sender].balance -= 1 ether;
        }

        Books[] storage bookList = memberRecords[msg.sender].books;

        // remove book from member's book list
        for (uint256 i = 0; i < bookList.length; i++) {
            if (bookList[i].bookId == _id) {
                bookList[i] = bookList[bookList.length - 1];

                bookList.pop();
            }
        }

        // update data in book repository
        book.isBorrowed = false;
        book.borrower = address(0);
        book.dueDate = 0;

        return;
    }

    // close account function
    function closeAccount() public accountChecks payable {
        Member memory member = memberRecords[msg.sender];

        // check if all books are returned
        require(member.books.length == 0, "Return all books before closing account!");

        // transfer remaining balance to member
        member.memberId.transfer(member.balance);

        // remove member from memberRecords mapping
        delete memberRecords[msg.sender];

        return;
    }

    // modifier to check if account exist and is active
    modifier accountChecks() {
        require(
            memberRecords[msg.sender].memberId != address(0),
            "Account does not exist!"
        );

        require(
            memberRecords[msg.sender].isActive == true,
            "Account has banned!"
        );

        _;
    }
}
