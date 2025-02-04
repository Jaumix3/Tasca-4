use Ex6;
select r,Numero as "Numero Reserva", p.Nom as Nom, p.Cognoms as Cognoms, v.Numero as "Numero de Vol"
from reserves as r, Passatgers as p, Vols as v
where r.Passatgers_idPassatgers=p.idPassatgers and r.Vols_idVols.idVol and r.Data="29/02/2025"