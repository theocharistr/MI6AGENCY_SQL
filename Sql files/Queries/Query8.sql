USE MI6AgencyDB

SELECT missionID AS 'done missions with reward > 100000' FROM Mission WHERE (status = 'done') AND (reward > 100000)
