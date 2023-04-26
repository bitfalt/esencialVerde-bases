CREATE TABLE [dbo].[ProcessPriceHistory]
(
[processpricehistoryid] [int] NOT NULL IDENTITY(1, 1),
[processid] [int] NOT NULL,
[startdate] [date] NOT NULL,
[enddate] [date] NOT NULL
)
GO
ALTER TABLE [dbo].[ProcessPriceHistory] ADD CONSTRAINT [PK_ProcessPriceHistory] PRIMARY KEY CLUSTERED ([processpricehistoryid])
GO
ALTER TABLE [dbo].[ProcessPriceHistory] ADD CONSTRAINT [FK_ProcessPriceHistory_Processes] FOREIGN KEY ([processid]) REFERENCES [dbo].[Processes] ([processid])
GO
