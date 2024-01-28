// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract VulnerableBank {
    mapping(address => uint256) balances;

    function deposit() external payable {
        require(msg.value > 0, "Deposited amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) external nonReentrant {
        uint256 balance = balances[msg.sender];
        require(balance >= _amount, "Insufficient balance");

        (bool sent, ) = payable(msg.sender).call{value: _amount}("");
        require(sent, "Failed to withdraw Ether");
        balances[msg.sender] -= _amount;
    }

    function transfer(
        address _recipient,
        uint256 _amount
    ) external nonReentrant {
        uint256 balance = balances[msg.sender];
        require(balance >= _amount, "Insufficient balance");

        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
    }
}
