pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol";

 contract Storage {
     
    enum TokenType {
        usdt,
        usdc,
        tusd,
        usdn,
        busd,
        husd,
        dai,
        susd,
        usdk,
        ust,
        musd,
        gusd
    }
    mapping (TokenType => address) public tokenAddress;
    mapping (TokenType => mapping ( address => uint )) public impact;
    mapping (TokenType => uint) public tokenAmount;
    address public owner;
    uint public minimumAmount;
    uint256 public totalSupply;
    
    constructor(address _owner, uint _minimumAmount) public { 
        owner = _owner;
        minimumAmount = _minimumAmount;
        tokenAddress[TokenType.usdt] = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);
        tokenAddress[TokenType.usdc] = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
        tokenAddress[TokenType.tusd] = address(0x0000000000085d4780B73119b644AE5ecd22b376);
        tokenAddress[TokenType.usdn] = address(0x674C6Ad92Fd080e4004b2312b45f796a192D27a0);
        tokenAddress[TokenType.busd] = address(0x4Fabb145d64652a948d72533023f6E7A623C7C53);
        tokenAddress[TokenType.husd] = address(0xdF574c24545E5FfEcb9a659c229253D4111d87e1);
        tokenAddress[TokenType.dai]  = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);
        tokenAddress[TokenType.susd] = address(0x57Ab1ec28D129707052df4dF418D58a2D46d5f51);
        tokenAddress[TokenType.usdk] = address(0x1c48f86ae57291F7686349F12601910BD8D470bb);
        tokenAddress[TokenType.ust]  = address(0xa47c8bf37f92aBed4A126BDA807A7b7498661acD);
        tokenAddress[TokenType.musd] = address(0xe2f2a5C287993345a840Db3B0845fbC70f5935a5);
        tokenAddress[TokenType.gusd] = address(0x056Fd409E1d7A124BD7017459dFEa2F387b6d5Cd);
        
    }
    
    modifier OnlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    
    function transferOnwership(address newOwner) OnlyOwner public {
        owner = newOwner;
    }
    
    function totalSupplyOf(address user) public returns (uint) {
        uint totalImpact;
        totalImpact += impact[TokenType.usdt][user];
        totalImpact += impact[TokenType.usdc][user];
        totalImpact += impact[TokenType.tusd][user];
        totalImpact += impact[TokenType.usdn][user];
        totalImpact += impact[TokenType.busd][user];
        totalImpact += impact[TokenType.husd][user];
        totalImpact += impact[TokenType.dai][user];
        totalImpact += impact[TokenType.susd][user];
        totalImpact += impact[TokenType.usdk][user];
        totalImpact += impact[TokenType.ust][user];
        totalImpact += impact[TokenType.musd][user];
        totalImpact += impact[TokenType.gusd][user];
        return totalImpact;
    }
    
    function totalImpactOf(address user, uint precision) public returns (uint) {
        uint supply = totalSupplyOf(user);
        uint _supply = supply * 10 ** (precision + 1);
        return (((_supply/totalSupply)+5)/10);
    }
    

    function deposit(address from, uint amount, uint tokenInt) public {
        require(tokenInt < 12,"Not a valid token integer passed");
        TokenType t = TokenType(tokenInt);
        require(amount >= minimumAmount, "Too low amount");
        require(IERC20(tokenAddress[t]).allowance(from,address(this)) >= amount, "Not enough tokens");
        IERC20(tokenAddress[t]).transferFrom(from,address(this),amount);
        impact[t][from] += amount;
        tokenAmount[t] += amount;
        totalSupply += amount;
    }
    
    function withdraw(address to, uint amount, uint tokenInt) OnlyOwner public {
        require(tokenInt < 12,"Not a valid token integer passed");
        TokenType t = TokenType(tokenInt);
        require(tokenAmount[t] >= amount, "Too low amount");
        IERC20(tokenAddress[t]).approve(to,amount);
        tokenAmount[t] -= amount;
        totalSupply -= amount;
    }

 }
 

