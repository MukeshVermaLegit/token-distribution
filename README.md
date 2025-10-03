# Token Distribution (ERC20)

A simple ERC20 token built with **Foundry** and **OpenZeppelin**.

## Token Details
- **Total supply**: 1,000,000 tokens (18 decimals)
- **Network**: Base Sepolia Testnet

## Initial Distribution
On deployment:
- 20% → Wallet 1
- 20% → Wallet 2  
- 20% → Wallet 3
- 40% remains with deployer

## Features
- Standard ERC20 functionality
- `burn()` function to destroy your own tokens

## Setup 

```bash
# 1. Create environment file
touch .env
# Add to .env:
# RPC_URL=<your_base_sepolia_rpc>
# PRIVATE_KEY=<your_private_key>

# 2. Install dependencies
forge install

# 3. Deploy contract
forge script script/DeployToken.s.sol:DeployToken --rpc-url $RPC_URL --broadcast

# 4. Check balances
cast call <CONTRACT_ADDRESS> "balanceOf(address)(uint256)" <WALLET1> --rpc-url $RPC_URL
cast call <CONTRACT_ADDRESS> "balanceOf(address)(uint256)" <WALLET2> --rpc-url $RPC_URL
cast call <CONTRACT_ADDRESS> "balanceOf(address)(uint256)" <WALLET3> --rpc-url $RPC_URL
cast call <CONTRACT_ADDRESS> "balanceOf(address)(uint256)" <DEPLOYER> --rpc-url $RPC_URL

# 5. Check total supply
cast call <CONTRACT_ADDRESS> "totalSupply()(uint256)" --rpc-url $RPC_URL

# 6. Burn tokens
cast send <CONTRACT_ADDRESS> "burn(uint256)" <AMOUNT> --private-key $PRIVATE_KEY --rpc-url $RPC_URL
