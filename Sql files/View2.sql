CREATE VIEW MissionsInFieldAgents AS
SELECT FieldAgent.name,FieldAgent.successRatio,Mission.description, Mission.missionID, Mission.deadline,Mission.difficulty,Mission.reward
FROM FieldAgent INNER JOIN
Executee ON FieldAgent.fieldAgentID = Executee.fieldAgentID INNER JOIN
Mission ON Executee.missionID = Mission.missionID