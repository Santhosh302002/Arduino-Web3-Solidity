// const { getContractAddress } = require("ethers/lib/utils")
const { network, run } = require("hardhat")
require("dotenv").config()

module.exports = async ({ deployments, getNamedAccounts }) => {
    const { deployer } = await getNamedAccounts()
    const { deploy, log } = deployments
    const chainId = network.config.chainId
    // console.log(chainId);

    interval = 600;
    const Arduino = await deploy("Arduino", {
        from: deployer,
        log: true,
        args: []
    }
    )
    if (chainId === 5 && process.env.GOERLI_PRICEFEED_URL) {
        await verify(BankingTransaction.address, [])
    }
    if (chainId === 11155111 && process.env.SEPOLIR_PRICEFEED_URL) {
        await verify(BankingTransaction.address, [])
    }
}

const verify = async (contractAddress, args) => {
    console.log("Verifying contract...")
    try {
        await run("verify:verify", {
            address: contractAddress,
            constructorArguments: args,
        })
    } catch (e) {
        if (e.message.toLowerCase().includes("already verified")) {
            console.log("Already verified!")
        } else {
            console.log(e)
        }
    }
}

module.exports.tags = ['all', 'Arduino'];