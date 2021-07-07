<?php
class ControllerModuleiBlogWidget extends Controller {
	
	private $moduleName = 'iBlog';
	private $moduleNameSmall = 'iblog';
	private $moduleData_module = 'iblog_module';
	private $moduleModel = 'model_module_iblog';
	
	public function index($setting) {
		$this->language->load('module/'.$this->moduleNameSmall);
		$this->load->model('module/'.$this->moduleNameSmall);
		$this->load->model('setting/setting');

    	$data['heading_title']				= $this->language->get('heading_title');
		$data['no_featured']				= $this->language->get('no_featured');
		$data['no_posts']					= $this->language->get('no_posts');
		$data['iblog_button']				= $this->language->get('iblog_button');

		$data['posts']						= array();
		$data['post_id']					= !empty($this->request->get['post_id']) ? $this->request->get['post_id'] : 0;
		$posts								= $this->{$this->moduleModel}->getPosts();
		$data['featured_post']				= $this->{$this->moduleModel}->getFeaturedPost();
		$data['custom_css']					= $setting['custom_css'];
		$data['featured']					= $setting['featured'];
		$this->load->model('tool/image');
		foreach ($posts as $post) {
			$image = $this->model_tool_image->resize($post['image'], 70, 70);
			if(!$image) {
				$image = $this->model_tool_image->resize('placeholder.png', 70, 70);
			}
			$data['posts'][] = array(
				'post_id'	=> $post['iblog_post_id'],
				'title'		=> $post['title'],
				'image'		=> $image,
				'excerpt'	=> $post['excerpt'],
				'href'		=> $this->url->link('module/'.$this->moduleNameSmall.'/post', 'post_id=' . $post['iblog_post_id'])
			);	
		}
		$data['blog'] = $this->url->link('module/iblog/listing');
		if ($data['featured_post'] !== false) {
			
	
			if (file_exists(DIR_IMAGE . $data['featured_post']['image'])) {
				$data['featured_post']['image'] = $this->model_tool_image->resize($data['featured_post']['image'], $setting['width'], $setting['height']);
			} else {
				$data['featured_post']['image'] = '';
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/'.$this->moduleNameSmall.'-widget.tpl')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/'.$this->moduleNameSmall.'.css');
			return $this->load->view($this->config->get('config_template').'/template/module/'.$this->moduleNameSmall.'-widget.tpl', $data);
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/'.$this->moduleNameSmall.'.css');
			return $this->load->view('default/template/module/'.$this->moduleNameSmall.'-widget.tpl', $data);
		}  
  	}
}
?>