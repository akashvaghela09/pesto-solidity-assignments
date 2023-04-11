// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

// Marble contract to store marbles
contract Marbles {
    
    // decalare state variables
    struct Marble {
        uint256 quantity;
        bool isOpen;
    }

    mapping (address => Marble) internal marblesBook;

    // Open account to store marbles
    function openAccount (uint256 _quantity) public {
        require(marblesBook[msg.sender].isOpen == false, "Account already exist!");
        require(_quantity > 0, "Quantity can't be zero!");

        marblesBook[msg.sender].quantity = _quantity;
        marblesBook[msg.sender].isOpen = true;

        return;
    }

    // Check marble balance of an account
    function checkBalance (address _address) public view returns (Marble memory) {
        return marblesBook[_address];
    }
}

// Exchange contract to exchange marbles for Ethereum
contract Exchange is Marbles {

    // 10 wei = 1 marble
    uint256 price = 10;

    // payable function to purchase marbles
    function purchase (address payable _owner, uint256 _quantity) public payable {
        require(marblesBook[_owner].isOpen == true, "Account does not exist!");
        require(marblesBook[_owner].quantity >= _quantity, "Enough marbles are not available!");

        uint256 exchangeBill = price * _quantity;

        require(msg.value == exchangeBill, "Amount didn't matched with exchange bill");

        marblesBook[_owner].quantity -= _quantity;
        _owner.transfer(msg.value);

        return;
    }
}