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
<form name="Mantenimiento" action="mantenimientoDest.php" method="post">

<table class="table table-striped table-hover">

<tr>


<td colspan="10"align="center"><label>Encomienda</label></td>
</tr>

<tr><td colspan="10"align="center"><label>Registrar Nueva Encomienda </label></td></tr>
<tr>
	<td><label>Codigo Encomienda</label></td><td><input type="INT" value=" " maxlength="9" name="CODENCO" maxlength="40" size="10"></td>
	<td><label>Descripcion</label></td><td><input type="varchar" value="" maxlength="45" name="DESCRIENCO" maxlength="40" size="20"></td>
	<td><label>Cantidad</label></td><td><input type="9" value=" " maxlength="9" name="CANTENCO" maxlength="40" size="10"></td>
	<td><label>Unidad Medida</label></td><td><input type="char" value="" maxlength="15" name="UNIDADENCO" maxlength="40" size="10"></td>
	<td><label>Peso</label></td><td><input type="Float" value=" " maxlength="7" name="PESOENCO" maxlength="40" size="10"></td>
	
</tr>

<tr>

	<td><label>Unidad Peso</label></td><td><input type="CHAR" value=" " maxlength="15" name="UNIDAPESOENCO" maxlength="40" size="10"></td>
	<td><label>Codigo Destinatario</label></td><td><input type="Char" value=" " maxlength="11" name="CODDESTENCO" maxlength="40" size="10"></td>
	<td><label>Codigo Remitente</label></td><td><input type="Char" value=" " maxlength="11" name="CODREMENCO" maxlength="40" size="10"></td>
	<td><label>Codigo Ruta</label></td><td><input type="INT" value=" " maxlength="9" name="CODRUTENCO" maxlength="40" size="10"></td>

</tr>

<tr><td colspan="4" align="center">
<input type="submit" value="Limpiar" name="limpiardatosEnc" >
<input type="submit" value="Ingresar" name="grabardatosEnc" >
<input type="submit" value="Modificar" name="modificardatosEnc" >
<input type="submit" value="Eliminar" name="eliminardatosEnc">
</td>
</tr>

<tr><td colspan="10"><label>Listado de Encomiendas </label></td></tr>
<tr>
	<td><label>Codigo</label></td>
	<td><label>Descripcion</label></td>
	<td><label>Cantidad</label></td>
	<td><label>Unidad Medida</label></td>
	<td><label>Peso</label></td>
	<td><label>Unidad Peso</label></td>
	<td><label>Codigo Destinatario</label></td>
	<td><label>Codigo Remitente</label></td>
	<td><label>Codigo Ruta</label></td>
</tr>


<?php 
    $sql="CALL sp_select_encomienda";
    $result=mysqli_query($conn,$sql);

while($mostrar=mysqli_fetch_array($result))
{
?>
<tr> 
	<td><?php echo $mostrar['codigo_enc'] ?>
	<td><?php echo $mostrar['descripcion'] ?>
	<td><?php echo $mostrar['cantidad'] ?>
	<td><?php echo $mostrar['unidad_medida'] ?>
	<td><?php echo $mostrar['peso'] ?>
	<td><?php echo $mostrar['unidad_peso'] ?>
	<td><?php echo $mostrar['codigo_dest'] ?>
	<td><?php echo $mostrar['codigo_rem'] ?>
	<td><?php echo $mostrar['codigo_ruta'] ?>


</tr>
<?php
}

?>

</table>
</form>
</center>
</body>
</html>