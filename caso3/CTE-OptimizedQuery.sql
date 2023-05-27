WITH FilteredWasteTypes AS (
    SELECT wt.wastetypeid, wt.name AS wasteType
    FROM WasteTypes wt
    WHERE wt.name = 'Nuclear waste'
)
SELECT
    c.name AS country,
    fw.wasteType,
    p.name AS process,
    wa.name AS waste,
    pp.checksum
FROM Country c
INNER JOIN ProcessPriceXCountry pp
    ON c.countryid = pp.countryid
INNER JOIN Processes p
    ON pp.processid = p.processid
INNER JOIN WasteTypeXProcess wp
    ON p.processid = wp.processid
INNER JOIN Wastes wa
    ON wp.wastetypeid = wa.wastetypeid
INNER JOIN FilteredWasteTypes fw
    ON wa.wastetypeid = fw.wastetypeid
ORDER BY fw.wasteType;
