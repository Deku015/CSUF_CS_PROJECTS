#stock maximization
def dynamic(N, stocks_and_values, amount):
    print("Using dynamic method")
    #initailize
    A = [[0]* (amount +1 ) for _ in range(N+1)]

    for i in range(N+1):
        for j in range(amount+1):
            if stocks_and_values[i-1][1]<=j:  
                A[i][j] = max(A[i - 1][j], A[i - 1][j - stocks_and_values[i - 1][1]] + stocks_and_values[i - 1][0]) #0case
            else:
                A[i][j] = A[i - 1][j] #1case
    return A[N][amount]
