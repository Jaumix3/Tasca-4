Use Ex6;
select count(idAvions), a.Model as Model, a.Capacitat as Capacitat, a.Companyia as Companyia, v.Numero as NumVol, v.Origen as Origen v.Desti as Destí, v.HSortida as "Hora de Sortida", v.HArribada as "Hora d'arribada"
from Avions as a, Vols as v
where a.idAvio = v.Avio_idAvio and a.Marca 