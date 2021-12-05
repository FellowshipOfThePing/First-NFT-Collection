// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

// Import (or "inherit") some OpenZeppelin Contracts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// Inheriting contracts means having access to their methods, which is denoted using the "is" keyword
contract MyEpicNFT is ERC721URIStorage {
    // Create instance of Counter object (from OpenZeppelin) to help us keep track of tokenIds
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // We need to pass the name of our NFTs token and it's symbol
    constructor() ERC721 ("SquareNFT", "SQUARE") {
        console.log("This is my NFT contract. Whoa!");
    }

    // Function for getting an NFT
    function makeAnEpicNFT() public {
        // Get the current tokenId, starting at 0
        uint256 newItemId = _tokenIds.current();

        // Actually mint the NFT to the sender.
        // msg.sender is a variable provided by Solidity, that gives access to public address of wallet that called contract.
        _safeMint(msg.sender, newItemId);

        // Set the NFT's unique ID + data.
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/J1QT");
        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

        // Note - The "tokenURI" is where the actual NFT data lives. It usually links to a JSON file called the "metadata" 
        // This metadata typically has a name, description, and link to content. This is part of the ERC721 standard.

        // Increment the counter for when the next NFT is minted
        _tokenIds.increment();
    }
}

