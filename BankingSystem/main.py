from client import Client
from bank import Bank
from bankaccount import BankAccount, SavingAccount, Transaction

def activity_menu(account1,account_open=True):
    """This function runs the activity menu
    where account is in use"""
    while account_open:
        print()
        print("""Choose an option:
                
    1. Withdraw
    2. Deposit
    3. Balance
    4. Transaction Details
    5. Exit Activity Option
                    """)
        activity_choice = int(input("1, 2, 3 or 4: "))
        if activity_choice == 1:
            print()
            account1.withdraw(int(input("Withdraw amount: ")))
        elif activity_choice == 2:
            print()
            account1.deposit(int(input("Deposit amount: ")))
        elif activity_choice == 3:
            print()
            account1.display_account_details()
        elif activity_choice == 4:
            print()
            account1.display_txn_details()
        else: 
            print()
            print("Thank you for visiting!")
            account1 = ''
            account_open = False

def account_menu(user1,client_open=True):
    """This function runs the account menu
    where client is in use"""
    while client_open:
            print()
            print("""Choose an option:
                
    1. Open a New Account
    2. Access Existing Account
    3. Exit Account Option
                    """)
            acc_choice = int(input("1, 2, or 3: "))
            if acc_choice == 1:
                account1 = BankAccount(int(input("Initial Balance: ")))
                user1.add_account(account1)
                print()
                print("Welcome {}!".format(account1.account_number))
                account_open = True
                activity_menu(account1)
            elif acc_choice == 2:
                print()
                print("To access your profile, please enter your account number below.")
                print()
                account_number = int(input("Account Number: "))
#                current_account = user1.authentication(account_number)
                current_account = user1.find_account(account_number)

                if current_account:
                    print()
                    print(f"Welcome {user1.name}!!")
                    print("Welcome {}!".format(current_account.account_number))
                    account_open = True
                    activity_menu(current_account)
                else:
                    print()
                    print("Authentication failed!")
                    print("Reason: account number not found.")
                    continue
            else:
                print()
                print("Thank you for visiting!")
                current_account = ''
                client_open = False

# The main process starts here
bank = Bank()
print()
print("Welcome to {}!".format(bank.name))
print()
running = True
while running:
    print()
    print("""Choose an option:
    
    1. Create a new User
    2. Access existing User
    3. Exit
    """)

    choice = int(input("1, 2 or 3: "))

    if choice == 1:
        print()
        print("To create a User, please enter the following:")
        print()
        user1 = Client(input("Name: "), input("User ID: "))
        bank.add_user(user1)
        client_open = True
        account_menu(user1,client_open)
    elif choice == 2:
        print()
        print("To access your profile, please enter your credentials below.")
        print()
        user_id = input("User ID: ")
        current_client = bank.find_user(user_id)
        if current_client:
            print()
            print("Welcome {}!".format(current_client.name))
            client_open = True
            account_menu(current_client, client_open)
        else:
            print()
            print("Authentication failed!")
            print("Reason: user id not found.")
            continue
    elif choice == 3:
        print()
        print("Goodbye!")
        running = False