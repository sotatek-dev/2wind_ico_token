pragma solidity ^0.5.0;

import "./Ownable.sol";
import "../libraries/Roles.sol";


contract Operator is Ownable {
	using Roles for Roles.Role;

	Roles.Role private _operators;

	address[] private _operatorsListed;

	mapping(address => uint256) _operatorIndexs;

	event OperatorAdded(address indexed account);
	event OperatorRemoved(address indexed account);

	modifier onlyOperator() {
		require(
			isOperator(msg.sender),
			"caller does not have the Operator role"
		);
		_;
	}

	constructor() public {
		_addOperator(msg.sender);
	}

	function getAllOperators() public view returns(address[] memory operators) {
		operators = new address[](_operatorsListed.length);
		uint256 counter = 0;
		for (uint256 i = 0; i < _operatorsListed.length; i++) {
			if (isOperator(_operatorsListed[i])) {
				operators[counter] = _operatorsListed[i];
				counter++;
			}
		}
	  return operators;
	}

	function isOperator(address _account) public view returns (bool) {
		return _operators.has(_account);
	}

	function addOperator(address _account) public onlyOwner {
		_addOperator(_account);
	}

	function batchAddOperators(address[] memory _accounts) public onlyOwner {
		uint256 arrayLength = _accounts.length;
		for (uint256 i = 0; i < arrayLength; i++) {
			_addOperator(_accounts[i]);
		}
	}

	function removeOperator(address _account) public onlyOwner {
		_removeOperator(_account);
	}

	function batchRemoveOperators(address[] memory _accounts)
		public
		onlyOwner
	{
		uint256 arrayLength = _accounts.length;
		for (uint256 i = 0; i < arrayLength; i++) {
			_removeOperator(_accounts[i]);
		}
	}

	function renounceOperator() public {
		_removeOperator(msg.sender);
	}

	function _addOperator(address _account) internal {
		_operators.add(_account);
		if (_operatorIndexs[_account] == 0) {
		  _operatorsListed.push(_account);
		  _operatorIndexs[_account] = _operatorsListed.length;
		}
		emit OperatorAdded(_account);
	}

	function _removeOperator(address _account) internal {
		_operators.remove(_account);
		emit OperatorRemoved(_account);
	}
}
