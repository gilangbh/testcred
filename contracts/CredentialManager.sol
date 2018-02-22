pragma solidity ^0.4.18;

contract CredentialManager {
    address private me;
    enum Roles {
        nonRegistered,  // 0 ~ because solidity no N.A.
        Umum,           // 1
        Notaris,        // 2
        Kelurahan,      // 3
        Kecamatan,      // 4
        Polisi,         // 5
        Pemda,          // 6
        Pajak,          // 7
        Ppat,           // 8
        Bpn             // 9
    }

    mapping(uint => mapping(address => bool)) private userRoles;

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

    function setRole(uint role, address user) public {
        userRoles[role][user] = true;
    }

    function getRole(uint role, address user) constant public returns (bool) {
        return userRoles[role][user];
    }
}