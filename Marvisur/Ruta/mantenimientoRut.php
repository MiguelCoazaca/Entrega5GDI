<?php

include("conexion.php");

//$cod =  $_POST["txtcodigo"];
//$edad =  $_POST["txtedad"];
//$nom =  $_POST["txtnombre"];
//$tel =  $_POST["txttelefono"];
$placa = $_POST["txtplaca"];
$lic = $_POST['lc'];
$codRem = $_POST['codRem'];
$codDest = $_POST['codDest'];
$codEnc = $_POST['codEnc'];
$codRuta = $_POST['codRut'];
$codFlete = $_POST['codFlet'];
$depSal = $_POST['depSal'];
$proSal = $_POST['provSal'];
$distSal = $_POST['distSal'];
$domSal = $_POST['domSal'];
$depLleg = $_POST['depLleg'];
$proLleg = $_POST['provLleg'];
$distLleg = $_POST['distLleg']; 
$domLleg = $_POST['domLleg'];
$valFlete = $_POST['valFlet'];

	if($_SERVER['REQUEST_METHOD'] == "POST" and isset( $_POST['limpiardatos']))
	{
		header("Location: principalRut.php");
	}

if($_SERVER['REQUEST_METHOD'] == "POST" and isset( $_POST['grabardatos']))
	
	{
    $sqlgrabar = "CALL sp_insert_guia_rem ('$placa', '$lic', '$codRem', '$codDest', '$codEnc', '$codRuta', '$codFlete', '$depSal', '$proSal', '$distSal', '$domSal', '$depLleg', '$proLleg', '$distLleg', '$domLleg', '$valFlete')";
	//$sqlgrabar = "INSERT INTO clientes(codigo, nombre, edad, telefono) values ('$cod','$nom','$edad','$tel')";

if(mysqli_query($conn,$sqlgrabar))
{
	header("Location: principalRut.php");
}else 
{
	echo "Error: " .$sql."<br>".mysql_error($conn);
}
		
		
	}
	
	if($_SERVER['REQUEST_METHOD'] == "POST" and isset( $_POST['modificardatos']))
	
	{
			$sqlmodificar = "UPDATE clientes SET nombre='$nom',edad='$edad',telefono='$tel' WHERE codigo=$cod";

if(mysqli_query($conn,$sqlmodificar))
{
	header("Location: principalRut.php");
}else 
{
	echo "Error: " .$sql."<br>".mysql_error($conn);
}
		
		
	}
	
	if($_SERVER['REQUEST_METHOD'] == "POST" and isset( $_POST['eliminardatos']))
	
	{
			$sqleliminar = "DELETE FROM clientes WHERE codigo=$cod";

if(mysqli_query($conn,$sqleliminar))
{
	header("Location: principalRut.php");
}else 
{
	echo "Error: " .$sql."<br>".mysql_error($conn);
}
		
		
	}

?>