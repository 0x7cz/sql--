SELECT x,y,z,
CASE WHEN x+y>z and x+z > y THEN TRUE
ELSE FALSE END
FROM Triangle
