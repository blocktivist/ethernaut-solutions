# Ethernaut Solutions

This repository contains the solutions for the [Ethernaut](https://ethernaut.openzeppelin.com/) challenges.

## Requirements

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git): Run `git --version` to check the existing installation.
- [Foundry](https://getfoundry.sh/): Run `forge --version` to check the existing installation.

## Setup

To clone the repository and install the dependencies, run:

```bash
git clone https://github.com/blocktivist/ethernaut-solutions
cd ethernaut-solutions
forge install foundry-rs/forge-std
forge install OpenZeppelin/openzeppelin-contracts@v4.9.6
forge build
```

## Instructions

To add a Sepolia RPC URL, run:

```bash
cp .env.example .env
# Add Sepolia RPC URL
source .env
```

To add a private key, run:

```bash
cast wallet import sepoliaKey --interactive
```

For each challenge, deploy a new instance through the browser using the `sepoliaKey`.

To fetch the `instanceAddress`, open the browser's developer console and run:

```javascript
contract.address
```
