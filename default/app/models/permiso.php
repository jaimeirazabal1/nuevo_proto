<?php 
class Permiso extends ActiveRecord{

	public function getPermisos($user_id){
		//return $this->find("conditions: usuario_id = '$user_id'");
		return $this->find_all_by_sql(
"SELECT 
  controlador.controlador, 
  permiso.titulo, 
  permiso.hidden, 
  permiso.activo
FROM 
  public.permiso, 
  public.controlador
WHERE 
  controlador.id = permiso.controlador_id AND 
  permiso.usuario_id = '$user_id'");
	}

	public function getPermisosInArray($user_id){
		$p = $this->getPermisos($user_id);
		foreach ($p as $key => $value) {
			if ($value->activo) {
				$array[] = $value->controlador;
			}
		}
		return $array;
	}
	public function buscarEnPermisos($permisos,$controllers){
		foreach ($permisos as $key => $value) {
			if (in_array($value->url, $controllers)) {
				return $value->id;
			}
		}
		return false;
	}

	public function tienePermiso($controlador_id,$user_id){
		return $this->find_first("conditions: controlador_id ='$controlador_id' and usuario_id = '$user_id'");
	}
	public function guardarPermisos($post_permisos,$user_id){
		//Util::pre($post_permisos);

		foreach ($post_permisos as $key => $value) {
			$permiso = $this->find_first("conditions: controlador_id = '$key' and usuario_id='$user_id'");
			//Util::pre(json_decode(json_encode($permiso)));
				if (!empty($permiso)) {
					$permiso->titulo = $value['titulo'];
					if (isset($value['hidden'])) {
						$permiso->hidden = $value['hidden'];
					}else{
						$permiso->hidden = 0;
					}
					if (isset($value['activo'])) {
						$permiso->activo = $value['activo'];
					}else{
						$permiso->activo = 0;
					}
					if (isset($_POST['permiso_todos']['todos'])) {
						$permiso->activo = 1;
					}
					if (!$permiso->update()) {
						Flash::error("Error guardando el permiso del controlador con id: ".$key);
					}
				}else{
					$nuevo_permiso = new Permiso();
					$nuevo_permiso->titulo = $value['titulo'];
					$nuevo_permiso->usuario_id = $user_id;
					if (isset($value['hidden'])) {
						$nuevo_permiso->hidden = $value['hidden'];
					}else{
						$nuevo_permiso->hidden = 0;
					}
					if (isset($value['activo'])) {
						$nuevo_permiso->activo = $value['activo'];
					}else{
						$nuevo_permiso->activo = 0;
					}
					if (isset($_POST['permiso_todos']['todos'])) {
						$nuevo_permiso->activo = 1;
					}
					$nuevo_permiso->controlador_id = $key;
					if (!$nuevo_permiso->save()) {
						Flash::error("Error guardando el permiso del controlador con id: ".$key);
					}
				}
			}
		Flash::info("Proceso Terminado");
		}

	public function asignarPermisosPorDefecto($user_id){
		$permiso = new Permiso();
		$permiso->titulo = "Salir del Sistema";
		$permiso->hidden = 0;
		$permiso->usuario_id = $user_id;
		$permiso->activo = 1;
		$permiso->controlador_id = Load::model("controlador")->getControladorByControlador("usuario/logout")->id;
		if (!$permiso->save()) {
			Flash::error("Error guardando el permiso ".$permiso->titulo);
		}
		$permiso = new Permiso();
		$permiso->titulo = "Principal";
		$permiso->hidden = 0;
		$permiso->usuario_id = $user_id;
		$permiso->activo = 1;
		$permiso->controlador_id = Load::model("controlador")->getControladorByControlador("usuario/menus")->id;
		if (!$permiso->save()) {
			Flash::error("Error guardando el permiso ".$permiso->titulo);
		}
	}
}


?>