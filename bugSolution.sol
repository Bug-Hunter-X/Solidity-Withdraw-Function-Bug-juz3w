```solidity
function withdraw() public {
  uint amount = balances[msg.sender];
  require(amount > 0, "Insufficient balance");
  (bool success, ) = msg.sender.call{value: amount}(new bytes(0));
  require(success, "Transfer failed");
  balances[msg.sender] = 0; // Update balance after successful transfer
}
```