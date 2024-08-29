pragma solidity 0.8.4; //Do not change the solidity version as it negativly impacts submission grading
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {
	event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

	uint256 constant tokensPerEth = 100;
	YourToken public yourToken;

	constructor(address tokenAddress) {
		yourToken = YourToken(tokenAddress);
	}

	// ToDo: create a payable buyTokens() function:
	function buyTokens() public payable {
		yourToken.transfer(msg.sender, tokensPerEth * msg.value);
		emit BuyTokens(msg.sender, msg.value, tokensPerEth * msg.value);
	}

	// ToDo: create a withdraw() function that lets the owner withdraw ETH

	// ToDo: create a sellTokens(uint256 _amount) function:
}
