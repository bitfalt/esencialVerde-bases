CREATE TABLE [dbo].[ContactXCollectorXCountry]
(
[contactxcollectorxcountryid] [int] NOT NULL IDENTITY(1, 1),
[contactvalueid] [int] NOT NULL,
[collectorxcountryid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[ContactXCollectorXCountry] ADD CONSTRAINT [PK_ContactXCollectorXCountry] PRIMARY KEY CLUSTERED ([contactxcollectorxcountryid])
GO
ALTER TABLE [dbo].[ContactXCollectorXCountry] ADD CONSTRAINT [FK_ContactXCollectorXCountry_CollectorsXCountry] FOREIGN KEY ([collectorxcountryid]) REFERENCES [dbo].[CollectorsXCountry] ([collectorxcountryid])
GO
ALTER TABLE [dbo].[ContactXCollectorXCountry] ADD CONSTRAINT [FK_ContactXCollectorXCountry_ContactValues] FOREIGN KEY ([contactvalueid]) REFERENCES [dbo].[ContactValues] ([contactvalueid])
GO
