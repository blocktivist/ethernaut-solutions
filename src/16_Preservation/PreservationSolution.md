# Preservation Solution

Deploy:

```bash
forge create PreservationHack --broadcast --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --constructor-args <instanceAddress>
```

Run:

```bash
cast send <preservationHackAddress> "attack()" --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
