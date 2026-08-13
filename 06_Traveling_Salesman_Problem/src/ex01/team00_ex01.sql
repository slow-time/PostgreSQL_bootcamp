WITH RECURSIVE path_finder AS (
    SELECT 
        point1, 
        point2, 
        cost,
        ARRAY[point1, point2]::VARCHAR(1)[] AS path,
        2 AS visited_count
    FROM roads 
    WHERE point1 = 'a'
    
    UNION ALL
    
    SELECT 
        p.point1,
        r.point2,
        p.cost + r.cost,
        (p.path || ARRAY[r.point2])::VARCHAR(1)[],
        p.visited_count + 1
    FROM path_finder p
    JOIN roads r ON p.point2 = r.point1
    WHERE NOT r.point2 = ANY(p.path)
      AND p.visited_count < 4
),

 final_paths AS (
    SELECT 
        p.cost + r.cost AS total_cost,
        (p.path || ARRAY['a'])::VARCHAR(1)[] AS tour
    FROM path_finder p
    JOIN roads r ON p.point2 = r.point1 AND r.point2 = 'a'
    WHERE p.visited_count = 4	
)

SELECT 
    total_cost,
    '{' || array_to_string(tour, ',') || '}' AS tour
FROM final_paths
WHERE total_cost = (SELECT MIN(total_cost) FROM final_paths) OR total_cost = (SELECT MAX(total_cost) FROM final_paths)
ORDER BY total_cost, tour;