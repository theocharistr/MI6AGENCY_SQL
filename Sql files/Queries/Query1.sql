USE MI6AgencyDB

SELECT gadgetName,quantity FROM Gadget WHERE gadgetType = 'car' OR gadgetType = 'bike'