// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract nft is ERC721,Ownable{
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    constructor() ERC721("Joy NFT", "JNT") {

    }

    function _baseURI() internal pure override returns (string memory){
        return "https://ipfs.io/ipfs/QmUZVYyfJGd6nQw1i7HveVeLcaUZF1dEkza4GtDqdrsfi5?filename=Joy-nft.json/";
    }

    function SafeMint(address to, uint256 tokenId) public onlyOwner{
        uint256 tokenId = _tokenIdCounter.current();
       _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    
    }
}