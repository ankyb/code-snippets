# Get Fibonacci Numbers.
Various implementation of calculation of Fibonacci numbers.

The main purpose is to show some programming techniques rather than mathematical
insights.

    fibLoop = (number) ->
        if number is 1 or number is 2 then return 1
        if number is 0 then return 0
        prev = 1
        prevPrev = 1
        for i in [1..number - 2]
            current = prev + prevPrev
            prevPrev = prev
            prev = current
        return current

Totally defeats the purpose of iteration here, but just a proof of concept.

    fibLoopMemoization = (number) ->
        if number is 1 or number is 2 then return 1
        if number is 0 then return 0
        arr = [1, 1]
        current = 3
        while current <= number
            arr.push arr[current - 2] + arr[current - 3]
            current++
        return arr[number - 1]

    fibRecursive = (number) ->
        if number is 1 or number is 2 then return 1
        if number is 0 then return 0
        return fibRecursive(number - 1) + fibRecursive(number - 2)

    fibRecursiveMemoization = (number, memoizer = {0: 0, 1: 1, 2: 1}) ->
        if memoizer[number]? then memoizer[number]
        else
            memoizer[number] = fibRecursiveMemoization(number - 1, memoizer) +
                                fibRecursiveMemoization(number - 2, memoizer)

Doesn't belong here, but kind of neat.

    fibGoldenRatio = (number) ->
        squareRootOf5 = Math.sqrt 5
        a = Math.pow (1 + squareRootOf5) / 2, number
        b = Math.pow (1 - squareRootOf5) / 2, number
        return Math.round (a - b) / squareRootOf5

    module.exports =
        fibLoop: fibLoop
        fibLoopMemoization: fibLoopMemoization
        fibRecursive: fibRecursive
        fibRecursiveMemoization: fibRecursiveMemoization
        fibGoldenRatio: fibGoldenRatio

