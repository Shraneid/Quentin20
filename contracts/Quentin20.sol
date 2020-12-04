pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Quentin20 is Ownable, ERC20 {
    constructor() public ERC20("Quentin20", "Q20") {}

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public onlyOwner {
        _burn(account, amount);
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokens
    ) public override returns (bool) {
        transferFrom(from, to, tokens);
    }
}
