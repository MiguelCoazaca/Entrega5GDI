<?php

include("conexion.php");


$CodigoRemitente = $_POST["Co_Re"];
$NombreRemitente = $_POST['No_Re'];
$TelefonoRemitente = $_POST['Te_Re'];


if($_SERVER['REQUEST_METHOD'] == "POST" and isset( $_POST['limpiardatosRem']))
{
	header("Location: principalRem.php");
}

if($_SERVER['REQUEST_METHOD'] == "POST" and isset( $_POST['grabardatosRem']))

{
$sqlgrabar = "CALL sp_insert_remitente ('$CodigoRemitente', '$NombreRemitente', '$TelefonoRemitente')";
if(mysqli_query($conn,$sqlgrabar))
{
	header("Location: principalRem.php");
}else 
{
	echo "Error: " .$sql."<br>".mysql_error($conn);
}
		
		
	}
	
	if($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['modificardatosRem']))
	
	{
	$sqlmodificar = "CALL sp_update_remitente ('$CodigoRemitente', '$NombreRemitente', '$TelefonoRemitente')";
if(mysqli_query($conn,$sqlmodificar))
{
	header("Location: principalRem.php");
}else 
{
	echo "Error: " .$sql."<br>".mysql_error($conn);
}
		
		
	}
	
	if($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['eliminardatosRem']))
	
	{
			$sqleliminar = "CALL sp_delete_remitente ('$CodigoRemitente')";

if(mysqli_query($conn,$sqleliminar))
{
	header("Location: principalRem.php");
}else 
{
	echo "Error: " .$sql."<br>".mysql_error($conn);
}
		
		
	}

?>