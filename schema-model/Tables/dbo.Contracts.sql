CREATE TABLE [dbo].[Contracts]
(
[contractid] [int] NOT NULL IDENTITY(1, 1),
[startdate] [date] NOT NULL,
[enddate] [date] NOT NULL,
[status] [nchar] (20) NOT NULL
)
GO
ALTER TABLE [dbo].[Contracts] ADD CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED ([contractid])
GO
