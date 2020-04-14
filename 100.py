# -*- encoding: utf-8 -*-

# 1. Написать декоратор на Python3
# выводит foo(x) если x > val
# иначе выводит 'error'

def print_gte(val):
    def decorator(func):
        def wrapper(x):
            if x > val:
                func(x)
            else:
                print('error')
        return wrapper
    return decorator



@print_gte(3)
def foo(x):
    print(x)


foo(3)


