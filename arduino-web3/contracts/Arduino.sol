// SPDX-License-Identifier: MIT LICENSE
pragma solidity ^0.8.7;

import "./NewCustomer.sol";

/**@title Arduino Integrated with web3
 * @author Santhosh Kumar L
 * @notice This contract is for creating a sub contract contract 
 * for each customers to store data in blockchain
 */

contract Arduino{
    
    /* State variable*/
    address private immutable i_Owner;

    struct Users{
        NewCustomer ContractAddress;
        address userAddress;
    }

    Users[] public userList;
    mapping(address=>address) public MappingUser;

    constructor() {
        i_Owner=msg.sender;
    }

    function newCustomer(address newUsers) public OnlyOwner{
        new NewCustomer(newUsers);
        userList.push(Users(new NewCustomer(newUsers),newUsers));
        MappingUser[newUsers]= address(new NewCustomer(newUsers))
    }

    modifier OnlyOwner(){
     require(i_Owner==msg.sender);
     _; 
    }
}
