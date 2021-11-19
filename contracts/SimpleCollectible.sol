//SPDX-License-Identifier: MIT
pragma solidity 0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SimpleCollectible is ERC721 {//s tem ko reces da je ERC271 inheritas vse funkcije tega razreda
    uint256 public tokenCounter;
    constructor () public ERC721 ("Dogie", "DOG"){//name, symbol
        tokenCounter = 0;
    }

    function createCollectible(string memory tokenURI) public returns (uint256) {//tu kao nardis puppy fabriko. generic contract
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }

}