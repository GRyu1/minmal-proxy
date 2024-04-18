// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract PseudoMinimalProxy {
    address masterCopy;

    constructor(address _masterCopy) {
        masterCopy = _masterCopy;
    }

    function forward() external returns (bytes memory) {
        (bool success, bytes memory data) = masterCopy.delegatecall(msg.data);
        require(success, "delegatecall failed");
        return data;
    }
}