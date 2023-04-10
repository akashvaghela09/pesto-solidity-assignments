// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/**
 * @title StringOperations
 * Contract to perform String Operations
 *
// Assumption : Assume that all the characters in the string are ASCII characters and do not include Unicode characters
 *
 */

contract StringOperations {
    // Find the length of the given string
    function findLength(string memory s) public pure returns (uint256) {
        return bytes(s).length;
    }

    // Find the index of the first occurrence of the given character
    function findAtIndex(
        string calldata s,
        uint256 i
    ) public pure returns (bytes1) {
        bytes memory sBytes = bytes(s);
        require(i < sBytes.length, "Index out of range");
        return sBytes[i];
    }

    // Replace every occurrence of the given character
    function replaceAllOccurence(
        string calldata s,
        string calldata x,
        string calldata y
    ) public pure returns (string memory) {
        bytes memory sBytes = bytes(s);
        bytes1 xBytes = bytes(x)[0];
        bytes1 yBytes = bytes(y)[0];

        // Iterate over the string and replace the character
        for (uint256 i = 0; i < sBytes.length; i++) {
            if (sBytes[i] == xBytes) {
                sBytes[i] = yBytes;
            }
        }

        return string(sBytes);
    }
}
