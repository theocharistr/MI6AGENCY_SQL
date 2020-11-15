USE MI6AgencyDB

DECLARE @A char(6)
SELECT @A = clientID FROM Client WHERE name = 'Park Geun-hye'
DECLARE @B char(6)
SELECT @B = missionID FROM  Mission WHERE clientID = @A
DECLARE @C table (gadgetID char(6))
INSERT INTO @C(gadgetID) SELECT gadgetID FROM Require WHERE missionID = @B
SELECT gadgetName AS 'Assassinate  Kim Jong-un', gadgetType AS 'Gadgetype that will be used' FROM Gadget INNER JOIN
 @C ON Gadget.gadgetID = [@C].gadgetID
