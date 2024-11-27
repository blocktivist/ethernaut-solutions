# Elevator Solution

Deploy:

```bash
forge create ElevatorHack --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey --constructor-args <instanceAddress>
```

Run:

```bash
cast send <elevatorHackAddress> "attack()" --rpc-url $SEPOLIA_RPC_URL --account sepoliaKey
```
