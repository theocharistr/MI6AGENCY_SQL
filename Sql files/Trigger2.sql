CREATE TRIGGER add_income ON Mission
INSTEAD OF UPDATE AS
	IF UPDATE (status)
	BEGIN
		DECLARE @newStatus char(8)
		DECLARE @oldStatus char(8)
		DECLARE @missionID char(6)
		DECLARE @fieldAgentID char(6)
		DECLARE @reward money
		SELECT @newStatus = status FROM inserted i
		SELECT @missionID = missionID FROM inserted i
		SELECT @oldStatus = status FROM Mission WHERE missionID = @missionID
		IF @newStatus = 'done' AND @oldStatus = 'inprog'
		BEGIN
			SELECT @fieldAgentID = fieldAgentID FROM Executee WHERE missionID = @missionID
			SELECT @reward = reward FROM Mission WHERE missionID = @missionID
			UPDATE FieldAgent
			SET income = income + @reward
			WHERE fieldAgentID = @fieldAgentID
		END
	END
	UPDATE Mission
		SET
		missionID = inserted.missionID,
		description = inserted.description,
		deadline = inserted.deadline,
		reward = inserted.reward,
		status = inserted.status,
		difficulty = inserted.difficulty,
		clientID = inserted.clientID,
		agencyChiefID = inserted.agencyChiefID,
		secretaryID = inserted.secretaryID,
		informationID = inserted.informationID
		FROM INSERTED WHERE Mission.missionID = @missionID;