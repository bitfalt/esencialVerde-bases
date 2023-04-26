CREATE TABLE [dbo].[ProcessesXCountry]
(
[processid] [int] NOT NULL,
[countryid] [int] NOT NULL,
[stateid] [int] NULL,
[priceXkg] [money] NOT NULL,
[enabled] [binary] (1) NOT NULL
)
GO
ALTER TABLE [dbo].[ProcessesXCountry] ADD CONSTRAINT [FK_ProcessesXCountry_Country] FOREIGN KEY ([countryid]) REFERENCES [dbo].[Country] ([countryid])
GO
ALTER TABLE [dbo].[ProcessesXCountry] ADD CONSTRAINT [FK_ProcessesXCountry_Processes] FOREIGN KEY ([processid]) REFERENCES [dbo].[Processes] ([processid])
GO
ALTER TABLE [dbo].[ProcessesXCountry] ADD CONSTRAINT [FK_ProcessesXCountry_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
