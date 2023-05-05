CREATE TYPE [dbo].[TAddressData] AS TABLE
(
[countryid] [int] NOT NULL,
[stateid] [int] NOT NULL,
[city] [varchar] (30) NOT NULL,
[street] [varchar] (80) NOT NULL,
[postalCode] [varchar] (20) NOT NULL
)
GO
