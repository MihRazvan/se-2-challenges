pragma solidity 0.8.4; //Do not change the solidity version as it negativly impacts submission grading
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {
	event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

	uint256 public constant tokensPerEth = 100;
	YourToken public yourToken;

	constructor(address tokenAddress) {
		yourToken = YourToken(tokenAddress);
	}

	// ToDo: create a payable buyTokens() function:
	function buyTokens() public payable {
		require(msg.value > 0, "You need to send some ETH to buy tokens");

		uint256 amountOfEth = msg.value;
		uint256 amountOfTokens = (tokensPerEth * amountOfEth) / 1e18;
		require(
			yourToken.balanceOf(address(this)) >= amountOfTokens,
			"Vendor has insufficient tokens"
		);

		yourToken.transfer(msg.sender, amountOfTokens);
		emit BuyTokens(msg.sender, amountOfEth, amountOfTokens);
	}

	// ToDo: create a withdraw() function that lets the owner withdraw ETH
	function withdraw() public onlyOwner {
		payable(owner()).transfer(address(this).balance);
	}

	// ToDo: create a sellTokens(uint256 _amount) function:
}
