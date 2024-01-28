// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

contract Vault {
    // Errors
    error NativeTokenTransferError();

    // State variables
    mapping(address => uint256) balances;

    // Functions
    function deposit() external payable {
        balances[msg.sender] = msg.value;
    }

    function withdraw() external {
        (bool sent, ) = payable(msg.sender).call{value: balances[msg.sender]}(
            ""
        );
        if (!sent) {
            revert NativeTokenTransferError();
        }
        delete balances[msg.sender];
    }
}
