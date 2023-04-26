CREATE TABLE [dbo].[Status]
(
[statusid] [smallint] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[Status] ADD CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([statusid])
GO
