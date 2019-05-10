
Create view TP_VISTATRACKINGSIGNAL 
as

select 
	a.codart as codarticolo,
	a.coddeposito,
	10000 as esercizio ,
	case when b."1">0 then (a."1" - b."1")/abs(a."1" - b."1") else 0 end as [1],
	case when b."2">0 then ((a."1" - b."1")+(a."2" - b."2"))/((abs(a."1" - b."1")+abs(a."2" - b."2"))/2) else 0 end as [2],
	case when b."3">0 then ((a."1" - b."1")+(a."2" - b."2")+(a."3" - b."3"))/((abs(a."1" - b."1")+abs(a."2" - b."2")+abs(a."3" - b."3"))/3) else 0 end as [3],
	case when b."4">0 then ((a."1" - b."1")+(a."2" - b."2")+(a."3" - b."3")+(a."4" - b."4"))/((abs(a."1" - b."1")+abs(a."2" - b."2")+abs(a."3" - b."3")+abs(a."4" - b."4"))/4) else 0 end as [4],
	case when b."5">0 then ((a."1" - b."1")+(a."2" - b."2")+(a."3" - b."3")+(a."4" - b."4")+(a."5" - b."5"))/((abs(a."1" - b."1")+abs(a."2" - b."2")+abs(a."3" - b."3")+abs(a."4" - b."4")+abs(a."5" - b."5"))/5) else 0 end as [5],
	case when b."6">0 then ((a."1" - b."1")+(a."2" - b."2")+(a."3" - b."3")+(a."4" - b."4")+(a."5" - b."5")+(a."6" - b."6"))/((abs(a."1" - b."1")+abs(a."2" - b."2")+abs(a."3" - b."3")+abs(a."4" - b."4")+abs(a."5" - b."5")+abs(a."6" - b."6"))/6) else 0 end as [6],
	case when b."7">0 then ((a."1" - b."1")+(a."2" - b."2")+(a."3" - b."3")+(a."4" - b."4")+(a."5" - b."5")+(a."6" - b."6")+(a."7" - b."7"))/((abs(a."1" - b."1")+abs(a."2" - b."2")+abs(a."3" - b."3")+abs(a."4" - b."4")+abs(a."5" - b."5")+abs(a."6" - b."6")+abs(a."7" - b."7"))/7) else 0 end as [7],
	case when b."8">0 then ((a."1" - b."1")+(a."2" - b."2")+(a."3" - b."3")+(a."4" - b."4")+(a."5" - b."5")+(a."6" - b."6")+(a."7" - b."7")+(a."8" - b."8"))/((abs(a."1" - b."1")+abs(a."2" - b."2")+abs(a."3" - b."3")+abs(a."4" - b."4")+abs(a."5" - b."5")+abs(a."6" - b."6")+abs(a."7" - b."7")+abs(a."8" - b."8"))/8) else 0 end as [8],
	case when b."9">0 then ((a."1" - b."1")+(a."2" - b."2")+(a."3" - b."3")+(a."4" - b."4")+(a."5" - b."5")+(a."6" - b."6")+(a."7" - b."7")+(a."8" - b."8")+(a."9" - b."9"))/((abs(a."1" - b."1")+abs(a."2" - b."2")+abs(a."3" - b."3")+abs(a."4" - b."4")+abs(a."5" - b."5")+abs(a."6" - b."6")+abs(a."7" - b."7")+abs(a."8" - b."8")+abs(a."9" - b."9"))/9) else 0 end as [9],
	case when b."10">0 then ((a."1" - b."1")+(a."2" - b."2")+(a."3" - b."3")+(a."4" - b."4")+(a."5" - b."5")+(a."6" - b."6")+(a."7" - b."7")+(a."8" - b."8")+(a."9" - b."9")+(a."10" - b."10"))/((abs(a."1" - b."1")+abs(a."2" - b."2")+abs(a."3" - b."3")+abs(a."4" - b."4")+abs(a."5" - b."5")+abs(a."6" - b."6")+abs(a."7" - b."7")+abs(a."8" - b."8")+abs(a."9" - b."9")+abs(a."10" - b."10"))/10) else 0 end as [10],
	case when b."11">0 then ((a."1" - b."1")+(a."2" - b."2")+(a."3" - b."3")+(a."4" - b."4")+(a."5" - b."5")+(a."6" - b."6")+(a."7" - b."7")+(a."8" - b."8")+(a."9" - b."9")+(a."10" - b."10")+(a."10" - b."10"))/((abs(a."1" - b."1")+abs(a."2" - b."2")+abs(a."3" - b."3")+abs(a."4" - b."4")+abs(a."5" - b."5")+abs(a."6" - b."6")+abs(a."7" - b."7")+abs(a."8" - b."8")+abs(a."9" - b."9")+abs(a."10" - b."10")+abs(a."11" - b."11"))/11) else 0 end as [11],
	case when b."12">0 then ((a."1" - b."1")+(a."2" - b."2")+(a."3" - b."3")+(a."4" - b."4")+(a."5" - b."5")+(a."6" - b."6")+(a."7" - b."7")+(a."8" - b."8")+(a."9" - b."9")+(a."10" - b."10")+(a."11" - b."11")+(a."12" - b."12"))/((abs(a."1" - b."1")+abs(a."2" - b."2")+abs(a."3" - b."3")+abs(a."4" - b."4")+abs(a."5" - b."5")+abs(a."6" - b."6")+abs(a."7" - b."7")+abs(a."8" - b."8")+abs(a."9" - b."9")+abs(a."10" - b."10")+abs(a."11" - b."11")+abs(a."12" - b."12"))/12) else 0 end as [12],
	0 as z1, 
	0 as z2,
	'TrackingSignal' as tipo
from 
	TP_VISTAPREVISIONI_TREND_STAGIONALITA a 
inner join 
	TP_VISTAVENDITEANNIPRECEDENTI b 
on a.codart = b.codart and a.coddeposito = b.coddeposito and b.esercizio = year(getdate())
where 
	a.esercizio = 8000


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_VISTATRACKINGSIGNAL] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_VISTATRACKINGSIGNAL] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_VISTATRACKINGSIGNAL] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTATRACKINGSIGNAL] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_VISTATRACKINGSIGNAL] TO [Metodo98]
    AS [dbo];

