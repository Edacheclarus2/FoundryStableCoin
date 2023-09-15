// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DecentralisedStableCoin} from "../../src/DecentralisedStableCoin.sol";
import {Test, console} from "forge-std/Test.sol";
import {DeployDSC} from "../../script/DeployDSC.s.sol";

contract DecentralisedStableCoinTest is Test {
    DecentralisedStableCoin public dsc;
    DeployDSC public deployer;

    function setUp() public {
        dsc = new DecentralisedStableCoin();
        deployer = new DeployDSC();
    }
}
