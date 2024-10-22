import pytest
from Bank_Account import BankAcount

@pytest.fixture #Run This Function Every Test
def bank_account():
    """Create New BankAccount Object"""
    return BankAcount(id=123)

def test_init_balance(bank_account):
    """Check init Set Balance To 0"""
    assert bank_account.balance == 0, "Balance is Not 0"

def test_deposit(bank_account):
    """Deposit 100 and Check if 100 Deposited"""
    bank_account.deposit(100)
    assert bank_account.balance == 100, "Money Not Deposited"

def test_deposit_string(bank_account):
    """Checks Bad Input"""
    result = bank_account.deposit("string")
    assert bank_account.balance == 0, "Balance should remain 0"
    assert result is False, "String deposit should fail"

def test_deposit_negative_value(bank_account):
    """Checks if User Can Deposit Negative Values"""
    result = bank_account.deposit(-50)
    assert bank_account.balance == 0, "Balance should remain 0"
    assert result is False, "Negative deposit should fail"

def test_withdraw_successful(bank_account):
    """Make Deposit of 100 and Try To Withdraw 50"""
    bank_account.deposit(100)
    result = bank_account.withdraw(50)
    assert result is True, "Withdraw should succeed"
    assert bank_account.balance == 50, "Balance Not Accurate After Withdraw"

def test_withdraw_unsuccessful(bank_account):
    """Make Withdraw Of 50 When Balance is 0"""
    result = bank_account.withdraw(50)
    assert result is False, "Withdraw should fail with 0 balance"
    assert bank_account.balance == 0, "Balance should remain 0"
