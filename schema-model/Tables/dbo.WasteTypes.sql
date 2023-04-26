CREATE TABLE [dbo].[WasteTypes]
(
[wastetypeid] [int] NOT NULL IDENTITY(1, 1),
[name] [nchar] (20) NOT NULL,
[recyclable] [binary] (1) NOT NULL
)
GO
ALTER TABLE [dbo].[WasteTypes] ADD CONSTRAINT [PK_WasteTypes] PRIMARY KEY CLUSTERED ([wastetypeid])
GO
