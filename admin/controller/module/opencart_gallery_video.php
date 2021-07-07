<?php
class ControllerModuleOpencartGalleryVideo extends Controller {
	private $error = array(); 

	public function index() {   
		$this->load->language('module/opencart_gallery_video');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('opencart_gallery_video', $this->request->post);		

			$this->cache->delete('product');

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');

		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_apr'] = $this->language->get('entry_apr');
		$data['entry_vs'] = $this->language->get('entry_vs');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_sort_by'] = $this->language->get('entry_sort_by');
		$data['entry_video'] = $this->language->get('entry_video');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_module_add'] = $this->language->get('button_module_add');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['help_video'] = $this->language->get('help_video');


		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['image'])) {
			$data['error_image'] = $this->error['image'];
		} else {
			$data['error_image'] = array();
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/opencart_gallery_video', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['action'] = $this->url->link('module/opencart_gallery_video', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['token'] = $this->session->data['token'];

		$this->load->model('opencart_gallery/video');

		if (isset($this->request->post['opencart_gallery_video_featured'])) {
			$videos = explode(',', $this->request->post['opencart_gallery_video_featured']);
		} else {		
			$videos = explode(',', $this->config->get('opencart_gallery_video_featured'));
		}

		$data['videos'] = array();

		foreach ($videos as $video_id) {
			$video_info = $this->model_opencart_gallery_video->getVideo($video_id);

			if ($video_info) {
				$data['videos'][] = array(
					'video_id'   => $video_info['video_id'],
					'name'       => $video_info['name']
				);
			}
		}

		if (isset($this->request->post['opencart_gallery_video_status'])) {
			$data['opencart_gallery_video_status'] = $this->request->post['opencart_gallery_video_status'];
		} else {
			$data['opencart_gallery_video_status'] = $this->config->get('opencart_gallery_video_status');
		}
				
		if (isset($this->request->post['opencart_gallery_video_module'])) {
			$modules = $this->request->post['opencart_gallery_video_module'];
		} elseif ($this->config->has('opencart_gallery_video_module')) {
			$modules = $this->config->get('opencart_gallery_video_module');
		} else {
			$modules = array();
		}
		
		$data['opencart_gallery_video_modules'] = array();
		
		foreach ($modules as $key => $module) {
			$data['opencart_gallery_video_modules'][] = array(
				'key'    => $key,
				'limit'  => $module['limit'],
				'apr'    => $module['apr'],
				'as'    => $module['vs'],
				'sb'    => $module['sb'],
			);
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/opencart_gallery_video.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/opencart_gallery_video')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}	

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>