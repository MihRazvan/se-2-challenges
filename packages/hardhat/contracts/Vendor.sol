pragma solidity 0.8.4; //Do not change the solidity version as it negativly impacts submission grading
// SPDX-License-Identifier: MIT

// import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor {
	// event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

	YourToken public yourToken;

	constructor(address tokenAddress) {
		yourToken = YourToken(tokenAddress);
	}

	// ToDo: create a payable buyTokens() function:
	function buyTokens() public payable {
    yourToken.transfer(address(this), msg.sender, amount???);
  }

	// ToDo: create a withdraw() function that lets the owner withdraw ETH
  function withdraw() public {
    address(this).transfer(msg.sender, value: adress(this).balance);
  }

	// ToDo: create a sellTokens(uint256 _amount) function:
  function sellTokens(uint256 _amount) public {
    msg.sender.transfer(adress(this), value: _amount);
  }
}
