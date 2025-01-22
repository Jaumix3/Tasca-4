use Ex4;
Select count(*) as numpolises
from POLISSA, Client
where Client.idClient=POLISSA.Client_idClient and Client.Nom like "%Joan%"