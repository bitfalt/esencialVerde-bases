CREATE TABLE [dbo].[EventTypes]
(
[eventtypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[EventTypes] ADD CONSTRAINT [PK_EventTypes] PRIMARY KEY CLUSTERED ([eventtypeid])
GO
