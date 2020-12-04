pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./ERC20TD.sol";
import "./DepositorToken.sol";

contract DepositorContract {
    constructor() public {}

    ERC20TD erc;
    IERC20 teacherToken = IERC20(
        address(0x58E9b79f804eBd4A3109068e1BE414D0BaAC18EC)
    );
    //address teacherAdress = address(0x58E9b79f804eBd4A3109068e1BE414D0BaAC18EC);
    mapping(address => uint256) public claims;

    //keep track of deposited tokens in claims
    function claimTokensFollowed() public {
        erc.claimTokens();
        claims[msg.sender] = 1000;
    }

    //approve function
    function approveDepositorContract() public {
        teacherToken.approve(address(this), 1e18);
    }

    //disapprove function
    function notApproveDepositorContract() public {
        teacherToken.approve(address(this), 0);
    }

    //transfer tokens from the DepositorContract to the address that claimed them
    function transferTokens(uint256 amount) public {
        teacherToken.transfer(msg.sender, amount);
    }

    //
    DepositorToken dt;

    //deposit tokens in DepositorContract using transferFrom on teacher ERC20
    function depositTokens(uint256 amount) public {
        teacherToken.transferFrom(msg.sender, address(this), amount);
        dt.mint(msg.sender, 10);
    }

    function claimDeposit(uint256 amount) public {
        dt.transferFrom(msg.sender, address(this), amount);
        dt.burn(address(this), amount);
    }
}
