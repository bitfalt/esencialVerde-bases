CREATE TABLE [dbo].[ContactXCollectorXState]
(
[contactxcollectorxstateid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[collectorxstateid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ContactXCollectorXState] ADD CONSTRAINT [PK_ContactXCollectorXState] PRIMARY KEY CLUSTERED ([contactxcollectorxstateid])
GO
ALTER TABLE [dbo].[ContactXCollectorXState] ADD CONSTRAINT [FK_ContactXCollectorXState_CollectorsXState] FOREIGN KEY ([collectorxstateid]) REFERENCES [dbo].[CollectorsXState] ([collectorxstateid])
GO
ALTER TABLE [dbo].[ContactXCollectorXState] ADD CONSTRAINT [FK_ContactXCollectorXState_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
