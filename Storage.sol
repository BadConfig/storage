// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol";

interface transferable {
    function getData(
    mapping (address => uint) usdtTokens,
    uint usdtSupply,
    mapping (address => uint) usdcTokens,
    uint usdcSupply,
    mapping (address => uint) tusdTokens,
    uint tusdSupply,
    mapping (address => uint) usdnTokens,
    uint usdnSupply,
    mapping (address => uint) busdTokens,
    uint busdSupply,
    mapping (address => uint) husdTokens,
    uint husdSupply,
    mapping (address => uint) daiTokens,
    uint daiSupply,
    mapping (address => uint) susdTokens,
    uint susdSupply,
    mapping (address => uint) usdkTokens,
    uint usdkSupply,
    mapping (address => uint) ustTokens,
    uint ustSupply,
    mapping (address => uint) musdTokens,
    uint musdSupply,
    mapping (address => uint) gusdTokens,
    uint gusdSupply,
    uint256 totalSupply);
}

 contract Storage {
    IERC20 public usdt;
    IERC20 public usdc;
    IERC20 public tusd;
    IERC20 public usdn;
    IERC20 public busd;
    IERC20 public husd;
    IERC20 public dai;
    IERC20 public susd;
    IERC20 public usdk;
    IERC20 public ust;
    IERC20 public musd;
    IERC20 public gusd;
    address public owner;
    uint public minimumAmmount;
    mapping (address => uint) public usdtTokens;
    uint public usdtSupply;
    mapping (address => uint) public usdcTokens;
    uint public usdcSupply;
    mapping (address => uint) public tusdTokens;
    uint public tusdSupply;
    mapping (address => uint) public usdnTokens;
    uint public usdnSupply;
    mapping (address => uint) public busdTokens;
    uint public busdSupply;
    mapping (address => uint) public husdTokens;
    uint public husdSupply;
    mapping (address => uint) public daiTokens;
    uint public daiSupply;
    mapping (address => uint) public susdTokens;
    uint public susdSupply;
    mapping (address => uint) public usdkTokens;
    uint public usdkSupply;
    mapping (address => uint) public ustTokens;
    uint public ustSupply;
    mapping (address => uint) public musdTokens;
    uint public musdSupply;
    mapping (address => uint) public gusdTokens;
    uint public gusdSupply;
    uint256 public totalSupply;
    
    constructor(address _owner, uint _minimumAmmount) { 
        owner = _owner;
        minimumAmmount = _minimumAmmount;
        usdt = 0xdac17f958d2ee523a2206206994597c13d831ec7;
        usdc = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48;
        tusd = 0x0000000000085d4780B73119b644AE5ecd22b376;
        usdn = 0x674C6Ad92Fd080e4004b2312b45f796a192D27a0;
        busd = 0x4fabb145d64652a948d72533023f6e7a623c7c53;
        husd = 0xdf574c24545e5ffecb9a659c229253d4111d87e1;
        dai  = 0x6b175474e89094c44da98b954eedeac495271d0f;
        susd = 0x57ab1ec28d129707052df4df418d58a2d46d5f51;
        usdk = 0x1c48f86ae57291f7686349f12601910bd8d470bb;
        ust  = 0xa47c8bf37f92abed4a126bda807a7b7498661acd;
        musd = 0xe2f2a5c287993345a840db3b0845fbc70f5935a5;
        gusd = 0x056fd409e1d7a124bd7017459dfea2f387b6d5cd;
        
    }
    
    modifier OnlyOwner() {
        require(msg.sender == owner, "Not owner");
    }
    
    function transferOnwership(adress newOwner) OnlyOwner public {
        owner = newOwner;
    }
    
    function changeInvestor(address previous, address next) OnlyOwner public {
        investors[previous] = false;
        investors[next]=true;
    }
    
    function transferSupply(address to) {
        takeUsdt(to);
        takeUsdc(to);
        takeTusd(to);
        takeUsdn(to);
        takeBusd(to);
        takeHusd(to);
        takeDai(to);
        takeSusd(to);
        takeUsdk(to);
        takeUst(to);
        takeLinkusd(to);
        takeMusd(to);
        takeGusd(to);
        transferable(to).getData(
            usdtTokens,
            usdtSupply,
            usdcTokens,
            usdcSupply,
            tusdTokens,
            tusdSupply,
            usdnTokens,
            usdnSupply,
            busdTokens,
            busdSupply,
            husdTokens,
            husdSupply,
            daiTokens,
            daiSupply,
            susdTokens,
            susdSupply,
            usdkTokens,
            usdkSupply,
            ustTokens,
            ustSupply,
            linkusdTokens,
            linkusdSupply,
            musdTokens,
            musdSupply,
            gusdTokens,
            gusdSupply,
            totalSupply
        );
    }
    
    function addUsdt(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(usdt.allowance(from,address(this)) >= ammount, "Not enough tokens");
        usdt.transferFrom(from,address(this),ammount);
        usdtTokens[from] += ammount;
        usdtSupply += ammount;
        totalSupply += ammount;
    }
    
    function addUsdc(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(usdc.allowance(from,address(this)) >= ammount, "Not enough tokens");
        usdc.transferFrom(from,address(this),ammount);
        usdcTokens[from] += ammount;
        usdcSupply += ammount;
        totalSupply += ammount;
    }
    
    function addTusd(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(tusd.allowance(from,address(this)) >= ammount, "Not enough tokens");
        tusd.transferFrom(from,address(this),ammount);
        tusdTokens[from] += ammount;
        tusdSupply += ammount;
        totalSupply += ammount;
    }
    
    function addUsdn(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(usdn.allowance(from,address(this)) >= ammount, "Not enough tokens");
        usdn.transferFrom(from,address(this),ammount);
        usdnTokens[from] += ammount;
        usdnSupply += ammount;
        totalSupply += ammount;
    }
    
    function addBusd(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(busd.allowance(from,address(this)) >= ammount, "Not enough tokens");
        busd.transferFrom(from,address(this),ammount);
        busdTokens[from] += ammount;
        busdSupply += ammount;
        totalSupply += ammount;
    }
    
    function addHusd(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(husd.allowance(from,address(this)) >= ammount, "Not enough tokens");
        husd.transferFrom(from,address(this),ammount);
        husdTokens[from] += ammount;
        husdSupply += ammount;
        totalSupply += ammount;
    }
    
    function addDai(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(dai.allowance(from,address(this)) >= ammount, "Not enough tokens");
        dai.transferFrom(from,address(this),ammount);
        daiTokens[from] += ammount;
        daiSupply += ammount;
        totalSupply += ammount;
    }
    
    function addSusd(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(susd.allowance(from,address(this)) >= ammount, "Not enough tokens");
        susd.transferFrom(from,address(this),ammount);
        susdTokens[from] += ammount;
        susdSupply += ammount;
        totalSupply += ammount;
    }

    function addUsdk(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(usdk.allowance(from,address(this)) >= ammount, "Not enough tokens");
        usdk.transferFrom(from,address(this),ammount);
        usdkTokens[from] += ammount;
        usdkSupply += ammount;
        totalSupply += ammount;
    }
    
    function addUst(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(ust.allowance(from,address(this)) >= ammount, "Not enough tokens");
        ust.transferFrom(from,address(this),ammount);
        ustTokens[from] += ammount;
        ustSupply += ammount;
        totalSupply += ammount;
    }
    
    function addMusd(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(musd.allowance(from,address(this)) >= ammount, "Not enough tokens");
        musd.transferFrom(from,address(this),ammount);
        musdTokens[from] += ammount;
        musdSupply += ammount;
        totalSupply += ammount;
    }
    
    function addGusd(address from, uint ammount) public {
        require(ammount >= minimumAmmount, "Too low ammount");
        require(gusd.allowance(from,address(this)) >= ammount, "Not enough tokens");
        gusd.transferFrom(from,address(this),ammount);
        gusdTokens[from] += ammount;
        gusdSupply += ammount;
        totalSupply += ammount;
    }
    
    function takeUsdt(address to, uint ammount) OnlyOwner public {
        require(usdtTokens[address(this)] >= ammount, "Too low ammount");
        usdt.approve(to,ammount);
        usdtTokens[address(this)] -= ammount;
        usdtSupply -= ammount;
        totalSupply -= ammount;
    }
    
    function takeUsdc(address to, uint ammount) OnlyOwner public {
        require(usdcTokens[address(this)] >= ammount, "Too low ammount");
        usdc.approve(to,ammount);
        usdcTokens[address(this)] -= ammount;
        usdcSupply -= ammount;
        totalSupply -= ammount;
    }
    
    function takeTusd(address to, uint ammount) OnlyOwner public {
        require(tusdTokens[address(this)] >= ammount, "Too low ammount");
        tusd.approve(to,ammount);
        tusdTokens[address(this)] -= ammount;
        tusdSupply -= ammount;
        totalSupply -= ammount;
    }
    
    function takeUsdn(address to, uint ammount) OnlyOwner public {
        require(usdnTokens[address(this)] >= ammount, "Too low ammount");
        usdn.approve(to,ammount);
        usdnTokens[address(this)] -= ammount;
        usdnSupply -= ammount;
        totalSupply -= ammount;
    }
    
    function takeBusd(address to, uint ammount) OnlyOwner public {
        require(busdTokens[address(this)] >= ammount, "Too low ammount");
        busd.approve(to,ammount);
        busdTokens[address(this)] -= ammount;
        busdSupply -= ammount;
        totalSupply -= ammount;
    }
    
    function takeHusd(address to, uint ammount) OnlyOwner public {
        require(husdTokens[address(this)] >= ammount, "Too low ammount");
        husd.approve(to,ammount);
        husdTokens[address(this)] -= ammount;
        husdSupply -= ammount;
        totalSupply -= ammount;
    }
    
    function takeDai(address to, uint ammount) OnlyOwner public {
        require(daiTokens[address(this)] >= ammount, "Too low ammount");
        dai.approve(to,ammount);
        daiTokens[address(this)] -= ammount;
        daiSupply -= ammount;
        totalSupply -= ammount;
    }
    
    function takeSusd(address to, uint ammount) OnlyOwner public {
        require(susdTokens[address(this)] >= ammount, "Too low ammount");
        susd.approve(to,ammount);
        susdTokens[address(this)] -= ammount;
        susdSupply -= ammount;
        totalSupply -= ammount;
    }

    function takeUsdk(address to, uint ammount) OnlyOwner public {
        require(usdkTokens[address(this)] >= ammount, "Too low ammount");
        usdk.approve(to,ammount);
        usdkTokens[address(this)] -= ammount;
        usdkSupply -= ammount;
        totalSupply -= ammount;
    }
    
    function takeUst(address to, uint ammount) OnlyOwner public {
        require(daiTokens[address(this)] >= ammount, "Too low ammount");
        dai.approve(to,ammount);
        daiTokens[address(this)] -= ammount;
        ustSupply -= ammount;
        totalSupply -= ammount;
    }
    
    function takeMusd(address to, uint ammount) OnlyOwner public {
        require(musdTokens[address(this)] >= ammount, "Too low ammount");
        musd.approve(to,ammount);
        musdTokens[address(this)] -= ammount;
        musdSupply -= ammount;
        totalSupply -= ammount;
    }
    
    function takeGusd(address to, uint ammount) OnlyOwner public {
        require(gusdTokens[address(this)] >= ammount, "Too low ammount");
        gusd.approve(to,ammount);
        gusdTokens[address(this)] -= ammount;
        gusdSupply -= ammount;
        totalSupply -= ammount;
    }
 }
 

