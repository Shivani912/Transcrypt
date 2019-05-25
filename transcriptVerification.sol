pragma solidity 0.5.8;

contract transcriptVerification {
    mapping(address => bytes32) transcript;
    address owner;
    mapping(address => int256) countViews;
    
    
    constructor() public{
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner, "you are not the owner");
        _;
    }
    
    event transcriptAdded(bytes32 transcriptHash, uint256 blockNumber);
    event transcriptViewed(address viewer, uint256 blockNumber);
    
    function checkOwner() public view returns(address) {
        return owner;
    }
    
    function addtranscriptHash(address _transcriptOwner,bytes32 _transcriptHash) public onlyOwner {
        transcript[_transcriptOwner] = _transcriptHash;
        emit transcriptAdded(_transcriptHash, block.number);
    }
    
    function isTranscriptAuthentic(address _transcriptOwner, bytes32 _transcriptHash) public returns(bool) {
        if(transcript[_transcriptOwner] == _transcriptHash) {
            count(_transcriptOwner);
            emit transcriptViewed(msg.sender, block.number);
            return true;
        }
        else {
            return false;
        }
    }
    
    function viewTranscript() public view returns(bytes32) {
        return transcript[msg.sender];
    }
    
    function count(address _transcriptOwner) private {
        countViews[_transcriptOwner]++;
    }
    
    function checkViews() public view returns(int256) {
        return countViews[msg.sender];
    }
}