# Reviewed By Joni

def run_length_encoding(user_input):
    result = []
    count = 1

    for i in range(1, len(user_input)):
        if user_input[i] == user_input[i - 1]:
            count += 1  
        else:
            result.append(str(count))
            result.append(user_input[i - 1])
            count = 1  
    
    result.append(str(count))
    result.append(user_input[-1])
    
    return ''.join(result)  

if __name__ == "__main__":
    print(run_length_encoding("WBWWWBB"))