// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Lottery {
    
    /* Declare State variables */
    address public admin;
    address payable public winner;
    uint256 public prizeMoney;
    bool public lotteryLocked;

    address [] public participantsList;
    mapping (address => uint256) public balanceBook;

    /* Declare events */
    event broadcastWinner(address indexed winner);

    // set deployer as Admin
    constructor() {
        admin = msg.sender;
    }

	// Pass some ether to participate in lottery
    function enter() public payable {
        require(msg.sender != admin, "Admin can't participate!");
        require(lotteryLocked == false, "Winner has already declared, Wait for a new round to start!");
        require(msg.value > 0 , "Stack some ETH to participate in lottery!");
        require(balanceBook[msg.sender] == 0, "Slot already purchased!");

        balanceBook[msg.sender] = msg.value;
        participantsList.push(msg.sender);

        prizeMoney += msg.value;

        return;
    }

    // Withdraw prize money
    function claimReward() public {
        require(winner != address(0), "Winner hasn't decided!");
        require(winner == msg.sender, "Only winner can withdraw prize money!");
        require(prizeMoney > 0, "Prize money already claimed!");

        uint256 amount = prizeMoney;
        prizeMoney = 0;

        winner.transfer(amount);
        return;
    }
    
    // Decide winner
    function decideWinner() public adminCheck {
        require(winner == address(0), "Winner already declared!");
        uint256 randomNumber = (random() % participantsList.length);

        // Pick winner from participantsList
        winner = payable(participantsList[randomNumber]);

        // Emit winner address
        emit broadcastWinner(winner);

        // Lock the lottery so new people can't participate
        lotteryLocked = true;
        return;
    }

    // Reset all lottery variables
    function startNewLottery () public adminCheck {
        require(address(this).balance == 0, "Wait for winner to withdraw the prize money!");

        lotteryLocked = false;
        winner = payable(address(0));
        prizeMoney = 0;

        // delete listed address from balance book
        for (uint256 i = 0; i < participantsList.length; i++) {
            address currentAddress = participantsList[i];
            delete balanceBook[currentAddress];
        }

        participantsList = new address[](0);

        return;
    }

    // Generate random number
    function random() private view returns(uint) {
        // Below function generates pseudorandom uint based on admin and block.timestamp
        return uint(keccak256(abi.encodePacked(admin, block.timestamp)));
    }

    // Check if caller is admin
    modifier adminCheck () {
        require(msg.sender == admin, "Unauthorized access, Admin permission required!");

        _;
    }
    
}