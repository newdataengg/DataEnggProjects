class Client:

    # {name: "xxxxxx",user_id: "xxxxx"}

    def __init__(self, name, user_id): 
        self.name = name
        self.user_id = user_id
        self.accounts = []
          
    def add_account(self, account):
        self.accounts.append(account)
        print(f"Account {account.account_number} added to user {self.name}")

    def find_account(self, account_number):
        for account in self.accounts:
            if account.account_number == account_number:
                return account
        return None
        
