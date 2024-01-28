// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

interface IVault {
    // Functions
    function deposit() external payable;

    function withdraw() external;
}
