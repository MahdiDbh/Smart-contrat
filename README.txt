# ByCoffeContract

A simple Solidity smart contract for tipping a recipient, with an automatic fee (tax) going to the webmaster. This contract enables anyone to send tips to a specified recipient, deducting a percentage as a webmaster fee.

## Features

- Tip any recipient address.
- 30% of each tip is automatically sent to the webmaster.
- Owner can set or update the webmaster address.
- All transactions are payable in Ether.

## How It Works

1. **Set Webmaster**  
   The contract owner (or any user) sets the webmaster address using:
   ```solidity
   setWebmaster(address _webmaster)
   ```

2. **Tip a Recipient**  
   Any user can call:
   ```solidity
   tipRecipist(address _recipist)
   ```
   along with Ether, specifying the recipient’s address.

   - 70% of the sent Ether is forwarded to the recipient.  
   - 30% is sent to the webmaster as a fee.

## Functions

### `setWebmaster`

```solidity
function setWebmaster(address _webmaster) public
```

- **Description:** Assigns a webmaster address to receive a percentage of each tip.
- **Requirements:** The provided address must not be the zero address.

### `tipRecipist`

```solidity
function tipRecipist(address _recipist) public payable
```

- **Description:** Sends a tip to the specified recipient, and the webmaster receives a 30% fee.
- **Requirements:**
  - The recipient and webmaster addresses must be set and valid.
  - `msg.value` must be greater than 0.

## Technologies Used

- [Solidity](https://soliditylang.org/) – Smart contract programming language.
- [Ethereum](https://ethereum.org/) – Blockchain platform for deploying the contract.
- [Remix IDE](https://remix.ethereum.org/) – Online IDE for writing, testing, and deploying smart contracts.
- [Ganashe]() .

## License

This project is licensed under the [MIT License](LICENSE).
