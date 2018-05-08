local
    fun search (p1, []) = false
    | search(p1, h1::t1) =
        if(p1 = h1) then true
        else if((p1 <> h1) andalso (List.null(t1))) then false
        else search(p1, t1)

    fun isSafe (N, (x,y), visited) =
        if((x > 0) andalso (y > 0) andalso (x <= N) andalso (y <= N) andalso (not(search((x,y), visited)))) then true
        else false

    fun buildAdjacent ((x1,y1)) =
        [(x1+1,y1+2),(x1+2,y1+1),(x1-1,y1+2),(x1-2,y1+1),(x1+1,y1-2),(x1+2,y1-1),(x1-1,y1-2),(x1-2,y1-1)]
(*This is optimal pattern*)
    exception Back
    exception Impossible

    fun solveKT (N, [], []) =
        raise Impossible
    | solveKT(N, L, []) =
        raise Back
    | solveKT(N, [], L1) =
        solveKT(N, [(1,1)], L1)
    | solveKT(N, visited as h::t, adjacent as head::tail) =
        if ((List.length(visited) = N*N)) then (print("Found\n");List.rev(visited))
        else if (isSafe(N, head, visited))
            then solveKT(N, head::visited, buildAdjacent(head))
            handle Back =>
                if ((visited = [(1,1)]) andalso (adjacent = [])) then (print("Mission Impossible, Ghost Protocol Activated\n");[])
                else solveKT(N, visited, tail)
        else solveKT(N, visited, tail)
in
    fun showKnightsTour (N) =
        solveKT(N, [(1,1)], buildAdjacent((1,1)))
end