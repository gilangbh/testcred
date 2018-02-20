pragma solidity ^0.4.18;

contract CredentialManager {
    address private me;

    function isRegis(address _check) constant public returns(bool) {
        return (me == _check);
    }

    function CredentialManager() public {
        me = msg.sender;
    }

    function getMe() constant public returns (address) {
        return me;
    }

    function getSender() constant public returns (address) {
        return msg.sender;
    }
}