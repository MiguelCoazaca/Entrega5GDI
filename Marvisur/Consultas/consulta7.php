<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	
  <div class="container-fluid">
  <a class="navbar-brand" href="https://www.expresomarvisur.com/">
      <img src="https://www.expresomarvisur.com/assets/images/logo_pb.png" alt="" width="100" height="30" class="d-inline-block align-text-top">
      
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="http://localhost/Marvisur/GuiaDeRemision/principal.php">Guia De Remision</a>
        </li>
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Tablas
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="http://localhost/Marvisur/Encomienda/principalEnc.php">Encomienda</a></li>
            <li><a class="dropdown-item" href="http://localhost/Marvisur/Destinatario/principalDest.php">Destinatario</a></li>
            <li><a class="dropdown-item" href="http://localhost/Marvisur/Remitente/principalRem.php">Remitente</a></li>
			<li><a class="dropdown-item" href="http://localhost/Marvisur/Vehiculo/principalVehi.php">Vehiculo</a></li>
          </ul>
        </li> 
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Tablas de Consulta
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="http://localhost/Marvisur/Conductor/principalCond.php">Conductor</a></li>
            <li><a class="dropdown-item" href="http://localhost/Marvisur/Ruta/principalRut.php">Ruta</a></li>
          </ul>
        </li>		  
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Consultas
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="http://localhost/Marvisur/Consultas/principal1.php">Consulta 1</a></li>
            <li><a class="dropdown-item" href="http://localhost/Marvisur/Consultas/principal2.php">Consulta 2</a></li>
            <li><a class="dropdown-item" href="http://localhost/Marvisur/Consultas/principal3.php">Consulta 3</a></li>
			<li><a class="dropdown-item" href="http://localhost/Marvisur/Consultas/principal4.php">Consulta 4</a></li>
			<li><a class="dropdown-item" href="http://localhost/Marvisur/Consultas/principal5.php">Consulta 5</a></li>
			<li><a class="dropdown-item" href="http://localhost/Marvisur/Consultas/principal6.php">Consulta 6</a></li>
			<li><a class="dropdown-item" href="http://localhost/Marvisur/Consultas/principal7.php">Consulta 7</a></li>
			<li><a class="dropdown-item" href="http://localhost/Marvisur/Consultas/principal8.php">Consulta 8</a></li>
			<li><a class="dropdown-item" href="http://localhost/Marvisur/Consultas/principal8.php">Consulta 9</a></li>
			<li><a class="dropdown-item" href="http://localhost/Marvisur/Consultas/principal8.php">Consulta 10</a></li>
          </ul>
        </li> 		     
      </ul>
    </div>
  </div>
</nav>
<center>
<table class="table table-striped table-hover">

<tr><td colspan="17"><label>Consulta 7: Información del vehículo que tiene asignado un conductor. En la Figura 38 se muestra el nombre de un conductor,
junto con la placa y marca del vehículo que tiene asignado. Para realizar la consulta se utilizaron los campos nombre_cond de
la tabla Conductor, placa y marca de la tabla Vehículo, se unieron ambas tablas con el uso de la tabla Ruta, mediante el uso de
los campos licencia y placa, respectivamente. Se utilizó el comando WHERE para especificar el nombre del conductor, del cual
buscamos dicha información.
<br><br>

 </label></td></tr>

 <tr>
    <td><label>Nombre Conductor: </label></td>
    <td><label>Placa: </label></td>
    <td><label>Marca: </label></td>
</tr>

<?php 
    $sql="call sp_vehiculo_filtro_conductor;
	";
    $result=mysqli_query($conn,$sql);

while($mostrar=mysqli_fetch_array($result))
{
?>
<tr> 
	<td><?php echo $mostrar['nombre_cond'] ?>
    <td><?php echo $mostrar['placa'] ?>
    <td><?php echo $mostrar['marca'] ?>


</tr>
<?php
}

?>

</table>
</form>
</center>
</body>
</html>