import random
from datetime import datetime

def generate_account_number():
    """ this is to generate a random number for account"""    
    return random.randint(1000,9999)

class BankAccount:
    """ This is super class for a bank account"""
    clients = []
 
    def __init__(self, balance=0):
        self.account_number = generate_account_number()
        self.account_balance = balance
        self.transactions = []
        self.transactions.append(Transaction(balance, "Initial Balance"))

    def deposit(self,amount):
        if amount > 0:
            self.account_balance += amount
            self.transactions.append(Transaction(amount, "Deposit"))
            print(f"Amount deosited ${amount}")
            print(f"New Balance after deposit ${self.account_balance}")
        else:
            print("Please enter a positive deposit amount.")

    def withdraw(self,amount):
        if amount >0:
            if (self.account_balance - amount) >= 0:
                self.account_balance -= amount
                self.transactions.append(Transaction(amount, "Withdraw"))
                print(f"Amount withdrew ${amount}")
                print(f"New Balance after withdraw ${self.account_balance}")
            else:
                print("Insufficient funds.") 
        else:
            print("Please enter a non-zero positive amount.")

    def display_account_details(self):
        print(f"Current Account Balance: ${self.account_balance}")

    def display_txn_details(self):
        print("Transaction History")
        for txn in self.transactions:
            print()
            print(f"Transaction Date: {txn.date}")
            print(f"Transaction Type: {txn.txn_type}")
            print(f"Transaction Amount: ${txn.txn_amount}")
    
    def add_client(self, client):
        self.clients.append(client)
        print(f"Client {client.name} {client.user_id} added to account {self.account_number}")

    def authentication(self, name, user_id):
        for i in range(len(self.clients)):
            if name in self.clients[i].account.values() and user_id in self.clients[i].account.values():
                print()
                print("Authentication successful!")
                return self.clients[i]
                 
class SavingAccount(BankAccount):
    """ This is a child class for Savings Account"""
    def __init__(self, client_name, minimum_balance):
        super.__init__(client_name)
        self.minimum_balance = minimum_balance

    def withdraw(self,amount):
        if (self.account_balance - amount) >= self.minimum_balance:
            super.withdraw(amount)

class Transaction():
    def __init__(self, txn_amount, txn_type):
        self.date = datetime.now()
        self.txn_amount = txn_amount
        self.txn_type = txn_type

              