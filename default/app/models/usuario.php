<?php 
class Usuario extends ActiveRecord{
	protected function initialize(){
    	$this->validates_uniqueness_of("nombre_usuario");
   	}
	public function autenticar($nombre_usuario,$password){
		if (!$nombre_usuario) {
			Flash::error("El campo 'Nombre De Usuario' no puede ser Vacio");
			return false;
		}
		if (!$password) {
			Flash::error("El campo 'Contraseña' no puede ser Vacia");
			return false;
		}
		$password = md5($password);
		$auth = new Auth("model", "class: usuario", "nombre_usuario: $nombre_usuario", "password: $password");
        if ($auth->authenticate()) {
        	echo "<script>location.href='menus'</script>";
        } else {
        	Flash::error("Nombre de usuario o Contraseña Incorrectos");
            return false;
        }
	}
	public function getUsuarios(){
		return $this->find();
	}
	public function crearNuevo($nombre_usuario,$password,$admin){
		$password = md5($password);
		$user = new Usuario();
		$user->nombre_usuario = $nombre_usuario;
		$user->password = $password;
		$user->admin = $admin ? $admin : 0;
		$user->created = date("d-m-y H:i:s");
		if ($user->save()) {
			$ultimo_id = $this->ultimo_id();
			Load::model("permiso")->asignarPermisosPorDefecto($ultimo_id);
			return true;
		}else{
			return false;
		}
	}
	public function getMenuHtml($classli = null){
		if (Auth::is_valid()) {
			$permiso = Load::model("permiso")->getPermisos(Auth::get("id"));
			foreach ($permiso as $key => $value) {
				if ($value->activo and !$value->hidden and $value->titulo) {
					if ($value->controlador == "usuario/logout") {
						$array[] = "<li class='".$classli."'>".Html::link($value->controlador,$value->titulo)."</li>";
					}else{

						$array[] = "<li class='".$classli."'>".Html::link($value->controlador,$value->titulo)."</li>";
					}
				}else{
					if ($value->activo and !$value->hidden) {
						$array[] = "<li class='".$classli."'>".Html::link($value->controlador,$value->controlador)."</li>";
					}
				}
			}
			if (isset($array)) {
				# code...
				return implode("\n", $array);
			}
			Flash::info("Usuario Sin Menus");
			return false;
		}
	}
}


 ?>