#stock maximization
def exhaustive(N, stocks_and_values, amount):
    print("Using exhaustive method")
    #initialize the max set which is already set in our input
    max_amount = 0
    #loop through all sets
    for i in range(1 << N):
        #initialize the number of sets that can be packed to our max
        current_stock = 0
        current_value = 0
        #loop through the stock&values
        for j in range(N):
            if (i >> j) & 1:
                #check each comboination
                current_stock += stocks_and_values[j][0]
                current_value += stocks_and_values[j][1]
        if current_value <= amount:
            max_amount = max(max_amount, current_stock)
    return max_amount

#read input file
