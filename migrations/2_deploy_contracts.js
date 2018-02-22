var CredentialManager = artifacts.require("./CredentialManager.sol");
var Order = artifacts.require("./Order.sol");

module.exports = function(deployer) {
    
	deployer.deploy(CredentialManager);
	//deployer.deploy(Order);
}