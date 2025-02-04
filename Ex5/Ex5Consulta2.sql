Use Ex5;
SELECT 
    Cita.CitaID,
    Cita.DataHora,
    Cita.MatriculaVehicle,
    Cita.ClientDNI,
    Vehicle.Tipus,
    Vehicle.Marca,
    Client.Nom,
    Client.Usuari
FROM 
    Cita
JOIN 
    Vehicle ON Cita.MatriculaVehicle = Vehicle.Matricula
JOIN 
    Client ON Cita.ClientDNI = Client.DNI
WHERE 
    Cita.DataHora >= '2022-03-10';
    