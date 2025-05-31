// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ByCoffeContract {
    address payable public recipist;
    address payable public webmaster;
    address public owner;

    



    function setWebmaster(address _webmaster) public  {

        require(_webmaster != address(0), "Invalid webmaster address");
        webmaster = payable(_webmaster);
    }

    function tipRecipist(address _recipist) public payable {
        require(_recipist != address(0), "Invalid recipist address");
        require(webmaster != address(0), "webmaster address not set");
        require(msg.value > 0, "You can't tip with 0 amount");

        recipist = payable(_recipist);

        uint256 tax = (msg.value * 30) / 100;
        uint256 tipAmount = msg.value - tax;

        (bool sentTorecipist, ) = recipist.call{value: tipAmount}("");
        require(sentTorecipist, "Failed to send tip to recipist");

        (bool sentToWebmaster, ) = webmaster.call{value: tax}("");
        require(sentToWebmaster, "Failed to send tax to webmaster");
        
    }
   
}