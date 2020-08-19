"""
@staticmethod vs. @classmethod
"""

class Animal:
    feature = 'rabbit'

    def __init__(self):
        self.species = self.feature

    @classmethod
    def class_check(cls):
        return cls()

    @staticmethod
    def static_check():
        return Animal()

class WhatAnimal(Animal):
    feature = 'bear'

if __name__ == '__main__':
    animal1 = WhatAnimal.class_check()
    print(animal1.species) # bear

    animal2 = WhatAnimal.static_check()
    print(animal2.species) # rabbit