//Yoroi: secret bamboo height camera scan course remove mutual net ostrich cinnamon report field rubber master

const SHA256 = require('crypto-js/sha256');

class Block{
	constructor(index, timestamp, data, previousHash = ''){
		this.index = index;
		this.timestamp = timestamp;
		this.data = data;
		this.previousHash = previousHash;
		this.hash = '';
	}
	calculateHash(){
		return SHA256(this.index + this.timestamp + this.previousHash + JSON.stringify(this.data)).toString();
	} 
}

class Blockchain{
	constructor(){
		this.chain = [this.createGenesisBlock()]
	}
	createGenesisBlock(){
		return new Block(0, "01/01/2021", "Genesis Block", 0)
	}
	getLatesBlock(){
		return this.chain[this.chain.length - 1]
	}
	addBlock(newBlock){
		newBlock.previousHash = this.getLatesBlock().hash;
	}
	addBlock(newBlock){
		newBlock.previus = this.getLatesBlock().hash;
	}
}