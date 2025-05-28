from typing import Optional

from pydantic import BaseModel

class User(BaseModel):
    id: int
    name: str
    age: int
    email: Optional[str] = None

user1 = User(id=1, name='Doge', age=5, email='123@pp.com')
user2 = User(id=1, name='Doge', age=5)

print(user1)
print(user2)