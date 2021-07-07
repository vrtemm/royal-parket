<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->load->model('extension/module');
		$setting_info = $this->model_extension_module->getModule(86);
		$data['banners'] = $this->load->controller('module/slideshow', $setting_info);


		$this->load->model('catalog/product');

		$filter = array(
				'sort' => 'RAND',
				'order' => 'DESC',
				'start' => 0,
				'limit' => 15
		);
		$results = $this->model_catalog_product->getProductSpecials($filter);
		$data['specials'] = $this->model_catalog_product->format($results);
		$results = $this->model_catalog_product->getBestSellerProducts(15);
		$data['populars'] = $this->model_catalog_product->format($results);
		$filter_data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => 15
		);
		$results = $this->model_catalog_product->getProducts($filter_data);
		$data['new'] = $this->model_catalog_product->format($results);
		$results = $this->model_catalog_product->getLatestReviews(15);
		$data['reviews'] = $this->model_catalog_product->format($results); 

		$data['cat1'] = $this->url->link('product/category', 'path=33');
		$data['cat2'] = $this->url->link('product/category', 'path=25');
		$data['cat3'] = $this->url->link('product/category', 'path=34');
		$data['cat4'] = $this->url->link('product/category', 'path=18');

		$setting_info = $this->model_extension_module->getModule(87);
		$data['text'] = $this->load->controller('module/html', $setting_info);

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$data['mms'] = array();

		$results = $this->model_design_banner->getBanner(22);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['mms'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], 156, 49)
				);
			}
		}


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}
}