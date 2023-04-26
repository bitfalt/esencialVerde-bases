CREATE TABLE [dbo].[CollectorXCity]
(
[collectorxcityid] [int] NOT NULL IDENTITY(1, 1),
[collectorid] [int] NOT NULL,
[cityid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[CollectorXCity] ADD CONSTRAINT [PK_CollectorXCity] PRIMARY KEY CLUSTERED ([collectorxcityid])
GO
ALTER TABLE [dbo].[CollectorXCity] ADD CONSTRAINT [FK_CollectorXCity_Cities] FOREIGN KEY ([cityid]) REFERENCES [dbo].[Cities] ([cityid])
GO
ALTER TABLE [dbo].[CollectorXCity] ADD CONSTRAINT [FK_CollectorXCity_Collectors] FOREIGN KEY ([collectorid]) REFERENCES [dbo].[Collectors] ([collectorid])
GO
