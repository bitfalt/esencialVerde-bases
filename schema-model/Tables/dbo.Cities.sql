CREATE TABLE [dbo].[Cities]
(
[cityid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL,
[stateid] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[Cities] ADD CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED ([cityid])
GO
ALTER TABLE [dbo].[Cities] ADD CONSTRAINT [FK_Cities_States] FOREIGN KEY ([stateid]) REFERENCES [dbo].[States] ([stateid])
GO
