// SPDX-License-Identifier: MIT LICENSE
pragma solidity ^0.8.7;

import "./Arduino.sol";

contract NewCustomer{

    /* State Vaiable*/
    address public immutable i_userOwner;
    enum Sensing{
        Low,
        Noraml,
        High
    }

    Sensing public HeartBeat;

    struct SensorData{
        uint256 sensorValue;
    }

    SensorData[] public Data;

    constructor (address UserAddress) {
        i_userOwner=UserAddress;
    }

    function StoreData(uint256 value)  OnlyOwner public{
        Data.push(SensorData(value));
        if(value<55){
           HeartBeat=Sensing.Low;
        }
        else if(55<value && value<100){
            HeartBeat= Sensing.Noraml;
        }
        else {
            HeartBeat= Sensing.High;
        }
    }
    function ViewHeartBeat() OnlyOwner public view returns(Sensing){
        return HeartBeat;
    }
    modifier OnlyOwner(){
     require(i_userOwner==msg.sender);
     _; 
    }

}