<?php

class ControllerModuleSpecial extends Controller {

	public function index($setting) {

		$this->load->language('module/special');



		$data['heading_title'] = $this->language->get('heading_title');



		$data['text_tax'] = $this->language->get('text_tax');



		$data['button_cart'] = $this->language->get('button_cart');

		$data['button_wishlist'] = $this->language->get('button_wishlist');

		$data['button_compare'] = $this->language->get('button_compare');



		$this->load->model('catalog/product');



		$this->load->model('tool/image');



		$data['products'] = array();



		$filter_data = array(

			'sort'  => 'pd.name',

			'order' => 'ASC',

			'start' => 0,

			'limit' => $setting['limit']

		);



		$results = $this->model_catalog_product->getProductSpecials($filter_data);



		if ($results) {

			$data['products'] = $this->model_catalog_product->format($results);


			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/special.tpl')) {

				return $this->load->view($this->config->get('config_template') . '/template/module/special.tpl', $data);

			} else {

				return $this->load->view('default/template/module/special.tpl', $data);

			}

		}

	}

}