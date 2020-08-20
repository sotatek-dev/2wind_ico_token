pragma solidity ^0.5.0;
import "./Ownable.sol";
import "../libraries/Roles.sol";


contract Whitelist is Ownable {
	using Roles for Roles.Role;

	Roles.Role private _whitelisteds;

	event WhitelistedAdded(address indexed account);
	event WhitelistedRemoved(address indexed account);

	modifier onlyWhitelisted() {
		require(
			isWhitelisted(msg.sender),
			"caller does not have the Whitelisted"
		);
		_;
	}

	function isWhitelisted(address _account) public view returns (bool) {
		return _whitelisteds.has(_account);
	}

	function addWhitelisted(address _account) public onlyOwner {
		_addWhitelisted(_account);
	}

	function batchAddWhitelisted(address[] memory _accounts) public onlyOwner {
		uint256 arrayLength = _accounts.length;
		for (uint256 i = 0; i < arrayLength; i++) {
			_addWhitelisted(_accounts[i]);
		}
	}

	function removeWhitelisted(address _account) public onlyOwner {
		_removeWhitelisted(_account);
	}

	function batchRemoveWhitelisted(address[] memory _accounts)
		public
		onlyOwner
	{
		uint256 arrayLength = _accounts.length;
		for (uint256 i = 0; i < arrayLength; i++) {
			_removeWhitelisted(_accounts[i]);
		}
	}

	function renounceWhitelisted() public {
		_removeWhitelisted(msg.sender);
	}

	function _addWhitelisted(address _account) internal {
		_whitelisteds.add(_account);
		emit WhitelistedAdded(_account);
	}

	function _removeWhitelisted(address _account) internal {
		_whitelisteds.remove(_account);
		emit WhitelistedRemoved(_account);
	}
}
