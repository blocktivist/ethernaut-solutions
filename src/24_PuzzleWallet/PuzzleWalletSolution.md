# PuzzleWallet Solution

Run to retrieve the contract `balance`:

```bash
cast balance <instanceAddress> --rpc-url $SEPOLIA_RPC_URL
# 1000000000000000
```

Deploy:

```bash
forge create PuzzleWalletHack --broadcast --value <balance>wei --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --gas-limit 1000000 --constructor-args <instanceAddress>
# forge create PuzzleWalletHack --broadcast --value 1000000000000000wei --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --gas-limit 1000000 --constructor-args <instanceAddress>
```
