const main = async()=>{

const SudokuVerifier  = await hre.ethers.getContractFactory("SudokuVerifier");
const sudokuVerifier = await SudokuVerifier.deploy();
await sudokuVerifier.deployed();
const sudokuVerifierAddress = sudokuVerifier.address;
console.log("SudokuVerifier Contract is deployed at :", sudokuVerifier.address );

const Sudoku  = await hre.ethers.getContractFactory("Sudoku");
const sudoku = await Sudoku.deploy(sudokuVerifierAddress);
await sudoku.deployed();
console.log("Sudoku Contract is deployed at :", sudoku.address );


let board = await sudoku.generateSudokuBoard(new Date().toString());
console.log("=========================BOARD=====================================");
console.log(board);
console.log("=========================BOARD=====================================");

let callData =[
    ["0x176553b82663dedd36d14d83402f0f873d0ec5471b4e25a1ffbd35d359a1368b", "0x2487e5a3daf5975d2d24d2763b3b514e3e11e6036fbfbdb24d2bc9002d64dbdc"],
    [["0x1b74e062a72e27c15cca52b25e0072a910646a7cbffe3920cb78079f60f7389c", "0x159746dc71e80efcf216cea8d7f39dbdab9e9b49cf6746dba202966d522ff1a8"],["0x21d09e435eb772d6b057adafafa0f44beab1a74a1a9c5a35a91d9f560587ac85", "0x0ea7e7b30caea71f6c02f7f8b722d1b73e706cde2c876511220453712aa17ec8"]],
    ["0x1536004278b04aa4af34070f4a2d465f204e0e6bd933a1d634bac4fb6c8b1d58", "0x00b369b9e9ddb94eaf79b35c459b57fb567f889f79401d9c451e3ddb50072585"],
    ["0x0000000000000000000000000000000000000000000000000000000000000001"]
];

["0x227489a5b44ad8276b4ec455c8ad2ea93c8ae50c32c099bad582213d21296258", "0x068143006cb8b0563f76c38d0801e242073f14a75fc67a299def68d87d22bea1"],[["0x0bdec271b058be2ba500f5a7cd2cd8a7d40d56598ddd5abf3eb52bf40a5b7d33", "0x0a967364feb36dea4e483353445d664ad498e5444adcc260626c28e9265e1775"],["0x1208af29c905770f2e3b8bb64c9aeeb5af20f1baf139b9e26812406dcc7ecf8d", "0x04c99b5a4bf24454a366f9ab4e3fd27c2e5ce5f6964f10a7c4d678861e4934bb"]],["0x17e18d7074b6b14f4d9709709533450e128bbadac31b9e57bb6b8b8c7959a3c5", "0x151e570052efb69831183fea62a8e977220701d45d2684cde4400a94fe9a1a96"],["0x0000000000000000000000000000000000000000000000000000000000000001"]

let result = await sudokuVerifier.verifyProof(
    callData[0],
    callData[1],
    callData[2],
    callData[3],
);
console.log("======================Result=================================");
console.log("Result : " , result );
console.log("======================Result=================================");

}



const runMain = async()=>{

    try{
    await main();
    process.exit(0);    
    }catch(error){
        console.log(error);
        process.exit(1);
    }

};

runMain();












