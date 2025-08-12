# Simple DeFi Staking

## Overview
A minimal Clarity smart contract that allows users to stake fungible tokens into the contract and track their staking balance.  
This is a **very basic implementation** for educational purposes.

---

## Features
- Stake any SIP-010 compatible fungible token.
- Track how much each user has staked.

---

## Project Vision
The vision for **Simple DeFi Staking** is to provide a minimal, secure, and easy-to-understand staking mechanism on the Stacks blockchain.  
This project serves as a foundation for more advanced staking protocols, reward distributions, and DeFi integrations.

---

## Future Scope
1. **Rewards Distribution** – Implement periodic reward payouts for stakers.
2. **Unstaking Function** – Allow users to withdraw their staked tokens.
3. **Locking Periods** – Add time locks for higher yield incentives.
4. **Multiple Token Support** – Stake and earn rewards from multiple tokens.
5. **Governance** – Integrate with a DAO for community-driven decisions.

---

## Contract Address
**`SPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.simple-defi-staking`**
<img width="1897" height="904" alt="image" src="https://github.com/user-attachments/assets/96847120-80c1-424b-a42f-51a1be6f7a7b" />

---

## Functions

### `stake (amount uint) (token <ft-trait>)`
Stake a specific amount of a fungible token into the contract.  
- **Parameters**:
  - `amount` – The number of tokens to stake.
  - `token` – The SIP-010 token contract to stake.
- **Returns**:
  - `(ok true)` if successful.

### `get-stake`
Returns the staked balance of the caller.  
- **Parameters**: None
- **Returns**:
  - `(ok uint)` – The amount the caller has staked.

---

## Example Usage
```clarity
;; Stake 100 SIMPLE tokens
(contract-call? .simple-defi-staking stake u100 .simple-token)

;; Get current stake balance
(contract-call? .simple-defi-staking get-stake)


-----
