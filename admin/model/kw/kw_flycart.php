<?php
class ModelKwKwFlycart extends Model {

	public function install() {
		$sql = "
			CREATE TABLE IF NOT EXISTS `kw_flycart_presets` (
				`preset_id` int(11) NOT NULL AUTO_INCREMENT,
				`preset_name` varchar(32) DEFAULT NULL,
				`preview` text,
				`preset` text,
				`dump` text,
				PRIMARY KEY (`preset_id`)
			) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;";			
		$this->db->query($sql);
		$this->installDefaultPresets();
	}

	private function installDefaultPresets() {
		$filepath = "../kw_application/flycart/install/kw_flycart_presets.sql";

		if ( file_exists($filepath) )
		{
			$this->db->query(file_get_contents($filepath));
		}
	}

	public function uninstall() {
		$sql = 'DROP TABLE IF EXISTS `kw_flycart_presets`';
		$this->db->query($sql);
	}

	public function addPreset($preset_name, $preview, $preset) {
		$this->db->query("INSERT INTO `kw_flycart_presets` SET 
			`preset_name` = '" . $this->db->escape($preset_name) . "',
			`preview` = '" . $this->db->escape($preview) . "',
			`preset` = '" . $this->db->escape(base64_encode(serialize($preset))) . "',
			`dump` = '" . $this->db->escape(base64_encode(serialize($preset))) . "'");
	}
	
	public function savePreset($preset_id, $preset) {
		$this->db->query("UPDATE `kw_flycart_presets` SET `preset` = '" . $this->db->escape(base64_encode(serialize($preset))) . "' WHERE `preset_id` = '" . $this->db->escape((int)$preset_id) . "'");
		return $this->getPresets();
	}	
	
	public function getPresets() {
		$presets = array();
		$query = $this->db->query("SELECT * FROM `kw_flycart_presets` ORDER BY preset_id");
		
		foreach ($query->rows as $result) {
			$presets[] = array(
				'preset'		  => unserialize(base64_decode($result['preset'])),
				'preset_name' => $result['preset_name'],
				'preview' 		=> $result['preview'],
				'preset_id' 	=> $result['preset_id']
			);
		}

		return $presets;
	}
	
	public function addFromPreset($preset_name, $class, $preset_id) {
		$preset = $this->db->query("SELECT `preset` FROM `kw_flycart_presets` WHERE `preset_id` = '" . $this->db->escape((int)$preset_id) . "'");
		
		$this->addPreset($preset_name, $class, unserialize(base64_decode($preset->rows[0]['preset'])));

		return $this->getPresets();
	}

	public function deletePreset($preset_id) {
		$this->db->query("DELETE FROM `kw_flycart_presets` WHERE `preset_id` = '" . $this->db->escape((int)$preset_id) . "'");
	}
	
	public function resetPreset($preset_id) {
		$this->db->query("UPDATE `kw_flycart_presets` SET `preset` = `dump` WHERE `preset_id` = '" . $this->db->escape((int)$preset_id) . "'");

		return $this->getPresets();
	}
	
	public function installPreset($sql) {
		if ( file_exists($sql) )
		{
			$this->db->query(file_get_contents($sql));
		}
	}

	public function exportTools($preset_ids) {
		$output = '';

		$query = $this->db->query("SELECT * FROM `kw_flycart_presets`");

		foreach ($preset_ids as $preset_id) {
			foreach ($query->rows as $result) {
				if ($result['preset_id'] === $preset_id) {
					$fields = '';

					foreach (array_keys($result) as $value) {
						$fields .= '`' . $value . '`, ';
					}

					$values = '';

					$result['preset_id'] = NULL;

					foreach (array_values($result) as $value) {
						$value = str_replace(array("\x00", "\x0a", "\x0d", "\x1a"), array('\0', '\n', '\r', '\Z'), $value);
						$value = str_replace(array("\n", "\r", "\t"), array('\n', '\r', '\t'), $value);
						$value = str_replace('\\', '\\\\', $value);
						$value = str_replace('\'', '\\\'', $value);
						$value = str_replace('\\\n', '\n', $value);
						$value = str_replace('\\\r', '\r', $value);
						$value = str_replace('\\\t', '\t', $value);

						$values .= '\'' . $value . '\', ';
					}

					$output .= 'INSERT INTO `kw_flycart_presets` (' . preg_replace('/, $/', '', $fields) . ') VALUES (' . preg_replace('/, $/', '', $values) . ');' . "\n";
				}
			}
		}

		return $output;
	}

	public function importTools($sql) {
		if ( file_exists($sql) )
		{
			$this->db->query(file_get_contents($sql));
		}

		return $this->getPresets();
	}
}	
?>