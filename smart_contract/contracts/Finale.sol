//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721 {
    address public self;
    address public owner;
    uint public price;
    uint public numberOfTokens;
    uint public transferredTokens;
    address public factory;

    constructor(address _owner, uint _numberOfTokens, address _factory) ERC721("GameItem", "ITM") {
        owner = _owner;
        //price = _price;
        numberOfTokens = _numberOfTokens;
        factory = _factory;
        transferredTokens = 0;

        for (uint i = 0; i<_numberOfTokens; i++) {
            _safeMint(_owner, i);
            //metadata
            _approve(_factory, i);
        }
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    //getmetadata

    function transfer(address from, address to, uint _numberOfTokens) public { 
        for(uint i =0; i<_numberOfTokens; i++){
            transferFrom(from, to, transferredTokens);
            transferredTokens++;
        }
    }
}

contract Factory {
    NFT[] public nfts;
    mapping(address => NFT) addressToNft;

    function create(uint _numberOfTokens) public {
        NFT nft = new NFT(msg.sender, _numberOfTokens, address(this));
        nfts.push(nft);
        addressToNft[address(nft)] = nft;
    }

    function buy(address _nftAddres, uint _price, uint _numberOfTokens) public payable {
        
        require(_price * _numberOfTokens == msg.value, "Enter proper amount");
        (bool sent,) = payable(addressToNft[_nftAddres].getOwner()).call{value: msg.value}("");
        require(sent, "Failed to send Ether");

        addressToNft[_nftAddres].transfer(addressToNft[_nftAddres].owner(), msg.sender, _numberOfTokens);
    }
}
