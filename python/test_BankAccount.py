import unittest
from unittest.mock import patch
from bankaccount import BankAccount

class TestBankAccount(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        print('setUpClass')

    @classmethod
    def tearDownClass(cls):
        pass

    def setUp(self):
        self.account = BankAccount(100)
    
    def tearDown(self):
        print('tearDown')

    def test_initial_balance(self):
        self.assertIsInstance(self.account, BankAccount)

        with self.assertRaises(ValueError):
            self.account = BankAccount(-100)

    def test_deposit(self):
        self.account.deposit(50)
        self.assertEqual(self.account._balance, 150)

        with self.assertRaises(ValueError):
            self.account.deposit(-50)
    
    def test_withdraw(self):
        self.account.withdraw(50)
        self.assertEqual(self.account._balance, 50)

        with self.assertRaises(ValueError):
            self.account.withdraw(-50)

    def test_get_interest(self):
        with patch('Bankaccount.requests.get') as mock_get:
            mock_get.return_value.status_code = 200
            mock_get.return_value.json.return_value = {
                'observations': [{'FXUSDCAD': 1.2}]
            }
            interest_rate = self.account.get_interest()
            self.assertEqual(interest_rate, 1.2)

if __name__ == '__main__':
    unittest.main()