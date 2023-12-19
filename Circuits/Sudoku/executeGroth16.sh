#!/bin/bash
# This is a simple Bash script
# Variable declaration
GREETING="===========================SHELL SCRIPT RUNNING================================="
# Print the greeting to the console
# CIRCUIT = Sudoku
# PTAU = 12
# if ["$1"]; then
# CIRCUIT= $1
# fi
# if ["$2"]; then
# PTAU= $2
# fi
# check if the necessary PTAU file exists 
if [ ./ptau/powersOfTau28_hex_final_${PTAU}.ptau]; then 
echo "====================The powers of tau fuile already exists====================="
else
echo "=======Downloading the PTAI Files=========================="
curl -O https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_12.ptau 
fi
# Compile the circuit 
echo "=================Compiling the circom Circuit===================="
circom Sudoku.circom --r1cs --wasm --sym --c
# Generate witness 
echo "======================Generating witness=========================="
node ./Sudoku_js/generate_witness.js  ./Sudoku_js/Sudoku.wasm  ./input.json ./Sudoku_js/witness.wtns 
# generate the keys 
echo "======Generating the keys======================"
snarkjs groth16 setup ./Sudoku.r1cs powersOfTau28_hez_final_12.ptau Sudoku_0000.zkey
echo "Contribute to the phase 2 of the ceremony"
snarkjs zkey contribute Sudoku_0000.zkey Sudoku_final.zkey --name="First Contribution" -v -e="Some Random Text"
echo "Export the verififcation key"
snarkjs zkey export verificationKey Sudoku_final.zkey verification_key.json
echo "===================Generate zk proof====================="
snarkjs groth16 prove Sudoku_final.zkey ./Sudoku_js/witness.wtns proof.json public.json
#generat esoliidty verifier
echo "Generating solidity Verifier that allows prrof to be verified on Ethereum blockchain"
snarkjs zkey export solidityverifier Sudoku_final.zkey SudokuVerifier.sol
# update the soliidty version in the solidity verifier
sed -i 's/0.6.11;/0.8.4;/g' SudokuVerifier.sol  
#update solidity version in solidity verifier 
sed -i 's/contract Verifier/contract sudokuVerifier/g' SudokuVerifier.sol 
# generate and print parameters of call
echo "==================Generate and print parameters of call========================"
snarkjs generatecall  | tee parameters.txt







