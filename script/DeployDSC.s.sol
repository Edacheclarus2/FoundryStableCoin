// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//import {Script} from "../lib/forge-std/src/Script.sol";
import {Script} from "forge-std/Script.sol";
import {DSCEngine} from "../src/DSCEngine.sol";
import {DecentralisedStableCoin} from "../src/DecentralisedStableCoin.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployDSC is Script {
    address[] public tokenAddresses;
    address[] public priceFeedAddresses;

    function run() external returns (DecentralisedStableCoin, DSCEngine, HelperConfig) {
        HelperConfig config = new HelperConfig();

        (address wethUsdPriceFeed, address wbtcUsdPriceFeed, address weth, address wbtc, uint256 deployerKey) =
            config.activeNetworkConfig();

        tokenAddresses = [weth, wbtc];
        priceFeedAddresses = [wethUsdPriceFeed, wbtcUsdPriceFeed];

        vm.startBroadcast(deployerKey);
        DecentralisedStableCoin dscStableCoin = new DecentralisedStableCoin();
        DSCEngine dscEngine = new DSCEngine(tokenAddresses, priceFeedAddresses, address(dscStableCoin));

        dscStableCoin.transferOwnership(address(dscEngine));
        vm.stopBroadcast();
        return (dscStableCoin, dscEngine, config);
    }
}
