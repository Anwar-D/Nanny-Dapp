pragma solidity ^0.5.0;

contract babySitters {
    string public name;
    uint public NannyCount = 0; // trake #of nanny
    mapping(uint => Nanny) public Nannies; //store the nanny Id with ather info in blockchain

    struct Nanny { // all nanny info
        uint id;
        string info;
        uint tipAmount;
        address payable author;
    }

    event NannyCreated(
        uint id,
        string content,
        uint tipAmount,
        address payable author
    );

  

    constructor() public {// first thing will apper
        name = "Nanny dapp";
    }

    function setNanny(string memory _info) public {
        // Require valid _info
        require(bytes(_info).length > 0);
        // Increment the nanny count
        NannyCount ++;
     // Create the nanny  
        Nannies[NannyCount] = Nanny(NannyCount, _info, 0, msg.sender);//nannyID,info,tipAmount,Id for currnt user(author)
        // Trigger event
        emit setNanny(NannyCount, _info, 0, msg.sender);
    }

    
}
