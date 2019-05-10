﻿
CREATE VIEW TP_VISTAMEDIAMOBILE_PREVISIONE
AS

SELECT 
	CODARTICOLO,
	CODDEPOSITO,
	3 AS PERIODIDACONSIDERARE,
	0 AS [36],
	0 AS [35],
	0 AS [34],
	(([36] + [35] + [34]) / 3) AS [33],
	(([35] + [34] + [33]) / 3) AS [32],
	(([34] + [33] + [32]) / 3) AS [31],
	(([33] + [32] + [31]) / 3) AS [30],
	(([32] + [31] + [30]) / 3) AS [29],
	(([31] + [30] + [29]) / 3) AS [28],
	(([30] + [29] + [28]) / 3) AS [27],
	(([29] + [28] + [27]) / 3) AS [26],
	(([28] + [27] + [26]) / 3) AS [25],
	(([27] + [26] + [25]) / 3) AS [24],
	(([26] + [25] + [24]) / 3) AS [23],
	(([25] + [24] + [23]) / 3) AS [22],
	(([24] + [23] + [22]) / 3) AS [21],
	(([23] + [22] + [21]) / 3) AS [20],
	(([22] + [21] + [20]) / 3) AS [19],
	(([21] + [20] + [19]) / 3) AS [18],
	(([20] + [19] + [18]) / 3) AS [17],
	(([19] + [18] + [17]) / 3) AS [16],
	(([18] + [17] + [16]) / 3) AS [15],
	(([17] + [16] + [15]) / 3) AS [14],
	(([16] + [15] + [14]) / 3) AS [13],
	(([15] + [14] + [13]) / 3) AS [12],
	(([14] + [13] + [12]) / 3) AS [11],
	(([13] + [12] + [11]) / 3) AS [10],
	(([12] + [11] + [10]) / 3) AS [9],
	(([11] + [10] + [9]) / 3) AS [8],
	(([10] + [9] + [8]) / 3) AS [7],
	(([9] + [8] + [7]) / 3) AS [6],
	(([8] + [7] + [6]) / 3) AS [5],
	(([7] + [6] + [5]) / 3) AS [4],
	(([6] + [5] + [4]) / 3) AS [3],
	(([5] + [4] + [3]) / 3) AS [2],
	(([4] + [3] + [2]) / 3) AS [1],
	'PREVISIONE' AS TIPO
FROM 
	TP_PERIODI_VENDUTO
UNION
SELECT 
	CODARTICOLO,
	CODDEPOSITO,
	6 AS PERIODIDACONSIDERARE,
	0 AS [36],
	0 AS [35],
	0 AS [34],
	0 AS [33],
	0 AS [32],
	0 AS [31],
	(([36] + [35] + [34] + [33] + [32] + [31]) / 6) AS [30],
	(([35] + [34] + [33] + [32] + [31] + [30]) / 6) AS [29],
	(([34] + [33] + [32] + [31] + [30] + [29]) / 6) AS [28],
	(([33] + [32] + [31] + [30] + [29] + [28]) / 6) AS [27],
	(([32] + [31] + [30] + [29] + [28] + [27]) / 6) AS [26],

	(([31] + [30] + [29] + [28] + [27] + [26]) / 6) AS [25],
	(([30] + [29] + [28] + [27] + [26] + [25]) / 6) AS [24],
	(([29] + [28] + [27] + [26] + [25] + [24]) / 6) AS [23],
	(([28] + [27] + [26] + [25] + [24] + [23]) / 6) AS [22],
	(([27] + [26] + [25] + [24] + [23] + [22]) / 6) AS [21],
	(([26] + [25] + [24] + [23] + [22] + [21]) / 6) AS [20],
	(([25] + [24] + [23] + [22] + [21] + [20]) / 6) AS [19],
	(([24] + [23] + [22] + [21] + [20] + [19]) / 6) AS [18],
	(([23] + [22] + [21] + [20] + [19] + [18]) / 6) AS [17],
	(([22] + [21] + [20] + [19] + [18] + [17]) / 6) AS [16],
	(([21] + [20] + [19] + [18] + [17] + [16]) / 6) AS [15],
	(([20] + [19] + [18] + [17] + [16] + [15]) / 6) AS [14],
	(([19] + [18] + [17] + [16] + [15] + [14]) / 6) AS [13],
	(([18] + [17] + [16] + [15] + [14] + [13]) / 6) AS [12],
	(([17] + [16] + [15] + [14] + [13] + [12]) / 6) AS [11],
	(([16] + [15] + [14] + [13] + [12] + [11]) / 6) AS [10],
	(([15] + [14] + [13] + [12] + [11] + [10]) / 6) AS [9],
	(([14] + [13] + [12] + [11] + [10] + [9]) / 6) AS [8],
	(([13] + [12] + [11] + [10] + [9] + [8]) / 6) AS [7],
	(([12] + [11] + [10] + [9] + [8] + [7]) / 6) AS [6],
	(([11] + [10] + [9] + [8] + [7] + [6]) / 6) AS [5],
	(([10] + [9] + [8] + [7] + [6] + [5]) / 6) AS [4],
	(([9] + [8] + [7] + [6] + [5] + [4]) / 6) AS [3],
	(([8] + [7] + [6] + [5] + [4] + [3]) / 6) AS [2],
	(([7] + [6] + [5] + [4] + [3] + [2]) / 6) AS [1],
	'PREVISIONE' AS TIPO
FROM 
	TP_PERIODI_VENDUTO
UNION
SELECT 
	CODARTICOLO,
	CODDEPOSITO,
	9 AS PERIODIDACONSIDERARE,
	0 AS [36],
	0 AS [35],
	0 AS [34],
	0 AS [33],
	0 AS [32],
	0 AS [31],
	0 AS [30],
	0 AS [29],
	0 AS [28],
	(([36] + [35] + [34] + [33] + [32] + [31] + [30] + [29] + [28]) / 9) AS [27],
	(([33] + [34] + [33] + [32] + [31] + [30] + [29] + [28] + [27]) / 9) AS [26],
	(([34] + [33] + [32] + [31] + [30] + [29] + [28] + [27] + [26]) / 9) AS [25],
	(([33] + [32] + [31] + [30] + [29] + [28] + [27] + [26] + [25]) / 9) AS [24],
	(([32] + [31] + [30] + [29] + [28] + [27] + [26] + [25] + [24]) / 9) AS [23],
	(([31] + [30] + [29] + [28] + [27] + [26] + [25] + [24] + [23]) / 9) AS [22],
	(([30] + [29] + [28] + [27] + [26] + [25] + [24] + [23] + [22]) / 9) AS [21],
	(([29] + [28] + [27] + [26] + [25] + [24] + [23] + [22] + [21]) / 9) AS [20],
	(([28] + [27] + [26] + [25] + [24] + [23] + [22] + [21] + [20]) / 9) AS [19],
	(([27] + [26] + [25] + [24] + [23] + [22] + [21] + [20] + [19]) / 9) AS [18],
	(([26] + [25] + [24] + [23] + [22] + [21] + [20] + [19] + [18]) / 9) AS [17],
	(([25] + [24] + [23] + [22] + [21] + [20] + [19] + [18] + [17]) / 9) AS [16],
	(([24] + [23] + [22] + [21] + [20] + [19] + [18] + [17] + [16]) / 9) AS [15],
	(([23] + [22] + [21] + [20] + [19] + [18] + [17] + [16] + [15]) / 9) AS [14],
	(([22] + [21] + [20] + [19] + [18] + [17] + [16] + [15] + [14]) / 9) AS [13],
	(([21] + [20] + [19] + [18] + [17] + [16] + [15] + [14] + [13]) / 9) AS [12],
	(([20] + [19] + [18] + [17] + [16] + [15] + [14] + [13] + [12]) / 9) AS [11],
	(([19] + [18] + [17] + [16] + [15] + [14] + [13] + [12] + [11]) / 9) AS [10],
	(([18] + [17] + [16] + [15] + [14] + [13] + [12] + [11] + [10]) / 9) AS [9],
	(([17] + [16] + [15] + [14] + [13] + [12] + [11] + [10] + [9]) / 9) AS [8],
	(([16] + [15] + [14] + [13] + [12] + [11] + [10] + [9] + [8]) / 9) AS [7],
	(([15] + [14] + [13] + [12] + [11] + [10] + [9] + [8] + [7]) / 9) AS [6],
	(([14] + [13] + [12] + [11] + [10] + [9] + [8] + [7] + [6]) / 9) AS [5],
	(([13] + [12] + [11] + [10] + [9] + [8] + [7] + [6] + [5]) / 9) AS [4],
	(([12] + [11] + [10] + [9] + [8] + [7] + [6] + [5] + [4]) / 9) AS [3],
	(([11] + [10] + [9] + [8] + [7] + [6] + [5] + [4] + [3]) / 9) AS [2],
	(([10] + [9] + [8] + [7] + [6] + [5] + [4] + [3] + [2]) / 9) AS [1],
	'PREVISIONE' AS TIPO
FROM 
	TP_PERIODI_VENDUTO
UNION
SELECT 
	CODARTICOLO,
	CODDEPOSITO,
	12 AS PERIODIDACONSIDERARE,
	0 AS [36],
	0 AS [35],
	0 AS [34],
	0 AS [33],
	0 AS [32],
	0 AS [31],
	0 AS [30],
	0 AS [29],
	0 AS [28],
	0 AS [27],
	0 AS [26],
	0 AS [25],
	(([36] + [35] + [34] + [33] + [32] + [31] + [30] + [29] + [28] + [27] + [26] + [25]) / 12) AS [21],
	(([35] + [34] + [33] + [32] + [31] + [30] + [29] + [28] + [27] + [26] + [25] + [24]) / 12) AS [21],
	(([34] + [33] + [32] + [31] + [30] + [29] + [28] + [27] + [26] + [25] + [24] + [23]) / 12) AS [21],
	(([33] + [32] + [31] + [30] + [29] + [28] + [27] + [26] + [25] + [24] + [23] + [22]) / 12) AS [21],
	(([32] + [31] + [30] + [29] + [28] + [27] + [26] + [25] + [24] + [23] + [22] + [21]) / 12) AS [20],
	(([31] + [30] + [29] + [28] + [27] + [26] + [25] + [24] + [23] + [22] + [21] + [20]) / 12) AS [19],
	(([30] + [29] + [28] + [27] + [26] + [25] + [24] + [23] + [22] + [21] + [20] + [19]) / 12) AS [18],
	(([29] + [28] + [27] + [26] + [25] + [24] + [23] + [22] + [21] + [20] + [19] + [18]) / 12) AS [17],
	(([28] + [27] + [26] + [25] + [24] + [23] + [22] + [21] + [20] + [19] + [18] + [17]) / 12) AS [16],
	(([27] + [26] + [25] + [24] + [23] + [22] + [21] + [20] + [19] + [18] + [17] + [16]) / 12) AS [15],
	(([26] + [25] + [24] + [23] + [22] + [21] + [20] + [19] + [18] + [17] + [16] + [15]) / 12) AS [14],
	(([25] + [24] + [23] + [22] + [21] + [20] + [19] + [18] + [17] + [16] + [15] + [14]) / 12) AS [13],
	(([24] + [23] + [22] + [21] + [20] + [19] + [18] + [17] + [16] + [15] + [14] + [13]) / 12) AS [12],
	(([23] + [22] + [21] + [20] + [19] + [18] + [17] + [16] + [15] + [14] + [13] + [12]) / 12) AS [11],
	(([22] + [21] + [20] + [19] + [18] + [17] + [16] + [15] + [14] + [13] + [12] + [11]) / 12) AS [10],
	(([21] + [20] + [19] + [18] + [17] + [16] + [15] + [14] + [13] + [12] + [11] + [10]) / 12) AS [9],
	(([20] + [19] + [18] + [17] + [16] + [15] + [14] + [13] + [12] + [11] + [10] + [9]) / 12) AS [8],
	(([19] + [18] + [17] + [16] + [15] + [14] + [13] + [12] + [11] + [10] + [9] + [8]) / 12) AS [7],
	(([18] + [17] + [16] + [15] + [14] + [13] + [12] + [11] + [10] + [9] + [8] + [7]) / 12) AS [6],
	(([17] + [16] + [15] + [14] + [13] + [12] + [11] + [10] + [9] + [8] + [7] + [6]) / 12) AS [5],
	(([16] + [15] + [14] + [13] + [12] + [11] + [10] + [9] + [8] + [7] + [6] + [5]) / 12) AS [4],
	(([15] + [14] + [13] + [12] + [11] + [10] + [9] + [8] + [7] + [6] + [5] + [4]) / 12) AS [3],
	(([14] + [13] + [12] + [11] + [10] + [9] + [8] + [7] + [6] + [5] + [4] + [3]) / 12) AS [2],
	(([13] + [12] + [11] + [10] + [9] + [8] + [7] + [6] + [5] + [4] + [3] + [2]) / 12) AS [1],
	'PREVISIONE' AS TIPO
FROM 
	TP_PERIODI_VENDUTO

GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAMEDIAMOBILE_PREVISIONE] TO [Metodo98]
    AS [dbo];

