// SPDX-License-Identifier: MIT

// This is considered an Exogenous, Decentralized, Anchored (pegged), Crypto Collateralized low volitility coin

// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity ^0.8.18;
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/*
 * @title DecentralisedStableCoin
 * @author Edache Michael
 * @Collateral: Exogenous (ETH & BTC)
 * Minting: Algorithmic
 * Relative Stability: Peggged to USD
 *
 * This is the contract meant to be governed by DSCEngine. This contract is just the ERC-20 Implimentation of our StableCoin System.
 *
 */

contract DecentralisedStableCoin is ERC20Burnable, Ownable {
    error DecentralisedStableCoin_MustBeMoreThanZero();
    error DecentralisedStableCoin_BurnAmountExccedsBalance();
    error DecentralisedStableCoin_NotZeroAddress();

    constructor() ERC20("DecentralisedStableCoin", "DSC") {}

    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);
        if (_amount <= 0) {
            revert DecentralisedStableCoin_MustBeMoreThanZero();
        }
        if (balance < _amount) {
            revert DecentralisedStableCoin_BurnAmountExccedsBalance();
        }
        super.burn(_amount);
    }

    function mint(
        address _to,
        uint256 _amount
    ) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert DecentralisedStableCoin_NotZeroAddress();
        }
        if (_amount <= 0) {
            revert DecentralisedStableCoin_MustBeMoreThanZero();
        }
        _mint(_to, _amount);
        return true;
    }
}
