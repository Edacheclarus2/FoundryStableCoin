1. Relative Stability: Anchored or Pegged -> $1.00
   1. Chainlink Price Feed.
   2. Set a function to exchange ETH $ BTC - $$$
2. Stability Mechanism: Algorithmic (Decentralized)
   1. People can only mint the stableCoin with enough collateral (coded)
3. Collateral: Exogenous (Crypto)
    1. WETH
    2. WBTC


installing chainlink 
forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit

line 54 and 61 on HelperConfig  are commented  because it seems openzeppelin have depreciated the original constructor codes => RESOLVED. ERC20MOCK from openzeppelin has no constructor arguments

most common error in my DSCEngine test are DIVISION OR MODULO BY 0.
