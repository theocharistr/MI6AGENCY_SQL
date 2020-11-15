USE MI6AgencyDB

SELECT SUM(quantity) AS 'Number of Guns' FROM Gadget WHERE GadgetType = 'gun'
