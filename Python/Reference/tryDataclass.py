# %%
from dataclasses import dataclass

# %%
digits = ['nul', 'unu', 'du', 'tri', 'kvar', 'kvin', 'ses', 'sep', 'ok', 'naŭ']
tenpow = ['unu', 'dek', 'cent', 'mil', 'miliono', 'miliardo', 'biliono']

# %%
def nameOfNum(num:int):
    name = []
    if num == 0:
        name.append(digits[0])
    else:
        sig = num/abs(num)
        num = abs(num)
        pos = 0
        while num > 0:
            dig = num%10
            if pos == 0 and dig > 0:
                name = [digits[dig]]
            elif dig > 1:
                name.append(digits[dig]+tenpow[pos])
            elif dig == 1:
                name.append(tenpow[pos])
            num = int(num/10)
            pos += 1
        if sig < 0:
            name.append('minus')
    name = ' '.join(name[::-1])
    return name


# %%
@dataclass
class Number:
    value: int
    def __post_init__(self):
        self.name = nameOfNum(self.value)
    def __add__(self, other):
        return Number(self.value+other.value)


# %%
from dataclasses import dataclass, field
from typing import List

# %%
RANKS = 'A 2 3 4 5 6 7 8 9 J Q K'.split()
SUITS = '♡ ♢ ♠ ♣'.split()
def default_deck():
    return [Card(r, s) for s in SUITS for r in RANKS]

# %%
@dataclass
class Card:
    rank: str
    suite: str
    def __str__(self):
        return f'{self.rank}{self.suite}'

@dataclass
class Deck:
    cards: List[Card] = field(default_factory=default_deck)
# %%
