pragma solidity >=0.6.0;

import "forge-std/Script.sol";

contract BlockHashExample{
    bytes32 lastHash;

    function updateBlockHash() external {
        bytes32 newHash = blockhash(block.number - 1);
        lastHash = newHash;
    }
}

contract BlockHashScript is Script {
    function run() public {
        vm.startBroadcast();
        BlockHashExample blockHashExample = new BlockHashExample();
        blockHashExample.updateBlockHash();
        blockHashExample.updateBlockHash();
        vm.stopBroadcast();
    }
}
