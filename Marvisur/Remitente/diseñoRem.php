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
<form name="Mantenimiento" action="mantenimientoRem.php" method="post">
<table class="table table-striped table-hover">

<tr>

<td colspan="4"align="center"><label>Remitente</label></td>
</tr>

<tr><td colspan="4"align="center"><label>Registrar Nuevo Remitente </label></td></tr>
<tr>
	<td><label>Cod. Remitente</label></td><td><input type="Char" value=" " maxlength="11" name="Co_Re" maxlength="40" size="11"></td>




	
</tr>
<tr>


	<td><label>Nombre Remitente</label></td><td><input type="Varchar" value="" maxlength="30" name="No_Re" maxlength="40" size="30"></td>


	
</tr>
<tr>

	<td><label>Teléfono Remitente</label></td><td><input type="char" value="" maxlength="9" name="Te_Re" maxlength="40" size="9"></td>
	
</tr>

<tr><td colspan="4" align="center">
<input type="submit" value="Limpiar" name="limpiardatosRem" >
<input type="submit" value="Ingresar" name="grabardatosRem" >
<input type="submit" value="Modificar" name="modificardatosRem" >
<input type="submit" value="Eliminar" name="eliminardatosRem">
</td>
</tr>

<tr><td colspan="4"><label>Listado de Remitentes </label></td></tr>

<tr>
	<td><label>Código Remitente</label></td>
	<td><label>Nombre</label></td>
	<td><label>Teléfono</label></td>
</tr>


<?php 
    $sql="call sp_select_remitente";
    $result=mysqli_query($conn,$sql);

while($mostrar=mysqli_fetch_array($result))
{
?>
<tr> 
	<td><?php echo $mostrar['codigo_rem'] ?>
	<td><?php echo $mostrar['nombre_rem'] ?>
	<td><?php echo $mostrar['telf_rem'] ?>


</tr>
<?php
}

?>

</table>
</form>
</center>
</body>
</html>