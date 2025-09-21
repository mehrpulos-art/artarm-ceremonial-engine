// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title AtrarmⓇ Treasury Contract
 * @author Mehrdad Razmi — Eiindar Azam
 * @dev ثبت آیینی خزانه تمدن AtrarmⓇ روی بلاکچین Ethereum
 * مهر ثبت: GOLDEN-ARTARM-CODE-SEAL
 * مکان آیینی: قافلانکوه، ایران
 * تاریخ ثبت: 1404/06/31 | 2025/09/22
 */

contract AtrarmTreasury {
    address public owner;
    mapping(address => uint256) public balances;

    event Deposit(address indexed from, uint256 amount, string ceremonialReference);
    event Withdraw(address indexed to, uint256 amount, string ceremonialReference);

    modifier onlyOwner() {
        require(msg.sender == owner, "فقط صادرکننده مهر تمدن مجاز است");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function deposit(string calldata ceremonialReference) external payable {
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value, ceremonialReference);
    }

    function withdraw(address payable to, uint256 amount, string calldata ceremonialReference) external onlyOwner {
        require(balances[to] >= amount, "موجودی کافی نیست");
        balances[to] -= amount;
        to.transfer(amount);
        emit Withdraw(to, amount, ceremonialReference);
    }
}