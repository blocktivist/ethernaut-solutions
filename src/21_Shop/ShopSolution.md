# Shop Solution

Deploy:

```bash
forge create ShopHack --broadcast --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --constructor-args <instanceAddress>
```

Run:

```bash
cast send <shopHackAddress> "attack()" --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
