<?php 
class ViewDirectory{

	public $controller_path;
	public $controllers = array();
	public $no_tomados;
	public $metodos_no_tomados;

	public function __construct(){
		$this->controller_path = APP_PATH."controllers/";
		//no se toman en cuenta
		$this->no_tomados = array("index_controller.php","pages_controller.php");
		$this->metodos_no_tomados = array("before_filter","__construct","k_callback");
	}

	public function leerControllers(){

		$directorio = opendir($this->controller_path); //ruta actual

		while ($archivo = readdir($directorio)) //obtenemos un archivo y luego otro sucesivamente
		{
		    if (!is_dir($archivo))//verificamos si es o no un directorio
		    {
		    	if (!in_array($archivo, $this->no_tomados)) {
		    		$archivo = explode(".php", $archivo);
		    		array_push($this->controllers, $archivo[0]);
		    	}
		    }
		}
		return $this->controllers;
	}
	public function getControllerYMetodo(){
		$this->leerControllers();
		for ($i=0; $i < count($this->controllers) ; $i++) { 
			$controlador = explode("_", $this->controllers[$i]);
			$claseControlador = ucfirst($controlador[0])."Controller";
			include_once($this->controller_path.$controlador[0]."_controller.php");
			$metodos = get_class_methods($claseControlador);
			for ($j=0; $j <count($metodos) ; $j++) { 
				$lo_que_busco = $controlador[0]."/".$metodos[$j];
				if (!in_array($metodos[$j], $this->metodos_no_tomados)) {
					$controller_metodo[] = $lo_que_busco;
				}
			}

		}
		return $controller_metodo;
	}
}

 ?>