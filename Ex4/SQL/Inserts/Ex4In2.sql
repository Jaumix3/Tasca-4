use Ex4;
select Client.DNI as "DNI", Client.Nom, Client.COGNOM as "Cognoms", POLISSA.Numpolissa as "Numero de la Pòlissa", TipusPolissa.Descripcio
From Client, POLISSA, TipusPolissa
where Client.idClient=POLISSA.Client_idClient and TipusPolissa.idTipusPolissa=POLISSA.TipusPolissa_idTipusPolissa and TipusPolissa.Nom like "%Cotxe%";