CREATE TRIGGER inappropriate_agent ON Executee
FOR INSERT, UPDATE AS
	DECLARE @fieldAgentID char(6)
	DECLARE @missionID char(6)
	DECLARE @difficulty tinyint
	DECLARE @successRatio decimal(9,8)
	SELECT @fieldAgentID = fieldAgentID FROM inserted i
	SELECT @successRatio = successRatio FROM FieldAgent WHERE fieldAgentID = @fieldAgentID
	SELECT @missionID = missionID FROM inserted i
	SELECT @difficulty = difficulty FROM Mission WHERE missionID = @missionID
	IF @difficulty > ( @successRatio *10 )
	BEGIN
		UPDATE Executee
		SET toDate = fromDate
	END