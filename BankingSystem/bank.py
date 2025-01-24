class Bank:
    def __init__(self):
        self.users = []
        self.name = "ABC Bank"

    def add_user(self, user):
        self.users.append(user)
        print(f"User {user.name} added")

    def find_user(self, user_id):
        for user in self.users:
            if user.user_id == user_id:
                return user
        return None

