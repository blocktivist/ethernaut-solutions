// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract RecoveryHack {
    function attack(address _target) external pure returns (address) {
        address lostContract =
            address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), _target, bytes1(0x01))))));
        return lostContract;
    }
}
