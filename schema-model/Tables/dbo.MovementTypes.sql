CREATE TABLE [dbo].[MovementTypes]
(
[movementtype] [smallint] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[MovementTypes] ADD CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([movementtype])
GO
