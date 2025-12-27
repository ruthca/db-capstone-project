SELECT 
    c.idCustomer,
    c.CustomerName,
    o.OrderID,
    o.totalCost,
    m.MenuName,
    mi.CourseName
FROM deccustomers c
INNER JOIN decorders o
    ON c.idCustomer = o.idCustomer
INNER JOIN decmenus m
    ON o.menuID = m.idMenu
INNER JOIN decmenuitems mi
    ON m.idMenu = mi.idMenuItems
WHERE o.totalCost > 150
ORDER BY o.totalCost ASC;




