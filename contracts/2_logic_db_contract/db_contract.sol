pragma solidity ^0.5.6;

contract database {
    
    struct data{
        address _addr;
        uint _uint;
        string _string;
    }

    uint dataNumber;

    mapping(uint => data) public db;

    function setData(address _addr, uint _uint, string memory _string) public returns(bool){
        db[dataNumber]._addr = _addr;
        db[dataNumber]._uint = _uint;
        db[dataNumber]._string = _string;
        
        dataNumber ++;
        
        return true;
    }

    function getData(uint _dataNumb) public view returns(address, uint, string memory){
        return (db[_dataNumb]._addr,db[_dataNumb]._uint,db[_dataNumb]._string);
    }

    function getDataNumber() public view returns(uint){
        return dataNumber;
    }
}