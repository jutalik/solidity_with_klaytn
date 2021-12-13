pragma solidity ^0.5.6;

contract db_doubleStruct {
    
    // db의 역할을 하는 컨트랙트를 만들어 보자.
    // - 여러 컨트랙트들의 정보를 저장하고 반환하되
    // nft같은 중복된 키값이 들어올 경우 오작동 될 여지가 있음.
    // 그래서 2중 struct 구조를 사용함.
    // 1차. 컨트랙트주소(address) 
    // 2차. 컨트랙트주소의 nft tokenId
    
    // mapping의 views를 왜 private으로 선언함? 이라고 묻는다면
    // public으로 선언할 경우 getter 자동으로 생성 되지만
    // 보다시피 power라는 값은 구조체 이므로 getter가 생성될 수 없음.
    // 만약 보여주어야 하는경우에는 get()에서 처럼 따로 getter를 만들어주자.

    struct power{
        mapping(uint => uint) myPower;
    }

    mapping(address => power) private views;
    
    function set(address _address, uint _numb, uint _power) public {
        views[_address].myPower[_numb] = _power;
    }

    function get(address _address, uint _numb) public view returns(uint){
        return views[_address].myPower[_numb];
    }
} 