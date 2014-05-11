<?php
/**
 * @see Controller nuevo controller
 */
require_once CORE_PATH . 'kumbia/controller.php';

/**
 * Controlador principal que heredan los controladores
 *
 * Todas las controladores heredan de esta clase en un nivel superior
 * por lo tanto los metodos aqui definidos estan disponibles para
 * cualquier controlador.
 *
 * @category Kumbia
 * @package Controller
 */
class AppController extends Controller
{

    final protected function initialize()
    {
    	$url_sin_autenticacion = array("usuario/login","usuario/logout");

    	$controller = Router::get("controller");
    	$action = Router::get("action");

    	$url = $controller."/".$action;
        if (Auth::is_valid()) {
            $user_permisos = Load::model("permiso")->getPermisosInArray(Auth::get("id"));
        }
        //si usuario no esta autenticado y url no esta en url para personas sin autenticacion
    	if (!Auth::is_valid() and !in_array($url, $url_sin_autenticacion)) {
            Flash::warning("Permiso Denegado!");
    		Router::redirect("usuario/login");
    	}
        //si usuario esta autenticado y url no esta en el arreglo de sus permisos
        if (Auth::is_valid() and !in_array($url, $user_permisos)) {
            Flash::warning("Permiso Denegado!");
            Router::redirect("usuario/menus");
        }
    }

    final protected function finalize()
    {
        
    }

}
