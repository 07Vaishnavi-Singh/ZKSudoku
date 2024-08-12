# ZK Sudoku Validator

This project implements a Zero-Knowledge Proof (ZKP) system to verify the correctness of Sudoku puzzles without revealing the solution.

## Project Structure

The project consists of two main components:

1. `contracts/`: Contains the smart contracts for on-chain verification.
2. `circuits/`: Contains the ZK circuit implementation for off-chain proof generation.

## Overview

This ZK Sudoku validator allows users to prove the correctness of a Sudoku solution without revealing the actual solution. It uses a ZK proof system to generate a proof off-chain, which can then be verified on-chain using smart contracts.

## Prerequisites

[List any prerequisites or dependencies here, e.g.:]
- Node.js 
- Snarkjs
- Circom 
- Hardhat 

