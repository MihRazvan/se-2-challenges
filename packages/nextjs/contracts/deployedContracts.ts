/**
 * This file is autogenerated by Scaffold-ETH.
 * You should not edit it manually or your changes might be overwritten.
 */
import { GenericContractsDeclaration } from "~~/utils/scaffold-eth/contract";

const deployedContracts = {
  31337: {
    ExampleExternalContract: {
      address: "0x5FbDB2315678afecb367f032d93F642f64180aa3",
      abi: [
        {
          inputs: [],
          name: "complete",
          outputs: [],
          stateMutability: "payable",
          type: "function",
        },
        {
          inputs: [],
          name: "completed",
          outputs: [
            {
              internalType: "bool",
              name: "",
              type: "bool",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
      ],
      inheritedFunctions: {},
    },
    Staker: {
      address: "0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9",
      abi: [
        {
          inputs: [
            {
              internalType: "address",
              name: "exampleExternalContractAddress",
              type: "address",
            },
          ],
          stateMutability: "nonpayable",
          type: "constructor",
        },
        {
          anonymous: false,
          inputs: [],
          name: "Stake",
          type: "event",
        },
        {
          inputs: [],
          name: "exampleExternalContract",
          outputs: [
            {
              internalType: "contract ExampleExternalContract",
              name: "",
              type: "address",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [],
          name: "execute",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          inputs: [],
          name: "stake",
          outputs: [],
          stateMutability: "payable",
          type: "function",
        },
        {
          inputs: [],
          name: "timeLeft",
          outputs: [
            {
              internalType: "uint256",
              name: "",
              type: "uint256",
            },
          ],
          stateMutability: "view",
          type: "function",
        },
        {
          inputs: [],
          name: "withdraw",
          outputs: [],
          stateMutability: "nonpayable",
          type: "function",
        },
        {
          stateMutability: "payable",
          type: "receive",
        },
      ],
      inheritedFunctions: {},
    },
  },
} as const;

export default deployedContracts satisfies GenericContractsDeclaration;
