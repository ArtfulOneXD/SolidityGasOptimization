// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title GasSaverPro
 * @notice This contract compares gas usage between different optimization patterns
 */
contract GasSaverPro {
    address public owner;

    event GasMeasured(string label, uint256 gasUsed);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    // === Pattern 1: Storage vs Memory ===

    uint256[] public storageArray;

    function storeInStorage(uint256 length) public onlyOwner {
        delete storageArray;
        uint256 startGas = gasleft();

        for (uint256 i = 0; i < length; i++) {
            storageArray.push(i);
        }

        uint256 used = startGas - gasleft();
        emit GasMeasured("Storage Write", used);
    }

    function storeInMemory(uint256 length) public onlyOwner {
        uint256 startGas = gasleft();
        uint256[] memory memArray = new uint256[](length);

        for (uint256 i = 0; i < length; i++) {
            memArray[i] = i;
        }

        uint256 used = startGas - gasleft();
        emit GasMeasured("Memory Write", used);
    }

    // === Pattern 2: Smaller Data Types ===

    function useUint256(uint256 loops) public onlyOwner {
        uint256 startGas = gasleft();
        uint256 total = 0;

        for (uint256 i = 0; i < loops; i++) {
            total += i;
        }

        emit GasMeasured("uint256 loop", startGas - gasleft());
    }

    function useUint8(uint256 loops) public onlyOwner {
        uint256 startGas = gasleft();
        uint8 total = 0;

        for (uint8 i = 0; i < loops && i < type(uint8).max; i++) {
            total += i;
        }

        emit GasMeasured("uint8 loop", startGas - gasleft());
    }

    // === Runner ===

    function runAllBenchmarks(uint256 arrayLength, uint256 loopCount) external onlyOwner {
        storeInStorage(arrayLength);
        storeInMemory(arrayLength);
        useUint256(loopCount);
        useUint8(loopCount);
    }
}
