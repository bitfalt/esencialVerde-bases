CREATE TABLE [dbo].[ContactXCollectorXCity]
(
[contactxcollectorxcityid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[collectorxcityid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ContactXCollectorXCity] ADD CONSTRAINT [PK_ContactXCollectorXCity] PRIMARY KEY CLUSTERED ([contactxcollectorxcityid])
GO
ALTER TABLE [dbo].[ContactXCollectorXCity] ADD CONSTRAINT [FK_ContactXCollectorXCity_CollectorXCity] FOREIGN KEY ([collectorxcityid]) REFERENCES [dbo].[CollectorXCity] ([collectorxcityid])
GO
ALTER TABLE [dbo].[ContactXCollectorXCity] ADD CONSTRAINT [FK_ContactXCollectorXCity_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
