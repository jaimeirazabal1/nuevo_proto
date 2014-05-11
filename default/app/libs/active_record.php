<?php
/**
 * @see KumbiaActiveRecord
 */
Load::coreLib('kumbia_active_record');

/**
 * ActiveRecord
 *
 * Clase padre ActiveRecord para añadir tus métodos propios
 *
 * @category Kumbia
 * @package Db
 * @subpackage ActiveRecord
 */
class ActiveRecord extends KumbiaActiveRecord
{
	public function ultimo_id(){
		$id = $this->find("columns: id","limit: 1","order: id desc");
		if ($id) {
			return $id[0]->id;
		}else{
			return false;
		}
	}
}
