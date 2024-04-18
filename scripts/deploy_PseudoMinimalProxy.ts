const { ethers, upgrades } = require("hardhat");

async function main() {
    const PseudoMinimalProxy = await ethers.getContractFactory("PseudoMinimalProxy");
    console.log("Deploying Box...");
    const box = await upgrades.deployProxy(PseudoMinimalProxy, [42], {initializer: 'initialize'});
    await box.waitForDeployment();
    console.log("Box deployed to:", await box.getAddress());
}

main();