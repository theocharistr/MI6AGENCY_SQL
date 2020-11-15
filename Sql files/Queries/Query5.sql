USE MI6AgencyDB

SELECT FieldAgentID AS 'FielAgent with successRatio>0.6 and income>15000' FROM FieldAgent WHERE(successRatio>0.6) AND (income>15000)  