// SPDX-Licence-Identifier: MIT

pragma solidity 0.8.8;

contract SimpleStorage {
    // Basic types: boolean, uint, int, address, bytes
    // bool hasFavoriteNumber = true;
    // uint256 favorityNumber = 5;
    // string favoriteNumberInText = "five";
    // int256 favoriteInt = -5;
    // address myAddress = 0x7F87636c0a570f92b5c940336416735DC0D38Ab9;
    // bytes32 favoriteBytes = "cat";

    uint256 favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // uint256 public favoriteNumbersList;

    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
        retrieve();
    }

    // view and pure functions, when called alone, don't spend gas
    // view and pure functions disallow modification of state
    // view means we're just gonna read state, just read something from this contract
    // pure functions additionally disallow you to read from blockchain state
    // if a gas calling function calls a view or pure function - only then will it cost gas
    // calling view functions is free, unless you call it inside a function that costs gas
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
