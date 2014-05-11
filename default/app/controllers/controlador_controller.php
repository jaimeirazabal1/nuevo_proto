<?php 
Load::models("controlador");
class ControladorController extends AppController{
	public function actualizar(){
		View::select(null,null);
		$c = new Controlador();
		$c->actualizar();
	}
}

 ?>