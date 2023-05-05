DROP VIEW dbo.ProcessXCountryPrices;

CREATE VIEW dbo.ProcessXCountryPrices WITH schemabinding AS
SELECT dbo.ProcessPriceXCountry.processpricexcountryid AS id ,dbo.Processes.name, dbo.Processes.description, dbo.Country.name AS country, dbo.ProcessPriceXCountry.pricexkg, dbo.WasteTypes.name AS wasteType
FROM dbo.Processes INNER JOIN
	 dbo.ProcessesXCountry ON dbo.Processes.processid = dbo.ProcessesXCountry.processid INNER JOIN
	 dbo.ProcessPriceXCountry ON dbo.Processes.processid = dbo.ProcessPriceXCountry.processid INNER JOIN
	 dbo.WasteTypeXProcess ON dbo.Processes.processid = dbo.WasteTypeXProcess.processid INNER JOIN
	 dbo.WasteTypes ON dbo.WasteTypeXProcess.wastetypeid = dbo.WasteTypes.wastetypeid INNER JOIN
	 dbo.Country ON dbo.ProcessesXCountry.countryid = dbo.Country.countryid AND dbo.ProcessPriceXCountry.countryid = dbo.Country.countryid
WHERE dbo.WasteTypes.name = 'Nuclear waste'

SELECT * FROM dbo.ProcessXCountryPrices
GROUP BY id;