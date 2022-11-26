<?php

include("conexion.php");
$CodigoDestinatario = $_POST["Co_De"];
$NombreDestinatario = $_POST['No_De'];
$TelefonoDestinatario = $_POST['Te_De'];


if($_SERVER['REQUEST_METHOD'] == "POST" and isset( $_POST['limpiardatosDest']))
{
	header("Location: principalDest.php");
}

if($_SERVER['REQUEST_METHOD'] == "POST" and isset( $_POST['grabardatosDest']))

{
$sqlgrabar = "CALL sp_insert_destinatario ('$CodigoDestinatario', '$NombreDestinatario', '$TelefonoDestinatario')";
if(mysqli_query($conn,$sqlgrabar))
{
	header("Location: principalDest.php");
}else 
{
	echo "Error: " .$sql."<br>".mysql_error($conn);
}
		
		
	}
	
	if($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['modificardatosDest']))
	
	{
	$sqlmodificar = "CALL sp_update_destinatario ('$CodigoDestinatario', '$NombreDestinatario', '$TelefonoDestinatario')";
if(mysqli_query($conn,$sqlmodificar))
{
	header("Location: principalDest.php");
}else 
{
	echo "Error: " .$sql."<br>".mysql_error($conn);
}
		
		
	}
	
	if($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['eliminardatosDest']))
	
	{
			$sqleliminar = "CALL sp_delete_destinatario ('$CodigoDestinatario')";

if(mysqli_query($conn,$sqleliminar))
{
	header("Location: principalDest.php");
}else 
{
	echo "Error: " .$sql."<br>".mysql_error($conn);
}
		
		
	}

?>