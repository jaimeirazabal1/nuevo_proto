<?php 
Load::models("permiso","controlador");
class PermisoController extends AppController{

	public function ver_permisos($user_id = null){
		if ($user_id) {
			$this->permiso = new Permiso();
			$controladores = new Controlador();
			$this->controladores = $controladores->getControladores();
			$this->user_id = $user_id;
			if (Input::haspost("permiso")) {
				$this->permiso->guardarPermisos(Input::post("permiso"),$user_id);
			}
		}
	}

}

 ?>