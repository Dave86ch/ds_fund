//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/ds_fund.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract Interaction is Test {
  fundMe fundMe;

  address USER = makeAddr("user");
  uint256 constant SEND_VALUE = 5 ether;
  uint256 constant STARTING_BAlANCE = 10 ether;
  uint256 constant GAS_PRICE = 1;

  function setUp() external {
    DeployFundMe deploy = new DeployFundMe();
    fundMe = deploy.run();
    vm.deal(USER, STARTING_BALANCE);
  }

  function testUserCanFundInteractions() public {
    FundFundMe fundFundMe = new FundFundMe();
    fundFundMe.fundFundMe(address(fundMe));

    WithdrawFundMe withdrawFundMe = new withdrawFundMe();
    withdrawFundMe.withdrawFundMe(address(fundMe));

    assert(address(fundMe).balance == 0);
  }
}
