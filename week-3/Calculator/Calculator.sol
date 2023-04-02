// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

contract Calculator {
    // take 2 integers and return addition
    function addition(uint256 _num1, uint256 _num2)
        public
        pure
        returns (uint256)
    {
        return _num1 + _num2;
    }

    // take 2 integers and return subtraction
    // use int for holding negetive value
    function subtraction(int256 _num1, int256 _num2)
        public
        pure
        returns (int256)
    {
        return _num1 - _num2;
    }

    // take 2 integers and return multiplication
    function multiplication(uint256 _num1, uint256 _num2)
        public
        pure
        returns (uint256)
    {
        return _num1 * _num2;
    }

    // take 2 integers and return division
    function division(uint256 _num1, uint256 _num2)
        public
        pure
        returns (uint256)
    {
        return _num1 / _num2;
    }

    // take 2 integers and return modulo
    function modulo(uint256 _num1, uint256 _num2)
        public
        pure
        returns (uint256)
    {
        return _num1**_num2;
    }
}
