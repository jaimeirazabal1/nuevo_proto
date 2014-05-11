<?php 
Load::models("usuario","permiso");
class UsuarioController extends AppController{
	public function login(){
		if (Input::haspost("usuario")) {
			$user = new Usuario();
			$usuario = Input::post("usuario");
			$user->autenticar($usuario["nombre_usuario"],$usuario["password"]);
		}
	}
	public function lista(){
		$user = new Usuario();
		$this->usuarios = $user->getUsuarios();
	}
	public function logout(){
		Auth::destroy_identity();
		Router::toAction("login");
	}
	public function eliminar($user_id = null){
		if ($user_id) {
			$user = new Usuario();
			if ($user->delete($user_id)) {
				Flash::valid("Usuario Eliminado");
				if (!Input::isAjax()) {
					Router::toAction("lista");
				}
			}
		}
	}
	public function nuevo(){
		if (Input::haspost("usuario")) {
			$user = new Usuario();
			$usuario = Input::post("usuario");
			if ($user->crearNuevo($usuario['nombre_usuario'],$usuario['password'],isset($usuario['admin']))) {
				Flash::valid("Usuario Creado");
			}else{
				Flash::error("Usuario No Creado");
			}
		}
	}
	public function menus(){
		
	}
	public function before_filter(){
		if (Input::isAjax()) {
			View::select(null,null);
		}
	}
}

?>