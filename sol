def maxSumIncreasingSubsequence(array):
    sums = [0 for i in range(len(array))]
    sums[0] = array[0]
    sequences = [0 for i in range(len(array))]
    sequences[0] = None
    for i in range(1,len(array)):
        max_temp = float("-inf")
        for j in range(0,i):
            if array[i]>array[j]:
                currentSum = array[i] + sums[j]
                if (currentSum > max_temp):
                    sequences[i] = j
                    max_temp = currentSum
        sums[i] = max(array[i],max_temp)
        if (sums[i] == array[i]):
            sequences[i] = None

    max_index = 0
    current_max = float("-inf")
    for i in range(len(sums)):
        if current_max < sums[i]:
            current_max = sums[i]
            max_index = i

    sum_trace = []
    sum_trace.append(array[max_index])
    current_index = max_index
    while sequences[current_index] is not None:
        current_index = sequences[current_index]
        sum_trace.append(array[current_index])

    sol = []
    sol.append(sums[max_index])
    sum_trace.reverse()
    sol.append(sum_trace)
    print(sol)
    return sol
