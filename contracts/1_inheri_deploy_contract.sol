// derivedContract라는 컨트랙트를 
// baseContract에서 deploy함
// 키워드는 36,47 라인의 new 키워드를 사용함.
// 다만 owner role을 사용하는 컨트랙트일 경우
// msg.sender가 호출하는 baseContract가 되기때문에 유의하여 배포하여야 함

pragma solidity ^0.5.6;


contract derivedContract {
    
    address public deriveAddress;
    address public inputAddress;

    constructor(address _inputAddress, address _setAddress) public {
        inputAddress = _inputAddress;
        deriveAddress = _setAddress;
    }
    
    function getAddress() public view returns(address,address){
        return(deriveAddress, inputAddress);
    }

    function thisAddress() public view returns(address){
        return(address(this));
    }
}



contract baseContract {
 
 address public derivedAddress;

constructor(address _inputAddress) public {
  derivedContract _derivedContract = new derivedContract(_inputAddress, address(this));
  derivedAddress = address(_derivedContract);
 }

 function viewState() public view returns(address,address){
    derivedContract loadContract = derivedContract(derivedAddress);
     return(loadContract.getAddress());

 }

 function deployContract(address _inputAddress) public {
    derivedContract _derivedContract = new derivedContract(_inputAddress, address(this));
    derivedAddress = address(_derivedContract);
 }

}