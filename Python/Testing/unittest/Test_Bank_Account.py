import unittest
from Bank_Account import BankAcount #Import Checked Class

class TestBankAccount(unittest.TestCase): #unittest.TestCase - Library Allow To Use assertEqual, assertTrue and More

    def setUp(self):
        """Create New Account For EACH RUN"""
        self.account = BankAcount(id=123)

    def test_init_balance(self):
        """Check init Set Balance To - 0"""
        self.assertEqual(self.account.balance, 0, "Balance is Not 0")

    def test_deposit(self):
        """Deposit 100 and Check if 100 Deposited"""
        self.account.deposit(100)
        self.assertEqual(self.account.balance, 100, "Money Not Deopsited")

    # def test_deposit_string(self):
    #     """Checks Bad Input"""
    #     self.account.deposit("string")

    def test_deposit_negative_value(self):
        """Checks if User Can Deposit Negative Values"""
        result = self.account.deposit(-50)
        self.assertEqual(self.account.balance, 0)
        self.assertFalse(result)

    def test_withdraw_successful(self):
        """Make Deposit of 100 and Try To Withdraw 50"""
        self.account.deposit(100)
        result = self.account.withdraw(50)
        self.assertTrue(result) #Check if Withdraw Succeed
        self.assertEqual(self.account.balance, 50,"Balance Not Accurate After Withdraw")#Check Balance after Deposit is 50

    def test_withdraw_unsuccessful(self):
        """Make Withdraw Of 50 When Balance is 0"""
        result = self.account.withdraw(50)
        self.assertFalse(result) #Check You Get FALSE When You Want To Withdraw in 0 Balance
        self.assertEqual(self.account.balance, 0)#Checks Balance Stay 0 and not -50

if __name__ == '__main__':
    unittest.main() #Runs "Test Discovery" That Runs All Functions Starts With "test_"