#Reviewed By Joni
def lohn_credit_card(credit_card_number):
    """Gets Credit Card Number and Check Valid Using Lohn Algorithm """
    #Convert Credit Number To List
    credit_card = [int(x) for x in str(credit_card_number)]
    print(credit_card)

    #Run From 0 to 1 Before Last Element
    for i in range(len(credit_card) - 2, -1, -2): # len - 2, until -1 index (0) and jumps -2
        credit_card[i] *= 2
        if credit_card[i] > 9:
            credit_card[i] -= 9

    return sum(credit_card) % 10 == 0

user_input = (int(input("Enter a Credit Card Number - ")))
lohn_credit_card(user_input)