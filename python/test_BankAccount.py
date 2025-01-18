import unittest
from bankaccount import BankAccount

class TestBankAccount(unittest.TestCase):
    def test_initial_balance(self):
        account = BankAccount(100)
        self.assertIsInstance(account, BankAccount)

        with self.assertRaises(ValueError):
            account = BankAccount(-100)

    def test_deposit(self):
        account = BankAccount(100)
        account.deposit(50)
        self.assertEqual(account._balance, 150)

        with self.assertRaises(ValueError):
            account.deposit(-50)

if __name__ == '__main__':
    unittest.main()