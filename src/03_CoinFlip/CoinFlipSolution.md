# CoinFlip Solution

Deploy:

```bash
forge create CoinFlipHack --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --constructor-args <instanceAddress>
```

Run 10 times:

```bash
cast send <coinFlipHackAddress> "attack()" --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
