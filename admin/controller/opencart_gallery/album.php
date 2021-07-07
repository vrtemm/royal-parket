<?php 
class ControllerOpencartGalleryAlbum extends Controller { 
	private $error = array();

	public function index() {
		$this->load->language('opencart_gallery/album');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('opencart_gallery/image');

		$this->getList();
	}

	public function insert() {
		$this->load->language('opencart_gallery/album');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('opencart_gallery/image');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_opencart_gallery_image->addAlbum($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('opencart_gallery/album', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('opencart_gallery/album');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('opencart_gallery/image');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_opencart_gallery_image->editAlbum($this->request->get['album_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('opencart_gallery/album', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('opencart_gallery/album');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('opencart_gallery/image');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $album_id) {
				$this->model_opencart_gallery_image->deleteAlbum($album_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('opencart_gallery/album', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}


	protected function getList() {
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('opencart_gallery/album', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$data['opencart_gallery_manager'] = $this->url->link('module/opencart_gallery_manager', 'token=' . $this->session->data['token'], 'SSL');

		$data['insert'] = $this->url->link('opencart_gallery/album/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('opencart_gallery/album/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['albums'] = array();

		$data_albums = array(
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$album_total = $this->model_opencart_gallery_image->getTotalAlbums();

		$results = $this->model_opencart_gallery_image->getAlbums($data_albums);

		$this->load->model('tool/image');

		foreach ($results as $result) {
		
			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 80, 80);
			} else {
				$image = $this->model_tool_image->resize('no_album.jpg', 80, 80);
			}

			$data['albums'][] = array(
				'album_id' => $result['album_id'],
				'name'        => $result['name'],
				'image'        => $image,
				'sort_order'  => $result['sort_order'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['album_id'], $this->request->post['selected']),
				'edit'        => $this->url->link('opencart_gallery/album/edit', 'token=' . $this->session->data['token'] . '&album_id=' . $result['album_id'] . $url, 'SSL'),
				'delete'      => $this->url->link('opencart_gallery/album/delete', 'token=' . $this->session->data['token'] . '&album_id=' . $result['album_id'] . $url, 'SSL')
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_image'] = $this->language->get('column_image');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_edit'] = $this->language->get('button_edit');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$pagination = new Pagination();
		$pagination->total = $album_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('opencart_gallery/album', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($album_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($album_total - $this->config->get('config_limit_admin'))) ? $album_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $album_total, ceil($album_total / $this->config->get('config_limit_admin')));

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('opencart_gallery/album_list.tpl', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['album_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');		
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_percent'] = $this->language->get('text_percent');
		$data['text_amount'] = $this->language->get('text_amount');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_keyword'] = $this->language->get('entry_keyword');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_image_add'] = $this->language->get('button_image_add');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_image'] = $this->language->get('tab_image');

		$data['help_keyword'] = $this->language->get('help_keyword');


		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('opencart_gallery/album', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		if (!isset($this->request->get['album_id'])) {
			$data['action'] = $this->url->link('opencart_gallery/album/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('opencart_gallery/album/edit', 'token=' . $this->session->data['token'] . '&album_id=' . $this->request->get['album_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('opencart_gallery/album', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['album_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$album_info = $this->model_opencart_gallery_image->getAlbum($this->request->get['album_id']);
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['album_description'])) {
			$data['album_description'] = $this->request->post['album_description'];
		} elseif (isset($this->request->get['album_id'])) {
			$data['album_description'] = $this->model_opencart_gallery_image->getAlbumDescriptions($this->request->get['album_id']);
		} else {
			$data['album_description'] = array();
		}
		
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['album_store'])) {
			$data['album_store'] = $this->request->post['album_store'];
		} elseif (isset($this->request->get['album_id'])) {
			$data['album_store'] = $this->model_opencart_gallery_image->getAlbumStores($this->request->get['album_id']);
		} else {
			$data['album_store'] = array(0);
		}			

		
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($album_info)) {
			$data['image'] = $album_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($album_info) && is_file(DIR_IMAGE . $album_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($album_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($album_info)) {
			$data['keyword'] = $album_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($album_info)) {
			$data['sort_order'] = $album_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($album_info)) {
			$data['status'] = $album_info['status'];
		} else {
			$data['status'] = 1;
		}

		// Categories
		
		$this->load->model('opencart_gallery/image');

		// Images
		if (isset($this->request->post['album_image'])) {
			$album_images = $this->request->post['album_image'];
		} elseif (isset($this->request->get['album_id'])) {
			$album_images = $this->model_opencart_gallery_image->getImageAlbum($this->request->get['album_id']);
		} else {
			$album_images = array();
		}

		$data['album_images'] = array();

		foreach ($album_images as $album_image) {
			if (is_file(DIR_IMAGE . $album_image['image'])) {
				$image = $album_image['image'];
				$thumb = $album_image['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}

			$data['album_images'][] = array(
				'name' 		 => $album_image['name'],
				'image'      => $image,
				'thumb'      => $this->model_tool_image->resize($thumb, 100, 100),
				'sort_order' => $album_image['sort_order']
			);
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('opencart_gallery/album_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'opencart_gallery/album')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['album_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'opencart_gallery/album')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('opencart_gallery/image');

			$data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 20
			);

			$results = $this->model_opencart_gallery_image->getAlbums($data);

			foreach ($results as $result) {
				$json[] = array(
					'album_id' => $result['album_id'], 
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}		
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
		
}
?>