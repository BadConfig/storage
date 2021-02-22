pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol";

contract LUport {
    IERC20 usdtToken;
    IERC20 usdcToken;
    IERC20 usdnToken;
    IERC20 daiToken;
    IERC20 busdToken;
    address public owner;
    uint public minimumAmount;
    
    enum TokenType {
        BUSD,
        USDC,
        USDT,
        USDN,
        DAI
    }
    event tokenLocked(address ethAddress, TokenType _type, uint amount);
    event tokenUnlocked(address ethAddress, TokenType _type, uint amount);
    
    constructor(address _owner, uint _minimumAmount) public { 
        owner = _owner;
        minimumAmount = _minimumAmount;
        usdtToken = IERC20(address(0xdAC17F958D2ee523a2206206994597C13D831ec7));
        usdcToken = IERC20(address(0xdAC17F958D2ee523a2206206994597C13D831ec7));
        usdnToken = IERC20(address(0xdAC17F958D2ee523a2206206994597C13D831ec7));
        daiToken  = IERC20(address(0xdAC17F958D2ee523a2206206994597C13D831ec7));
        busdToken = IERC20(address(0x7aA12F1069D13354aee8858622F9e3c6c40f38c3));
    }
    
    modifier OnlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    
    function transferOnwership(address newOwner) OnlyOwner public {
        owner = newOwner;
    }
    
    function depositUSDT(address ethAddress, uint amount) public {
        require(amount >= minimumAmount, "Too low amount");
        require(usdtToken.transferFrom(ethAddress,address(this),amount), "Token lock failed");
        emit tokenLocked(ethAddress, TokenType.USDT, amount);
    }
    
    function withdrawUSDT(address ethAddress, uint amount) OnlyOwner public {
        require(usdtToken.approve(ethAddress,amount), "Unlock failed");
        emit tokenUnlocked(ethAddress, TokenType.USDT, amount);
    }
    
    function depositUSDC(address ethAddress, uint amount) public {
        require(amount >= minimumAmount, "Too low amount");
        require(usdcToken.transferFrom(ethAddress,address(this),amount), "Token lock failed");
        emit tokenLocked(ethAddress, TokenType.USDC, amount);
    }
    
    function withdrawUSDC(address ethAddress, uint amount) OnlyOwner public {
        require(usdcToken.approve(ethAddress,amount), "Unlock failed");
        emit tokenUnlocked(ethAddress, TokenType.USDC, amount);
    }
    
    function depositUSDN(address ethAddress, uint amount) public {
        require(amount >= minimumAmount, "Too low amount");
        require(usdnToken.transferFrom(ethAddress,address(this),amount), "Token lock failed");
        emit tokenLocked(ethAddress, TokenType.USDN, amount);
    }
    
    function withdrawUSDN(address ethAddress, uint amount) OnlyOwner public {
        require(usdnToken.approve(ethAddress,amount), "Unlock failed");
        emit tokenUnlocked(ethAddress, TokenType.USDN, amount);
    }
    
    function depositDAI(address ethAddress, uint amount) public {
        require(amount >= minimumAmount, "Too low amount");
        require(daiToken.transferFrom(ethAddress,address(this),amount), "Token lock failed");
        emit tokenLocked(ethAddress, TokenType.DAI, amount);
    }
    
    function withdrawDAI(address ethAddress, uint amount) OnlyOwner public {
        require(daiToken.approve(ethAddress,amount), "Unlock failed");
        emit tokenUnlocked(ethAddress, TokenType.DAI, amount);
    }

    function depositBUSD(address ethAddress, uint amount) public {
        require(amount >= minimumAmount, "Too low amount");
        require(busdToken.transferFrom(ethAddress,address(this),amount), "Token lock failed");
        emit tokenLocked(ethAddress, TokenType.BUSD, amount);
    }
    
    function withdrawBUSD(address ethAddress, uint amount) OnlyOwner public {
        require(busdToken.approve(ethAddress,amount), "Unlock failed");
        emit tokenUnlocked(ethAddress, TokenType.BUSD, amount);
    }
}
