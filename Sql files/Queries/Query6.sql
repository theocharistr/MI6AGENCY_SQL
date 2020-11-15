USE MI6AgencyDB

DECLARE @JohnnyEnglish char(6)
SELECT @JohnnyEnglish = FieldAgentID FROM FieldAgent WHERE name = 'Johnny English'
SELECT fieldAgentID, missionID FROM Executee WHERE FieldAgentID = @JohnnyEnglish