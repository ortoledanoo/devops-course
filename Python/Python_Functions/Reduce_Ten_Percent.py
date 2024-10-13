my_dict = {"Apple": 10, "iPhone": 3500, "Shirt": 100}

#Reduce Every Value by 10%
new_sale = [(my_dict[i] / 10 * 9) for i in my_dict.keys()]
print(new_sale)


#The Classic Way
#for i in my_dict.keys():
#    my_dict[i] = my_dict[i] /10 * 9
#print(my_dict.values())