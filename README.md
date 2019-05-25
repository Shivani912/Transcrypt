# Transcrypt

Transcrypt is a blockchain application that lets an educational institution to deliver student transcripts on blockchain, not just to make it easily accessible by students, but also to keep it safe and secure as everything on a blockchain is immutable.

For the initial stage, I have built a smart contract that let's the owner of the contract (in this case, an instituition) add transcript hashes to the blockchain. The verifiers can verify the legitimacy of a transcript by checking it using the smart contract and students can view their own transcripts and number of times their transcript has been viewed.


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

  Lets the owner of the contract add transcript hashes that are mapped to the transcript owner i.e. student's address.

  Parameters: 
    
    1. address: to whom the transcript belongs to
    2. bytes32: hash of the transcript
    
  Constraints:
  
    1. onlyOwner: Only the owner of the contract can add a transcript hash.
    
  Event:
  
    1. transcriptAdded: Emits this event to log the transcript hash and block number.
    

 ## 2. isTranscriptAuthentic:

  This function is targeted to the verifiers. They can pass in the student's address and transcript hash to check if it matches to the address=>hash mapping stored on the contract. If the hash has been altered with, the function returns a false. If the values match, it returns true.
 
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

  Lets anyone check the owner of the contract. Can be useful for verifiers particularly, to be sure that the source of the transcript hash is from the same instituition mentioned on the transcript.
  
  No parameters.
    
  Returns:
    
    1. address: address of the contract owner
      
  ## 4. viewTranscript:
    
  This function is targetted to students, who can view their own transcripts.
  Note: The student must access this function from their own address.

  No parameters.
    
  Returns: 
    
    1. bytes32: Hash of the transcript of the address who called the function
  
  ## 5. checkViews:

  Again, targetted to students. They can check the number of times their transcript hash has been verified.
  
  No parameters.
    
  Returns: 
    
    1. int256: Number of times the user's transcript has been viewed
  
  ## 6. count:

  Private function, called when someone verifies a transcript. It increments the view count of student's transcript. The counter variable is mapped to the students' addresses. Thus maintains a counter for each address.
  
  Parameters:
    
    1. address: Address of the transcrypt owner
      
  Constraints:
    
    1. private: only the contract's function can call it
    
# Looking for a demo ?
  Go to Ropsten testnet.
  Contract address: 0x9A6Ae94dBd72b41AA40DC5526d3a915aeae6E48e
  
