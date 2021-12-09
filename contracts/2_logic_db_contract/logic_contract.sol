pragma solidity ^0.5.6;

contract db_Interface{
    function setData(address _addr, uint _uint, string memory _string) public returns(bool);
    function getData(uint _dataNumb) public view returns(address, uint, string memory);
    function getDataNumber() external view returns(uint);
}

contract logic_contract {
    
    db_Interface public db;

    function set_db_contract(address _db_addr) public returns(bool){
        db = db_Interface(_db_addr);
        return true;
    }
    
    function get_db(uint _dataNumb) public view returns(address, uint, string memory){
        return(db.getData(_dataNumb));
    }

    function set_db(address _addr, uint _uint, string memory _string) public returns(bool){
        db.setData(_addr, _uint, _string);
        return true;
    }
    
}