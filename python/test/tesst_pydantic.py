from pydantic import BaseModel

class User(BaseModel):
    id: int
    name: str
    age: int
    email: str = None  # 可选字段，默认值为 None

# 实例化数据模型
user = User(id="123", name="Alice", age="25")
print(user)
# 输出: id=123 name='Alice' age=25 email=None

# 访问属性
print(user.id)  # 123

# 验证数据
invalid_user = User(id="123", name="Alice")  # 缺少 age 参数，抛出 ValidationError
