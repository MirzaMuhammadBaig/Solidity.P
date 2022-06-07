// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract PlayerDetails{

struct Player_Details
{
    string Name;
    uint ID;
}

    mapping (address => Player_Details) public PlayerDetail;
    mapping (address => bool) public ApprovePlayer;

    bool ForPlaying;
    address public owner;

    constructor ()
    {
        owner = msg.sender;
        ForPlaying = false;
    }

    modifier onlyOwner
    {
        require(owner == msg.sender,"you are not Owner");_;
    }

    modifier OnlyApprovedPlayer
    {
        require(ApprovePlayer[msg.sender] == true,"You are not approved player");_;
    }

    function Do_Approve_Player(address approve_Players) public onlyOwner
    {
        ApprovePlayer[approve_Players] = true;
    }

    function Reject_Player(address approve_Players) public onlyOwner
    {
        ApprovePlayer[approve_Players] = false;
    }

    function EnableForPlaying(address) public onlyOwner
    {
        ForPlaying = true;
    }

        function DisableForPlaying(address) public onlyOwner
    {
        ForPlaying = false;
    }

    function playerCreation (string memory Name, uint ID) public OnlyApprovedPlayer
    {
        require(msg.sender == owner,"Owner And Player Address Can Not Same");
        require(ForPlaying == true,"You are Not Enable For matching");
        PlayerDetail[msg.sender] = Player_Details(Name, ID);
    }

    function UpdatePlayer (string memory Name, uint ID) public
    {
        PlayerDetail[msg.sender].Name = Name;
        PlayerDetail[msg.sender].ID = ID;
    }
}
