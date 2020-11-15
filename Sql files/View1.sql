CREATE VIEW FieldAgentMissionInfo AS
SELECT Mission.description AS description, Mission.deadline, Mission.reward, Gadget.gadgetName AS Gadget,Gadget.quantity
FROM Executee INNER JOIN
Require ON Executee.missionID = Require.missionID INNER JOIN
Gadget ON Require.gadgetID = Gadget.gadgetID INNER JOIN
Mission ON Executee.missionID = Mission.missionID AND Executee.missionID = Mission.missionID



 