CREATE TABLE [dbo].[ContractLog]
(
[contractlogid] [int] NOT NULL IDENTITY(1, 1),
[contractid] [int] NOT NULL,
[posttime] [datetime] NOT NULL CONSTRAINT [DF_ContractLog_posttime] DEFAULT (getdate()),
[computer] [nchar] (30) NOT NULL,
[username] [nchar] (30) NOT NULL,
[checksum] [varbinary] (150) NOT NULL,
[description] [nchar] (50) NOT NULL,
[contracttermid] [int] NOT NULL,
[value1] [nchar] (50) NOT NULL,
[value2] [nchar] (50) NOT NULL
)
GO
ALTER TABLE [dbo].[ContractLog] ADD CONSTRAINT [PK_ContractLog] PRIMARY KEY CLUSTERED ([contractlogid])
GO
ALTER TABLE [dbo].[ContractLog] ADD CONSTRAINT [FK_ContractLog_Contracts] FOREIGN KEY ([contractid]) REFERENCES [dbo].[Contracts] ([contractid])
GO
ALTER TABLE [dbo].[ContractLog] ADD CONSTRAINT [FK_ContractLog_ContractTerms] FOREIGN KEY ([contracttermid]) REFERENCES [dbo].[ContractTerms] ([contracttermsid])
GO
