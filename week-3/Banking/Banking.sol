// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

contract Banking {
    struct Account {
        address payable walletAddress;
        uint256 balance;
    }

    // Banks customer database
    mapping(address => Account) internal recordBook;

    function createAccount() public {
        // Check if user is already registered in Bank's recordbook or not
        require(
            recordBook[msg.sender].walletAddress == address(0),
            "Account Already Exist!!"
        );

        // Create account for user with initial values
        recordBook[msg.sender] = Account(payable(msg.sender), 0);
        return;
    }

    function deposite() public payable userExist {
        recordBook[msg.sender].balance =
            msg.value +
            recordBook[msg.sender].balance;
        return;
    }

    function withdraw(
        uint256 _amount
    ) public userExist checkFundAvailability(_amount) {
        // make address poayable and pay to customer
        address payable customer = recordBook[msg.sender].walletAddress;
        customer.transfer(_amount);

        // Update user's account balance
        recordBook[msg.sender].balance =
            recordBook[msg.sender].balance -
            _amount;
        return;
    }

    function fundTransfer(
        address payable _beneficiary,
        uint256 _amount
    ) public userExist checkFundAvailability(_amount) {
        // check if beneficiary account exist in bank records
        require(
            recordBook[_beneficiary].walletAddress != address(0),
            "Beneficiary Account Doesn't Exist!!"
        );

        // Update balance in both accounts
        recordBook[_beneficiary].balance =
            recordBook[_beneficiary].balance +
            _amount;
        recordBook[msg.sender].balance =
            recordBook[msg.sender].balance -
            _amount;
        return;
    }

    function checkBalance() public view userExist returns (uint256) {
        // Show user's account balance
        return recordBook[msg.sender].balance;
    }

    // function banksBalance() public view returns (uint256) {
    //     return address(this).balance;
    // }

    modifier userExist() {
        // Check if user has a account in bank or not
        require(
            recordBook[msg.sender].walletAddress != address(0),
            "Your Account Doesn't Exist!!"
        );

        _;
    }

    modifier checkFundAvailability(uint256 _amount) {
        // Check if user have enough funds to withdraw
        require(
            _amount <= recordBook[msg.sender].balance,
            "Insufficient funds!"
        );

        _;
    }
}
