//contracs/GameItem.sol
//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";  

contract NFT is ERC721 {
    address public self;
    address public owner;
    address public receiver;
    uint public price;
    uint public numberOfTokens;
    uint public transferredNfts;

    mapping(uint => string) public metadata;

    constructor (address _owner, uint _price, uint _numberOfTokens, string memory uri, address nftFactory) ERC721("NFT", "Symbol"){
        owner = _owner;
        price = _price;
        numberOfTokens = _numberOfTokens;
        self = address(this);
        transferredNfts = 0;
        
        for(uint i=0; i<_numberOfTokens; i++){
             _safeMint(_owner, i);
             metadata[i] = uri;
             _approve(nftFactory, i);
        }
    }

    function transfer(address from, address to, uint _numberOfTokens) public {
        for(uint i=0; i<_numberOfTokens; i++){
            transferFrom(from, to, transferredNfts);
            transferredNfts++;
        }
    }

    function getmetadata(uint tokenId) public view returns(string memory){
        return metadata[tokenId];
    }

    function getOwner() public view returns(address payable) {
        return payable(owner);
    }

}

contract NFTFactory{

    NFT[] public array;
    mapping(address => NFT) public nfts;
    mapping(address => uint) public Balance; 

    function create(address _owner, uint _price, uint _numberOfTokens, string memory uri) public {
        NFT nft = new NFT(_owner, _price, _numberOfTokens, uri, address(this));
        
        array.push(nft); //array will help frontend
        nfts[nft.self()] = nft; //mapping instances //take a look HERE
    }

    function buy(address nftAddress, uint _numberOfTokens) payable public {
        //transfer funds
        require(nfts[nftAddress].price() * _numberOfTokens == msg.value, "Enter proper amount");
        //payable(nfts[nftAddress].owner()).transfer(nfts[nftAddress].price());

        address payable sender = nfts[nftAddress].getOwner();
        (bool sent,) = sender.call{value: msg.value}("");
         require(sent, "Failed to send Ether");

        //transfer nfts
        Balance[msg.sender] = Balance[msg.sender] + _numberOfTokens;
        Balance[nftAddress] = Balance[nftAddress] - _numberOfTokens;

        nfts[nftAddress].transfer(nfts[nftAddress].owner(), msg.sender, _numberOfTokens);
    }

}