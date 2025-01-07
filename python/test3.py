from enum import Enum, auto

class Day(Enum):
    SUNDAY = 1
    MONDAY = 2
    TUESDAY = 3
    WEDNESDAY = 4
    THURSDAY = 5
    FRIDAY = 6
    SATURDAY = 7

print(Day.SUNDAY)
print(Day.SUNDAY.name)
print(Day.SUNDAY.value)
print(Day(1))

for day in Day:
    print(day)


class Color(Enum):
    RED = auto()
    GREEN = auto()
    BLUE = auto()

print(Color.RED)
print(Color.RED.name)
print(Color.RED.value)