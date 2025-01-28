```solidity
function withdraw() public {
  uint amount = balances[msg.sender];
  require(amount > 0, "Insufficient balance");
  balances[msg.sender] = 0; //Bug: This line overwrites the balance before the transfer!
  (bool success, ) = msg.sender.call{value: amount}(new bytes(0));
  require(success, "Transfer failed");
}
```