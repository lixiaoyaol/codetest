from typing import Optional

class DatabaseConnection:
    _instance: Optional["DatabaseConnection"] = None

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance
    
    def __init__(self, username, password) -> None:
        self.username = username
        self.password = password

    def connect(self):
        return f'Connecting to database with username: {self.username}'
    
# Test the singleton behavior
db1 = DatabaseConnection('user1', 'pass1')
db2 = DatabaseConnection('user2', 'pass2')

print(db1 is db2)