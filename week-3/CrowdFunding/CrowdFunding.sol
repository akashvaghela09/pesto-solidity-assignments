// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

contract CrowdFunding {

    // struct to hold contributor details
    struct Contributor {
        uint256 donated;
        address donerId;
    }

    // struct to hold project details
    struct Project {
        uint256 projectId;
        string projectName;
        uint256 targetAmount;
        uint256 collectedAmount;
        address payable beneficiaryAddress;
        Contributor[] contributors;
        bool isOpen;
    }

    // state variables
    address admin;
    uint256 public projectIndex;
    mapping(uint256 => Project) public projectList;

    // events
    event contributionAdded(
        string indexed _projectName,
        uint256 indexed _donation,
        address indexed _donor
    );
    event fundingTargetAchieved(
        string indexed _projectName,
        uint256 indexed _amount,
        address indexed _beneficiary
    );
    event fundsReturned(
        string indexed _projectName,
        uint256 indexed _refundAmount,
        address indexed _refundAddress
    );

    // set admin address on contract deployment
    constructor() {
        admin = msg.sender;
    }

    // register new project for funding
    function register(
        string memory _name,
        uint256 _target,
        address payable _beneficiary
    ) public {
        Project storage newProject = projectList[projectIndex];

        newProject.projectId = projectIndex;
        newProject.projectName = _name;
        newProject.targetAmount = _target;
        newProject.collectedAmount = 0;
        newProject.beneficiaryAddress = _beneficiary;
        newProject.isOpen = true;

        projectIndex++;
    }

    // return funds to contributors if target not achived
    function returnFunds(
        uint256 _projectId
    ) public isAdmin isFundingOpen(_projectId) {
        Project storage project = projectList[_projectId];

        for (uint256 i = 0; i < project.contributors.length; i++) {
            address payable refundAddress = payable(
                project.contributors[i].donerId
            );

            uint256 amount = project.contributors[i].donated;
            project.contributors[i].donated = 0;

            refundAddress.transfer(amount);
        }

        project.isOpen = false;

        // emit event for funds returned
        emit fundsReturned(
            project.projectName,
            project.collectedAmount,
            project.beneficiaryAddress
        );

        return;
    }

    // contribute to project
    function contribute(
        uint256 _projectId
    ) public payable isFundingOpen(_projectId) {
        Project storage project = projectList[_projectId];

        project.collectedAmount += msg.value;
        project.contributors.push(Contributor(msg.value, msg.sender));

        // emit event for contribution
        emit contributionAdded(project.projectName, msg.value, msg.sender);

        // transfer funds if target achived
        if (project.collectedAmount >= project.targetAmount) {
            project.beneficiaryAddress.transfer(project.collectedAmount);

            // mark project close to restrict further funding
            project.isOpen = false;

            // emit event for funding target achived
            emit fundingTargetAchieved(
                project.projectName,
                project.collectedAmount,
                project.beneficiaryAddress
            );
        }
    }

    // modifiers

    // check if msg.sender is admin
    modifier isAdmin() {
        require(
            msg.sender == admin,
            "Unauthorized access, Admin permission required!"
        );

        _;
    }

    // check if project is open for funding
    modifier isFundingOpen(uint256 _projectId) {
        require(
            projectList[_projectId].isOpen == true,
            "Project funding already closed!"
        );

        _;
    }
}
