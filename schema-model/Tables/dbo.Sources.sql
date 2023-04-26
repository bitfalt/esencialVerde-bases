CREATE TABLE [dbo].[Sources]
(
[sourceid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[Sources] ADD CONSTRAINT [PK_Sources] PRIMARY KEY CLUSTERED ([sourceid])
GO
