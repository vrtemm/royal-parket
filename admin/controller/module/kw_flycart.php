<?php
class ControllerModuleKwFlyCart extends Controller {
	private $error = array();

	public function index() 
	{

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$data['base'] = HTTPS_CATALOG;
		} else {
			$data['base'] = HTTP_CATALOG;
		}

		$this->load->language('module/kw_flycart');

		$this->document->setTitle($this->language->get('common_title'));
		
		/** css **/
		$this->document->addStyle($data['base'] . 'kw_application/flycart/admin/assets/styles/template.css');
		$this->document->addStyle('http://fonts.googleapis.com/css?family=PT+Sans&subset=latin,cyrillic');
		$this->document->addStyle('http://fonts.googleapis.com/css?family=Open+Sans:400,600&subset=latin,cyrillic');

		$breadcrumbs = array();

		$breadcrumbs[] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$breadcrumbs[] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => true
		);

		$breadcrumbs[] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/account', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => true
		);

		$this->load->model('setting/setting');
		$this->load->model('kw/kw_flycart');

		$token 	 = $this->session->data['token'];
		$presets = $this->model_kw_kw_flycart->getPresets();
		$languages = $this->load->language('module/kw_flycart');
		$lang_id = $this->config->get('config_language_id');
		$cancel = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		/** js consts **/
		$data['vars'] = json_encode(array(
			'token'     		=> $token,
			'name'					=> 'kw_flycart',
			'presets'				=> $presets,
			'language'      => $languages,
			'cancel'        => $cancel,
			'breadcrumbs'   => $breadcrumbs,
			'lang_id'       => $lang_id
		));


		$this->load->model('tool/image');
		$data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/kw_flycart.tpl', $data));
	}
	
	/* Install/Uninstall Database
	---------------------------------------------------------------------------------------------------------------------------*/	

	public function install() {
		$this->load->model('kw/kw_flycart');
		$this->model_kw_kw_flycart->install();
	}

	public function uninstall() {
		$this->load->model('kw/kw_flycart');
		$this->model_kw_kw_flycart->uninstall();
	}

	/* Add Preset
	---------------------------------------------------------------------------------------------------------------------------*/
	
	public function addFromPreset() 
	{	
		$this->load->language('module/kw_flycart');
		
		$this->load->model('kw/kw_flycart');
		
		if ($this->user->hasPermission('modify', 'module/kw_flycart'))
		{
			$preset_id = isset($this->request->post['preset_id']) ? $this->request->post['preset_id'] : array();
			$preset_name = isset($this->request->post['preset_name']) ? $this->request->post['preset_name'] : '';
			
			$this->model_kw_kw_flycart->addFromPreset($preset_name, 'custom-preset.png', $preset_id);
			$presets = $this->model_kw_kw_flycart->getPresets();
			
			$status = 'success';
			$message = '';
		} 
		else {
			$status = 'error';
			$message = $this->language->get('error_permission');
			$presets = null;
		}
		
		$this->response->setOutput(json_encode(array(
			'status'    => $status,
			'message'   => $message,
			'presets'    => $presets
		)));
	}
	
	/* Add Preset
	---------------------------------------------------------------------------------------------------------------------------*/
	
	public function addPreset() 
	{	
		$this->load->language('module/kw_flycart');
		
		$this->load->model('kw/kw_flycart');
		
		if ($this->user->hasPermission('modify', 'module/kw_flycart'))
		{
			$preset = isset($this->request->post['preset']) ? $this->request->post['preset'] : array();
			
			$preset_name = isset($this->request->post['preset_name']) ? $this->request->post['preset_name'] : '';
			
			$this->model_kw_kw_flycart->addPreset($preset_name, 'custom-preset.png', $preset);
			
			$presets = $this->model_kw_kw_flycart->getPresets();
			
			$status = 'success';
			$message = '';
		} 
		else {
			$status = 'error';
			$message = $this->language->get('error_permission');
			$presets = null;
		}
		
		$this->response->setOutput(json_encode(array(
			'status'    => $status,
			'message'   => $message,
			'presets'   => $presets
		)));
	}
	
	/* Save Preset
	---------------------------------------------------------------------------------------------------------------------------*/
	
	public function savePreset() 
	{	
		$this->load->language('module/kw_flycart');
		
		$this->load->model('kw/kw_flycart');
		
		if ($this->user->hasPermission('modify', 'module/kw_flycart'))
		{
			$preset_id = isset($this->request->post['preset_id']) ? $this->request->post['preset_id'] : 0;
			$preset = isset($this->request->post['preset']) ? $this->request->post['preset'] : array();
			
			$presets = $this->model_kw_kw_flycart->savePreset($preset_id, $preset);

			$status = 'success';
			$message = '';
		} 
		else {
			$status = 'error';
			$message = $this->language->get('error_permission');
			$presets = null;
		}
		
		$this->response->setOutput(json_encode(array(
			'status'    => $status,
			'message'   => $message,
			'presets'   => $presets
		)));
	}
	
	/* Delete Preset
	---------------------------------------------------------------------------------------------------------------------------*/
	
	public function deletePreset() 
	{
		$this->load->language('module/kw_flycart');
		
		$this->load->model('kw/kw_flycart');
		
		if ($this->user->hasPermission('modify', 'module/kw_flycart'))
		{	
			$preset_id = isset($this->request->post['preset_id']) ? $this->request->post['preset_id'] : 0;

			$this->model_kw_kw_flycart->deletePreset($preset_id);
			
			$presets = $this->model_kw_kw_flycart->getPresets();
			
			$status = 'success';
			$message = '';
		} 
		else {
			$status = 'error';
			$message = $this->language->get('error_permission');
			$presets = null;
		}
		
		$this->response->setOutput(json_encode(array(
			'status'    => $status,
			'message'   => $message,
			'presets'   => $presets
		)));
	}

	/* Export Tools
	---------------------------------------------------------------------------------------------------------------------------*/

	public function exportTools()
	{
		$this->load->language('module/kw_flycart');

		if ($this->user->hasPermission('modify', 'module/kw_flycart'))
		{
			$this->load->model('kw/kw_flycart');
			$this->response->setOutput($this->model_kw_kw_flycart->exportTools($this->request->post['preset_ids']));
		}
		else {
			$this->response->setOutput(json_encode(array(
				'status'    => 'error',
				'message'   => $this->language->get('error_permission')
			)));
		}
	}

	/* Import Tools
	---------------------------------------------------------------------------------------------------------------------------*/

	public function importTools()
	{

		$this->load->language('module/kw_flycart');

		if($this->user->hasPermission('modify', 'module/kw_flycart'))
		{
			$name = $_FILES['import']['name'];
			$file_ext = strrchr(basename($name), '.');
			$filetypes = array('.sql');

			if(!in_array($file_ext, $filetypes))
			{
				$message = 'error';
			}
			else {
				if(move_uploaded_file($_FILES['import']['tmp_name'], '../kw_application/flycart/tmp/' . $name))
				{
					$status = 'success';
					$message = $this->language->get('success_import');
					$this->load->model('kw/kw_flycart');
					$presets = $this->model_kw_kw_flycart->importTools('../kw_application/flycart/tmp/' . $name);
					$this->clear_dir('../kw_application/flycart/tmp/');
				}
				else {
					$message = 'error';
				}
			}
		}
		else {
			$status = 'error';
			$message = $this->language->get('error_permission');
			$presets = null;
		}

		$this->response->setOutput(json_encode(array(
			'status'    => $status,
			'message'   => $message,
			'presets'   => $presets
		)));

	}
	
	/* Reset Preset
	---------------------------------------------------------------------------------------------------------------------------*/
	
	public function resetPreset() 
	{
		$this->load->language('module/kw_flycart');
		
		$this->load->model('kw/kw_flycart');
		
		if ($this->user->hasPermission('modify', 'module/kw_flycart'))
		{		
			$preset_id = isset($this->request->post['preset_id']) ? $this->request->post['preset_id'] : 0;

			$preset = $this->model_kw_kw_flycart->resetPreset($preset_id);
			
			$status = 'success';
			$message = $this->language->get('reset_preset_success');
		} 
		else {
			$status = 'error';
			$message = $this->language->get('error_permission');
			$preset = null;
		}
		
		$this->response->setOutput(json_encode(array(
			'status'    => $status,
			'message'   => $message,
			'preset'		=> $preset
		)));
	}
	
	/* Reset All
	---------------------------------------------------------------------------------------------------------------------------*/
	
	public function resetAll() 
	{
		$this->load->language('module/kw_flycart');
		
		$this->load->model('kw/kw_flycart');
		
		if ($this->user->hasPermission('modify', 'module/kw_flycart'))
		{		
			$this->model_kw_kw_flycart->uninstall();
			$this->model_kw_kw_flycart->install();
			
			$presets = $this->model_kw_kw_flycart->getPresets();
			$status = 'success';
			$message = $this->language->get('reset_all_success');
		} 
		else {
			$status = 'error';
			$message = $this->language->get('error_permission');
			$presets = null;
		}
		
		$this->response->setOutput(json_encode(array(
			'status'    => $status,
			'message'   => $message,
			'presets'		=> $presets
		)));
	}
	
	/* Upload Preset
	---------------------------------------------------------------------------------------------------------------------------*/		
	public function uploadPreset() 
	{
		if($this->validate())
		{
			$name = $_FILES['uploadpreset']['name'];
			$file_ext = strrchr(basename($name), '.');
			$file_name = strstr(basename($name), '.', true);

			$url = $this->request->post['url'];			
			$filetypes = array('.zip', '.gzip');

			if(!in_array($file_ext, $filetypes)) 
			{
				$upload = 'error';
			} 
			else {
				if(move_uploaded_file($_FILES['uploadpreset']['tmp_name'], $url . $name)) 
				{
					$zip = new ZipArchive;
					
					if ($zip->open($url . $name) === TRUE) 
					{
						$files = array();

						for ($i = 0; $i < $zip->numFiles; $i++) 
						{
							$filename = $zip->getNameIndex($i);
									$files[] = $filename;
						}
							
						$zip->extractTo($url);
						$zip->close();
						
						$this->installPreset($url, $file_name);
						
						$upload = json_encode($this->model_kw_kw_flycart->getPresets());
					} 
					else {
							$upload = 'error';
					}					
				} 
				else {
					$upload = 'error';
				}
			}			
		} 
		else {
			$upload = 'error';
		}

		$this->response->setOutput($upload);	
	}	
	
	/* Upload Preset
	---------------------------------------------------------------------------------------------------------------------------*/		
	private function installPreset($url, $file_name) 
	{
		$this->load->model('kw/kw_flycart');
		$config = parse_ini_file($url . '/' . $file_name . '/config.ini');

		$this->dircpy($url . $file_name, $config['images'], '../kw_application/flycart/images/');
		$this->model_kw_kw_flycart->installPreset($url . $file_name . '/'. $config['sql']);
		$this->clear_dir('../kw_application/flycart/tmp/');
	}
	
	private function dircpy($url, $images, $path) 
	{
		foreach ( $images as  $image )
		{
 			if ( !is_dir($path) || !is_file($url . '/' . $image) ) { return false; }
			else{ copy($url . '/' . $image, $path . $image); }
		}
	}
	
	private function clear_dir($dir)
	{  
		$list = scandir($dir);
		unset($list[0], $list[1]);
		$list = array_values($list);
		
		foreach ($list as $file)
		{
			if ( is_dir($dir . $file) )
			{
				$this->clear_dir($dir . $file .'/');
				rmdir($dir . $file);
			}
			else {
				unlink($dir . $file);   
			}
		}
	}

	/* Save Settings
	---------------------------------------------------------------------------------------------------------------------------*/		
	public function save() 
	{
		$this->load->language('module/kw_flycart');
		$this->load->model('setting/setting');
		
		if ($this->user->hasPermission('modify', 'module/kw_flycart'))
		{
			$this->session->data['success'] = $this->language->get('save_succes');
			
			$data = isset($this->request->post['data']) ? $this->request->post['data'] : array();

			$preset = isset($this->request->post['preset']) ? $this->request->post['preset'] : array();

			$this->model_setting_setting->editSetting('kw_flycart', array('kw_flycart_status' => $data['status'], 'kw_flycart_tools' => $data));

			$status = 'success';
			$message = $this->language->get('save_succes');
		} 
		else {
			$status = 'error';
			$message = $this->language->get('error_permission');
		}
		
		$this->response->setOutput(json_encode(array(
			'status'    => $status,
			'message'   => $message
		)));
	}	

	/* Load Settinds
	---------------------------------------------------------------------------------------------------------------------------*/	
    public function load()
	{
		$this->load->model('setting/setting');
		$this->load->model('localisation/language');
		
		$languages 	= $this->model_localisation_language->getLanguages();
		$lang_id 		= $this->config->get('config_language_id');
		$tools 			= $this->model_setting_setting->getSetting('kw_flycart');
		
		$this->response->setOutput(json_encode(array(
			'status'    => 'success',
			'languages' => $languages,
			'lang_id'   => $lang_id,
			'tools'   	=> !empty($tools) ? $tools : false
		)));
	}	

	/* Load Image 
	---------------------------------------------------------------------------------------------------------------------------*/		
	public function loadImg()
	{			
		$img = array();
		
		$url = $this->request->post['url'];
		
		if ($handle = opendir($url)) 
		{
			while (false !== ($entry = readdir($handle))) 
			{
				if ($entry != "." && $entry != "..") 
				{	
					$size = getimagesize($url . $entry);
					
					$img[] = array(
						'src'			=> $entry,
						'size'		=> $this->filesize_get($url . $entry),
						'sizexy'	=> $size[0] . ' x ' . $size[1],
						'width'		=> $size[0],
						'height'	=> $size[1],
					);	
				}
			}
			closedir($handle);
		}		
		$this->response->setOutput(json_encode($img));
	}	
	
	/* Upload Image
	---------------------------------------------------------------------------------------------------------------------------*/		
	public function uploadImg() 
	{
		if($this->validate())
		{
			$name = $_FILES['uploadimg']['name'];
			$file_ext = strrchr(basename($name), '.');
			$file = date("Y-m-d-h-i-s") . $file_ext; 		
			$url = $this->request->post['url'];			
			$filetypes = array('.jpg', '.gif', '.bmp', '.png', '.jpeg', '.JPG', '.BMP', '.GIF', '.PNG', '.JPEG');			
			if(!in_array($file_ext, $filetypes)) 
			{
				$upload = 'error';
			} 
			else {
				if(move_uploaded_file($_FILES['uploadimg']['tmp_name'], $url . $file)) 
				{
					$size = getimagesize($url . $file);
					
					$upload[] = array(
						'src'	 		=> $file,
						'size'		=> $this->filesize_get($url . $file),
						'sizexy'	=> $size[0] . ' x ' . $size[1],
						'width'		=> $size[0],
						'height'	=> $size[1],
					);					
				} 
				else {
					$upload = 'error';
				}
			}			
		} 
		else {
			$upload = 'error';
		}
		
		$this->response->setOutput(json_encode($upload));
	}	
	
	/* Delete Image
	---------------------------------------------------------------------------------------------------------------------------*/		
	public function deleteImg()
	{
		if($this->validate()){
		
			$delete = '';
			$file = $this->request->post['file'];
			
			if (file_exists($file))
			{
				unlink($file);
			}
	
		} 
		else {
			$delete = 'error';
		}
		
		$this->response->setOutput($delete);	
	}
	
	/* Validate
	---------------------------------------------------------------------------------------------------------------------------*/
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/kw_flycart')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	/* Get Filesize
	---------------------------------------------------------------------------------------------------------------------------*/	
	private function filesize_get($file)
	{
		if(!file_exists($file)) return 'Image not found';

		$filesize = filesize($file);
		
		if($filesize > 1024)
		{
		   $filesize = ($filesize/1024);

			if($filesize > 1024) {
				$filesize = ($filesize/1024);

				if($filesize > 1024)
				{
				   $filesize = ($filesize/1024);
				   $filesize = round($filesize, 1);
				   
				   return $filesize." Gb";   
				}
				else {
				   $filesize = round($filesize, 1);
				   
				   return $filesize." Mb";   
			   }  
				
		   }
		   else {
			   $filesize = round($filesize, 1);
			   
			   return $filesize." Kb";   
		   }
	   }
	   else {
		   $filesize = round($filesize, 1);
		   
		   return $filesize." bite";   
	   }
	} 
	
}
?>