// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {MagicNum} from "./MagicNum.sol";

contract MagicNumHack {
    error ContractNotDeployed();

    MagicNum private immutable TARGET;

    constructor(address _target) {
        TARGET = MagicNum(_target);
        address addr;
        bytes memory bytecode = hex"69602a60005260206000f3600052600a6016f3";
        assembly {
            addr := create(0, add(bytecode, 0x20), 0x13)
        }
        if (addr == address(0)) revert ContractNotDeployed();
        TARGET.setSolver(addr);
    }
}
