pragma solidity ^0.5.0;


/**
 * @title Roles
 * @dev Library for managing addresses assigned to a Role.
 */
library Roles {
	struct Role {
		mapping(address => bool) bearer;
	}

	/**
	 * @dev Give an account access to this role.
	 */
	function add(Role storage _role, address _account) internal {
		require(!has(_role, _account), "Roles: account already has role");
		_role.bearer[_account] = true;
	}

	/**
	 * @dev Remove an account's access to this role.
	 */
	function remove(Role storage _role, address _account) internal {
		require(has(_role, _account), "Roles: account does not have role");
		_role.bearer[_account] = false;
	}

	/**
	 * @dev Check if an account has this role.
	 * @return bool
	 */
	function has(Role storage _role, address _account)
		internal
		view
		returns (bool)
	{
		require(_account != address(0), "Roles: account is the zero address");
		return _role.bearer[_account];
	}
}
