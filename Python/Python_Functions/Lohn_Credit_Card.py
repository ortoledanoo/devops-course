def lohn_credit_card(user_input):
    #Convert Credit Number To List
    credit_card = [int(x) for x in str(user_input)]
    print(credit_card)

    #Run From 0 to 1 Before Last Element
    for i in range(len(credit_card) - 2, -1, -2): # len - 2, until -1 index (0) and jumps -2
        credit_card[i] *= 2
        if credit_card[i] > 9:
            credit_card[i] -= 9

    #Print The Result
    if sum(credit_card) % 10 == 0:
        print("Credit Card Valid")
        return True
    else:
        print("Credit Card BAD")
        return False

user_input = 5326141204293524
lohn_credit_card(user_input)
