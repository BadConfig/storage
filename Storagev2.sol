pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol";

 contract Storage {
     
    mapping (address => mapping ( address => uint )) public impact;
    mapping (address => uint) public tokenAmount;
    mapping (address => bool) public bindedTokens;
    address[] bindedTokensAddr;
    address public owner;
    uint public minimumAmount;
    uint256 public totalSupply;
    
    constructor(address _owner, uint _minimumAmount) public { 
        owner = _owner;
        minimumAmount = _minimumAmount;
        // optionaly bindedTokensAddr = _bindedTokensAddr;
        bindedTokensAddr.push(address(0xdAC17F958D2ee523a2206206994597C13D831ec7));
        bindedTokensAddr.push(address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48));
        bindedTokensAddr.push(address(0x0000000000085d4780B73119b644AE5ecd22b376));
        bindedTokensAddr.push(address(0x674C6Ad92Fd080e4004b2312b45f796a192D27a0));
        bindedTokensAddr.push(address(0x4Fabb145d64652a948d72533023f6E7A623C7C53));
        bindedTokensAddr.push(address(0xdF574c24545E5FfEcb9a659c229253D4111d87e1));
        bindedTokensAddr.push(address(0x6B175474E89094C44Da98b954EedeAC495271d0F));
        bindedTokensAddr.push(address(0x57Ab1ec28D129707052df4dF418D58a2D46d5f51));
        bindedTokensAddr.push(address(0x1c48f86ae57291F7686349F12601910BD8D470bb));
        bindedTokensAddr.push(address(0xa47c8bf37f92aBed4A126BDA807A7b7498661acD));
        bindedTokensAddr.push(address(0xe2f2a5C287993345a840Db3B0845fbC70f5935a5));
        bindedTokensAddr.push(address(0x056Fd409E1d7A124BD7017459dFEa2F387b6d5Cd));
        for (uint i = 0; i < bindedTokensAddr.length; ++i) {
            bindedTokens[bindedTokensAddr[i]] = true;
        }
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
        for (uint i = 0; i < bindedTokensAddr.length; ++i) {
            totalImpact += impact[bindedTokensAddr[i]][user];
        }
        return totalImpact;
    }
    
    function totalImpactOf(address user, uint precision) public returns (uint) {
        uint supply = totalSupplyOf(user);
        uint _supply = supply * 10 ** (precision + 1);
        return (((_supply/totalSupply)+5)/10);
    }
    

    function deposit(address from, uint amount, address token) public {
        require(bindedTokens[token],"Token not binded");
        require(amount >= minimumAmount, "Too low amount");
        require(IERC20(token).allowance(from,address(this)) >= amount, "Not enough tokens");
        IERC20(token).transferFrom(from,address(this),amount);
        impact[token][from] += amount;
        tokenAmount[token] += amount;
        totalSupply += amount;
    }
    
    function withdraw(address to, uint amount, address token) OnlyOwner public {
        require(bindedTokens[token],"Token not binded");
        require(tokenAmount[token] >= amount, "Too low amount");
        IERC20(token).approve(to,amount);
        tokenAmount[token] -= amount;
        totalSupply -= amount;
    }

 }
 

