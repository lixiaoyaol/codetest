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
        if amount < 0:
            raise ValueError('Withdraw amount must be non-negative')
        if amount > self._balance:
            raise ValueError('Withdraw amount must not exceed balance')
        self._balance -= amount

    def get_interest(self):
        url = 'https://www.bankofcanada.ca/valet/observations/FXUSDCAD/json'
        response = requests.get(url)
        if response.status_code == 200:
            return response.json()['observations'][-1]['FXUSDCAD']
        else:
            raise Exception('Failed to retrieve exchange rate')