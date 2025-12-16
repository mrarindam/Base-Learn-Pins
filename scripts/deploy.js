const hre = require("hardhat");

async function main() {
  // 1️⃣ Deploy AddressBookFactory
  const Factory = await hre.ethers.getContractFactory("AddressBookFactory");
  const factory = await Factory.deploy();
  await factory.waitForDeployment();

  const factoryAddress = await factory.getAddress();
  console.log("✅ AddressBookFactory deployed to:", factoryAddress);

  // 2️⃣ Use factory to deploy AddressBook
  const tx = await factory.deploy();
  const receipt = await tx.wait();

  const addressBookAddress = await factory.callStatic.deploy();

  console.log("✅ AddressBook deployed to:", addressBookAddress);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
