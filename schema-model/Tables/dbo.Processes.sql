CREATE TABLE [dbo].[Processes]
(
[processid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (30) NOT NULL,
[description] [nchar] (80) NOT NULL,
[status] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[Processes] ADD CONSTRAINT [PK_Processes] PRIMARY KEY CLUSTERED ([processid])
GO
