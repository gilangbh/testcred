pragma solidity ^0.4.18;

import "./CredentialManager.sol";

contract Order {
    CredentialManager private cred;
    bool private isCredSet;
    uint private data;

    struct StatBadan {
        bool status; //true = sudah verified + bayar, false = belum selesai
        address badan;
        uint256 biaya;
        bool isPaid;
    }

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

    mapping(uint => StatBadan) approval;

    StatBadan private ppat;

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

    function setStatus(uint _role, address _authorizer) public {
        require(cred.getRole(_role,_authorizer));
        approval[_role].badan = _authorizer;
        approval[_role].status = true;
    }

    function getStatus(uint _role) constant public returns (address, bool, uint256, bool) {
        return (
            approval[_role].badan,
            approval[_role].status,
            approval[_role].biaya,
            approval[_role].isPaid
        );
    }
}