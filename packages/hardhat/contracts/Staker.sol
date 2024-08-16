// SPDX-License-Identifier: MIT
pragma solidity 0.8.4; //Do not change the solidity version as it negativly impacts submission grading

import "hardhat/console.sol";
import "./ExampleExternalContract.sol";

contract Staker {
	event Stake(address, uint256);

	ExampleExternalContract public exampleExternalContract;

	mapping(address => uint256) addressToValue;

	uint256 constant deadline = 72 hours;
	uint256 constant threshold = 1 ether;
	uint256 immutable i_startTime;
	bool openForWithdraw = false;

	constructor(address exampleExternalContractAddress) {
		exampleExternalContract = ExampleExternalContract(
			exampleExternalContractAddress
		);
		i_startTime = block.timestamp;
	}

	// Collect funds in a payable `stake()` function and track individual `balances` with a mapping:
	// (Make sure to add a `Stake(address,uint256)` event and emit it for the frontend `All Stakings` tab to display)

	modifier isCompleted() {
		require(!exampleExternalContract.completed());
		_;
	}

	function stake() public payable isCompleted {
		addressToValue[msg.sender] += msg.value;
		emit Stake(msg.sender, msg.value);
	}

	// After some `deadline` allow anyone to call an `execute()` function
	// If the deadline has passed and the threshold is met, it should call `exampleExternalContract.complete{value: address(this).balance}()`

	function execute() public {
		require(
			block.timestamp - deadline > i_startTime,
			"Not enough time passed"
		);

		if (address(this).balance >= threshold) {
			exampleExternalContract.complete{ value: address(this).balance }();
		} else {
			openForWithdraw = true;
		}
	}

	// If the `threshold` was not met, allow everyone to call a `withdraw()` function to withdraw their balance
	function withdraw() public isCompleted {
		require(openForWithdraw, "Cannot Withdraw");
		uint256 valueToWithdraw = addressToValue[msg.sender];
		addressToValue[msg.sender] = 0;
		payable(msg.sender).transfer(valueToWithdraw);
	}

	// Add a `timeLeft()` view function that returns the time left before the deadline for the frontend
	function timeLeft() public view returns (uint256) {
		if (block.timestamp >= i_startTime + deadline) {
			return 0;
		} else {
			return i_startTime + deadline - block.timestamp;
		}
	}

	// Add the `receive()` special function that receives eth and calls stake()
	receive() external payable {
		stake();
	}
}
