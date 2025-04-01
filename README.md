# Gas Optimization Tool

Gas Optimization Tool is a small Solidity contract that demonstrates practical gas-saving techniques. It focuses on struct packing, minimizing storage operations, and avoiding redundant checks—ideal for working with on-chain data in a more efficient way.

## Why this exists

I built this to dive deeper into how Solidity handles storage and gas usage. Most smart contracts waste gas without realizing it. This contract is about writing smarter code—especially in situations like games, analytics, or DeFi platforms where data updates happen often.

## Features

- Struct packing using `uint8` for reduced storage size
- Reduced SSTORE operations by skipping unnecessary writes
- `unchecked` math to skip overflow checks (safe when used right)
- Simple functions for registering and updating users

## How to use

- Deploy on Remix, Ganache, or any testnet
- Call `register()` once per user
- Use `updateStats()` to simulate stat changes
- Fetch current stats with `getStats()`

## Tech Stack

- Solidity ^0.8.x
- EVM-compatible networks
- No libraries or external dependencies

## Notes

This isn’t a production contract, just a sandbox for exploring gas optimizations. But these techniques can absolutely help in real-world apps where storage costs matter.

---

Made by [ArtfulOneXD](https://github.com/ArtfulOneXD)
