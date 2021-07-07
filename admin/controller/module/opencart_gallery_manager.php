<?php
class ControllerModuleOpencartGalleryManager extends Controller {
	private $error = array(); 

	public function index() { 
		$this->load->model('opencart_gallery/image');

		$db_insert = $this->config->get('gallery_db_insert');
		if(!isset($db_insert))  {

			$this->model_opencart_gallery_image->CreateDB();

		}
	  
		$this->load->language('module/opencart_gallery_manager');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('opencart_gallery_manager', $this->request->post);		

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');


		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');

		$data['text_back'] = $this->language->get('text_back');
		$data['text_edit'] = $this->language->get('text_edit');

		$data['button_setting'] = $this->language->get('button_setting');
		$data['button_image_manager'] = $this->language->get('button_image_manager');
		$data['button_album_manager'] = $this->language->get('button_album_manager');
		$data['button_video_manager'] = $this->language->get('button_video_manager');
		$data['button_video_review'] = $this->language->get('button_video_review');
		$data['button_album_review'] = $this->language->get('button_album_review');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove'] = $this->language->get('button_remove');

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
			'href'      => $this->url->link('module/opencart_gallery_manager', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['setting'] = $this->url->link('opencart_gallery/setting', 'token=' . $this->session->data['token'], 'SSL');
		$data['image_manager'] = $this->url->link('opencart_gallery/image', 'token=' . $this->session->data['token'], 'SSL');
		$data['album_manager'] = $this->url->link('opencart_gallery/album', 'token=' . $this->session->data['token'], 'SSL');
		$data['video_manager'] = $this->url->link('opencart_gallery/video', 'token=' . $this->session->data['token'], 'SSL');
		$data['album_review'] = $this->url->link('opencart_gallery/album_review', 'token=' . $this->session->data['token'], 'SSL');
		$data['video_review'] = $this->url->link('opencart_gallery/video_review', 'token=' . $this->session->data['token'], 'SSL');


		$data['action'] = $this->url->link('module/opencart_gallery_manager', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['modules'] = array();

		if (isset($this->request->post['opencart_gallery_manager_module'])) {
			$data['modules'] = $this->request->post['opencart_gallery_manager_module'];
		} elseif ($this->config->get('opencart_gallery_manager_module')) { 
			$data['modules'] = $this->config->get('opencart_gallery_manager_module');
		}				

		$this->load->model('opencart_gallery/image');
		$data['total_image'] = $this->model_opencart_gallery_image->getTotalImages();
		$data['total_album'] = $this->model_opencart_gallery_image->getTotalAlbums();

		$this->load->model('opencart_gallery/video');
		$data['total_video'] = $this->model_opencart_gallery_video->getTotalVideos();

		$this->load->model('opencart_gallery/review');
		$data['total_album_review']  = $this->model_opencart_gallery_review->getTotalAlbumReviews();
		$data['total_video_review']  = $this->model_opencart_gallery_review->getTotalVideoReviews();
		$data['album_review_awating']  = $this->model_opencart_gallery_review->getTotalAlbumReviewsAwaitingApproval();
		$data['video_review_awating']  = $this->model_opencart_gallery_review->getTotalVideoReviewsAwaitingApproval();

		$data['albums'] = array();

		$data_album = array(
			'start' => 0,
			'limit' => 6,
			'sort' => 'a.viewed',
			'order' => 'DESC',
		);

		$results = $this->model_opencart_gallery_image->getAlbums($data_album);

		foreach ($results as $result) {

			$data['albums'][] = array(
				'name'        => $result['name'],
				'viewed'      => $result['viewed'],
				'href' => $this->url->link('opencart_gallery/album/update', 'token=' . $this->session->data['token'] . '&album_id=' . $result['album_id'] , 'SSL')
			);
		}

		$data['videos'] = array();

		$data_video = array(
			'start' => 0,
			'limit' => 6,
			'sort' => 'v.viewed',
			'order' => 'DESC',
		);

		$results = $this->model_opencart_gallery_video->getVideos($data_video);

		foreach ($results as $result) {

			$data['videos'][] = array(
				'name'        => $result['name'],
				'viewed'      => $result['viewed'],
				'href' => $this->url->link('opencart_gallery/video/update', 'token=' . $this->session->data['token'] . '&video_id=' . $result['video_id'] , 'SSL')
			);
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/opencart_gallery_manager.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/opencart_gallery_manager')) {
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