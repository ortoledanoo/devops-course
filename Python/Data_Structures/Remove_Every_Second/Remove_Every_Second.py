#Reviewed By Daniel
def remove_every_second(function_list):
    """While len(list) is Bigger Then 1 Remove Every 2nd Element. Then pop() Last Element Remaining"""
    print(function_list)
    while len(function_list) > 1:
        function_list = function_list[0::2]
        print("Removed, List Now - ", function_list)
    function_list.pop() #Remove Last Element
    print(f"List is Now Empty! - {function_list}")

user_list = [0,1,2,3,4,5,6,7,8,9]
remove_every_second(user_list)

