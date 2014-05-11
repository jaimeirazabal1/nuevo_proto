<?php 
class Controlador extends ActiveRecord{
	public function actualizar(){
		Load::lib("view_directory");
		$dir = new ViewDirectory();
		$controladores = $dir->getControllerYMetodo();
		for ($i=0; $i < count($controladores) ; $i++) { 
			if (!$this->contradorExiste($controladores[$i])) {
				$c = new Controlador();
				$c->controlador = $controladores[$i];
				if (!$c->save()) {
					Flash::error("Fallo la insercion del controlador ".$controladores[$i]);
				}
			}
		}
		Flash::info("Proceso Realizado");
	}
	public function contradorExiste($c){
		if ($this->count("conditions: controlador = '$c'")) {
			return true;
		}else{
			return false;
		}
	}
	public function getControladores(){
		return $this->find();
	}
	public function getControladorByControlador($name){
		return $this->find_first("conditions: controlador = '$name'");
	}
}

 ?>