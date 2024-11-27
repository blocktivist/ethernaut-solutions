# Privacy Solution

Run to retrieve the `_key`:

```bash
cast storage <instanceAddress> 0x5 --rpc-url $SEPOLIA_RPC_URL
# 0x58da4c902090be566abf84c4d340a21b569f1d99d94624783793abea82c86ac7
echo 0x58da4c902090be566abf84c4d340a21b569f1d99d94624783793abea82c86ac7 | cut -c1-34
# 0x58da4c902090be566abf84c4d340a21b
```

Run:

```bash
cast send <instanceAddress> "unlock(bytes16)" <_key> --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
# cast send <instanceAddress> "unlock(bytes16)" 0x58da4c902090be566abf84c4d340a21b --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
