pragma solidity ^0.4.18;

import "./CredentialManager.sol";

contract Order {
    CredentialManager private cred;
    bool private isCredSet;
    uint private data;

    function Order() {
        isCredSet = false;
    }

    function setCred(address _cr) public {
        cred = CredentialManager(_cr);
        isCredSet = true;
    }

    function setData(uint x) public {
        require(cred.isRegis(msg.sender));
        data = x;
    }

    function getSender() constant public returns(address) {
        return cred.getSender();
    }

    function getData() constant public returns (uint) {
        return data;
    }
}