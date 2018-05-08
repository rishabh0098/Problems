local
    fun hanoi (N,S,I,D) = 
        if (N=1) then [(S,D)]
        else (hanoi(N-1,S,D,I) @ hanoi(1,S,I,D) @ hanoi(N-1,I,S,D))
in
    fun solveTOH (N) =
        hanoi (N,1,2,3)
end