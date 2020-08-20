pragma solidity ^0.5.0;

import "./base/ERC20Pausable.sol";
import "./base/ERC20Burnable.sol";
import "./base/ERC20Mintable.sol";


/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * @dev https://github.com/ethereum/EIPs/issues/20
 * @dev Based on code by FirstBlood: https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */
contract WindsCoinToken is ERC20Pausable, ERC20Burnable, ERC20Mintable {
	string private _name = "WindsCoin";
	string private _symbol = "WDS";
	uint8 private _decimals = 18;

	constructor(address _icoAddress) public {
		uint256 totalSupply = 4000000000 * (10**uint256(_decimals));
		_mint(_icoAddress, totalSupply);
	}

	/**
	 * @dev Returns the name of the token.
	 */
	function name() public view returns (string memory) {
		return _name;
	}

	/**
	 * @dev Returns the symbol of the token, usually a shorter version of the
	 * name.
	 */
	function symbol() public view returns (string memory) {
		return _symbol;
	}

	/**
	 * @dev Returns the number of decimals used to get its user representation.
	 * For example, if `decimals` equals `2`, a balance of `505` tokens should
	 * be displayed to a user as `5,05` (`505 / 10 ** 2`).
	 *
	 * Tokens usually opt for a value of 18, imitating the relationship between
	 * Ether and Wei.
	 *
	 * NOTE: This information is only used for _display_ purposes: it in
	 * no way affects any of the arithmetic of the contract, including
	 * {IERC20-balanceOf} and {IERC20-transfer}.
	 */
	function decimals() public view returns (uint8) {
		return _decimals;
	}
}
