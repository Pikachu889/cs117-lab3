while True:
    a = int(input("Enter the first number : "))
    b = int(input("Enter the second number : "))
    op = input("Enter +, -, *, /, %, percent for the specific operation : ")
    def sum(a,b):
        return a+b
    def diff(a,b):
        return a-b
    def prod(a,b):
        return a*b
    def div(a,b):
        return a/b
    def even_check(a):
        if a%2==0:
            return "First number is even"
        else:
            return "First number is odd"
    def percent(a,b):
        return (a/b)*100
    if op == "+":
        result = sum(a,b)
    elif op == "-":
         result = diff(a,b)
    elif op == "*":
         result = prod(a,b)
    elif op == "/":
        result = div(a,b)
    elif op == "%":
        result = even_check(a)
    elif op == "percent":
        result = percent(a,b)
    else:
        print("Invalid operation entered!")
        continue
    print("The result of given numbers is : " , result)
    cnt = input("Do You wish to continue another operation? (Yes/No) : ")
    if cnt != "Yes":
        print("Thanks for using the program, it will now exit!")
        break
    else:
        continue