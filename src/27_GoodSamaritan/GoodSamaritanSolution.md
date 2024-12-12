# GoodSamaritan Solution

Deploy:

```bash
forge create GoodSamaritanHack --broadcast --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --constructor-args <instanceAddress>
```

Run:

```bash
cast send <goodSamaritanHackAddress> "attack()" --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
