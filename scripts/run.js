const main = async () => {
    // Compile contract to bytecode & generate necessary files in /artifacts
    const nftContractFactory = await hre.ethers.getContractFactory("MyEpicNFT");

    // Hardhat creates local ethereum network (just for this contract), then after the script completes, the network will be destroyed
    const nftContract = await nftContractFactory.deploy();

    // Wait for contract to be mined and deployed to network (contract's constructor will be run immediately after deployment)
    await nftContract.deployed();

    // Print out address of deployed contract
    console.log("Contract deployed to:", nftContract.address);

    // Call the contract's mint function
    let txn = await nftContract.makeAnEpicNFT();

    // Wait for it to be mined
    await txn.wait();

    // Mint another NFT for fun, wait for mining again
    txn = await nftContract.makeAnEpicNFT();
    await txn.wait();
}

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (err) {
        console.log(err);
        process.exit(1);
    }
}

runMain();

