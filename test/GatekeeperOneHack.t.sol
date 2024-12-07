// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Test, console} from "forge-std/Test.sol";

import {GatekeeperOne} from "../src/13_GatekeeperOne/GatekeeperOne.sol";
import {GatekeeperOneHack} from "../src/13_GatekeeperOne/GatekeeperOneHack.sol";

contract GatekeeperOneHackTest is Test {
    error TestFailed();

    GatekeeperOne private _target;
    GatekeeperOneHack private _hack;

    function setUp() external {
        _target = new GatekeeperOne();
        // _target = GatekeeperOne(instanceAddress);
        _hack = new GatekeeperOneHack(address(_target));
    }

    function test_gateTwo() external {
        for (uint256 i = 100; i < 8191; i++) {
            try _hack.attack(i) {
                console.log("_gas", i);
                return;
            } catch {}
        }
        revert TestFailed();
    }
}
