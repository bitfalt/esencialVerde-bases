BEGIN TRANSACTION

INSERT INTO [DESKTOP-ITQTAE2\SQLEXPRESS].migrate.dbo.Levels
SELECT * FROM esenVerde.dbo.Levels
WHERE levelid NOT IN (SELECT levelid FROM [DESKTOP-ITQTAE2\SQLEXPRESS].migrate.dbo.Levels)

INSERT INTO [DESKTOP-ITQTAE2\SQLEXPRESS].migrate.dbo.ObjectTypes
SELECT * FROM esenVerde.dbo.ObjectTypes
WHERE objecttypeid NOT IN (SELECT objecttypeid FROM [DESKTOP-ITQTAE2\SQLEXPRESS].migrate.dbo.ObjectTypes)

INSERT INTO [DESKTOP-ITQTAE2\SQLEXPRESS].migrate.dbo.Sources
SELECT * FROM esenVerde.dbo.Sources
WHERE sourceid NOT IN (SELECT sourceid FROM [DESKTOP-ITQTAE2\SQLEXPRESS].migrate.dbo.Sources)

INSERT INTO [DESKTOP-ITQTAE2\SQLEXPRESS].migrate.dbo.EventLogs
SELECT * FROM EventLogs

DELETE FROM EventLogs
WHERE eventlogid > 1

COMMIT