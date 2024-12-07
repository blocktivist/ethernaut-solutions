# King Solution

Run to retrieve the `prize`:

```bash
cast storage <instanceAddress> 0x1 --rpc-url $SEPOLIA_RPC_URL
# 0x00000000000000000000000000000000000000000000000000038d7ea4c68000
cast to-dec 0x00000000000000000000000000000000000000000000000000038d7ea4c68000
# 1000000000000000
```

Deploy:

```bash
forge create KingHack --broadcast --value <prize>wei --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --constructor-args <instanceAddress>
# forge create KingHack --value 1000000000000000wei --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --constructor-args <instanceAddress>
```
