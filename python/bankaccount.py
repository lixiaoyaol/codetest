import requests

class BankAccount:
    def __init__(self, initial_balance):
        if initial_balance < 0:
            raise ValueError('Initial balance must be non-negative')
        self._balance = initial_balance

    def deposit(self, amount):
        if amount < 0:
            raise ValueError('Deposit amount must be non-negative')
        self._balance += amount

    def withdraw(self, amount):
        pass

    def get_interest(self):
        pass