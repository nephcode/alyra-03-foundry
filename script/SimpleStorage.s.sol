// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "../src/SimpleStorage.sol";

contract MyScript is Script {
    function run() external {
        // Récupération de la clé privée depuis la variable d'environnement
        string memory deployerPrivateKey = vm.envString("WPK");
        
        // Ajout de "0x" si ce n'est pas présent
        if (bytes(deployerPrivateKey).length > 0 && bytes(deployerPrivateKey)[0] != "0x") {
            deployerPrivateKey = string(abi.encodePacked("0x", deployerPrivateKey));
        }
        
        uint256 privateKeyUint = vm.parseUint(deployerPrivateKey);

        // Démarrage de la diffusion (broadcast) avec la clé privée
        vm.startBroadcast(privateKeyUint);

        // Déploiement du contrat SimpleStorage avec un argument de constructeur
        SimpleStorage simpleStorageInstance = new SimpleStorage(3);
        console.log("SimpleStorage deployed at:", address(simpleStorageInstance));

        // Arrêt de la diffusion
        vm.stopBroadcast();
    }
}