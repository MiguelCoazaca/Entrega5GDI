<?php

include("conexion.php");


$CodigoEncomida = $_POST["CODENCO"];
$DescripcionEnc = $_POST['DESCRIENCO'];
$CantidadEnco = $_POST['CANTENCO'];
$Unidad_Medida_Enco = $_POST['UNIDADENCO'];
$Peso_Enco = $_POST['PESOENCO'];
$Unidad_Peso_Enco = $_POST['UNIDAPESOENCO'];
$CodigoDestEnco = $_POST['CODDESTENCO'];
$CodigoRemEnco = $_POST['CODREMENCO'];
$CodigoRutaEnco = $_POST['CODRUTENCO'];


	if($_SERVER['REQUEST_METHOD'] == "POST" and isset( $_POST['limpiardatosEnc']))
	{
		header("Location: principalEnc.php");
	}

if($_SERVER['REQUEST_METHOD'] == "POST" and isset( $_POST['grabardatosEnc']))
	
	{
    $sqlgrabar = "CALL sp_insert_encomienda ('$CodigoEncomida', '$DescripcionEnc', '$CantidadEnco', '$Unidad_Medida_Enco','$Peso_Enco', '$Unidad_Peso_Enco', '$CodigoDestEnco', '$CodigoRemEnco', '$CodigoRutaEnco')";
	
	if(mysqli_query($conn,$sqlgrabar))
	{
		header("Location: principalEnc.php");
	}else 
	{
		echo "Error: " .$sql."<br>".mysql_error($conn);
	}
			
			
		}
		
		if($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['modificardatosEnc']))
		
		{
		$sqlmodificar = "CALL sp_update_encomienda ('$CodigoEncomida', '$DescripcionEnc', '$CantidadEnco', '$Unidad_Medida_Enco','$Peso_Enco', '$Unidad_Peso_Enco', '$CodigoDestEnco', '$CodigoRemEnco', '$CodigoRutaEnco')";
	if(mysqli_query($conn,$sqlmodificar))
	{
		header("Location: principalEnc.php");
	}else 
	{
		echo "Error: " .$sql."<br>".mysql_error($conn);
	}
			
			
		}
		
		if($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['eliminardatosEnc']))
		
		{
				$sqleliminar = "CALL sp_delete_encomienda ('$CodigoEncomida')";
	
	if(mysqli_query($conn,$sqleliminar))
	{
		header("Location: principalEnc.php");
	}else 
	{
		echo "Error: " .$sql."<br>".mysql_error($conn);
	}
			
			
		}
	
	?>