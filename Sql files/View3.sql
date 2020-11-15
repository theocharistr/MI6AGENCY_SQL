CREATE VIEW SecretaryFieldAgents AS
SELECT Secretary.name AS name, Secretary.workHistory, FieldAgent.name AS FieldAgent,FieldAgent.successRatio,FieldAgent.speciality
FROM Transmit INNER JOIN
Secretary ON Transmit.secretaryID = Secretary.secretaryID INNER JOIN
FieldAgent ON Transmit.fieldAgentID = FieldAgent.fieldAgentID 



 