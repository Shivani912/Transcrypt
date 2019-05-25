# Transcrypt

Transcrypt is a blockchain application that lets an educational institution to deliver student transcripts on blockchain, not just to make it easily accessible by students, but also to keep it safe secure as everything on a blockchain is immutable.

For the initial stage, I have built a smart contract that let's the owner of the contract (in this case, an instituition) add transcrypt hashes to the blockchain. The verifiers can verify the legitimacy of a transcrypt by checking it using the smart contract and students can view their own transcripts and number of times their transcript has been viewed.


# Walking through the code

Functions: 

  1. addTranscriptHash
  2. isTranscriptAuthentic
  3. checkOwner
  4. viewTranscript
  5. checkViews
  6. count
  
-------------------

## 1. addTranscriptHash: 

  Lets the owner of the contract

  Parameters: 
    
    1. address: to whom the transcript belongs to
    2. bytes32: hash of the transcript
    
  Constraints:
  
    1. onlyOwner: Only the owner of the contract can add a transcript hash.
    
  Event:
  
    1. transcriptAdded: Emits this event to log the transcript hash and block number.
    
    
 ## 2. isTranscriptAuthentic:
 
    Parameters:
    
      1. address: to whom the transcript belongs to
      2. bytes32: hash of the transcript
    
    Event:
    
      1. transcriptViewed: Emits this event to log viewer's address and block number
    
    Function call:
    
      1. count()
      
    Returns:
    
      1. bool: If true, the transcript is authentic. If false, it is not.
  
  ## 3. checkOwner: 
  
    No parameters.
    
    Returns:
    
      1. address: address of the contract owner
      
  ## 4. viewTranscript:
    
    No parameters.
    
    Returns: 
    
      1. bytes32: Hash of the transcript of the address who called the function
  
  ## 5. checkViews:
  
    No parameters.
    
    Returns: 
    
      1. int256: Number of times the user's transcript has been viewed
  
  ## 6. count:
  
    Parameters:
    
      1. address: Address of the transcrypt owner
      
    Constraints:
    
      1. private: only the contract's function can call it
  
