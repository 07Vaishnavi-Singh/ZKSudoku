// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

interface IVerifier{

function verifyProof(
    uint256[2] memory a,
    uint256[2][2] memory b,
    uint256[2] memory c,
    uint256[16] memory input 
) external view returns(bool);
}


contract Sudoku {


address public verifierAddr ;

uint8[4][4][3] sudokuBoardList = [

[
[0, 4, 0, 0],
[0, 0, 1, 0],
[0, 0, 0, 3],
[2, 0, 0, 0]

],
[
[0, 4, 0, 0],
[0, 0, 1, 0],
[0, 0, 0, 3],
[2, 0, 0, 0]

],
[
[0, 4, 0, 0],
[0, 0, 1, 0],
[0, 0, 0, 3],
[2, 0, 0, 0]

]
] ;


constructor(address _verifierAddr){
    verifierAddr = _verifierAddr ;
}

function verifyProof(
    uint256[2] memory a,
    uint256[2][2] memory b,
    uint256[2] memory c,
    uint256[16] memory input 
) public view returns(bool){
    return IVerifier(verifierAddr).verifyProof(a,b,c,input);
}



function verifySudokuBoard(uint256[16] memory board) 
private 
view
returns(bool){

    bool isEqual = true ;
    for(uint256 i = 0; i< sudokuBoardList.length; i++){
        isEqual = true;
        for(uint256 j= 0 ;j <sudokuBoardList[i].length;++j){
            for(uint k= 0;k<sudokuBoardList[
                i
            ][j].length;k++){
                if(board[4*j+k] != sudokuBoardList[i][j][k]){
                    isEqual = false;
                    break;
                }
            }
        }
        return isEqual;
    }

}
function verifySudoku(
   uint256[2] memory a,
    uint256[2][2] memory b,
    uint256[2] memory c,
    uint256[16] memory input 
) public view returns(bool){

require(verifySudokuBoard(input), "This board doesnot exist");
require(verifyProof(a,b,c,input), "Filed Proof Check");
return true;

}

function pickRandomBoard(string memory stringTime)
private 
view 
returns(uint8[4][4] memory){

uint256 randPosition = uint256(
    keccak256(
        abi.encodePacked(
            block.difficulty,
            block.timestamp,
            msg.sender,
            stringTime
        )
    )
)% sudokuBoardList.length;
return sudokuBoardList[randPosition];

}


function generateSudokuBoard(string memory stringTime) 
public 
view
returns(uint8[4][4] memory){
    return pickRandomBoard(stringTime);
}

}

