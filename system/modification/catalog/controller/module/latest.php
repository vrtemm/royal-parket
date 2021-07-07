<?php

class ControllerModuleLatest extends Controller {

	public function index($setting) {

		$this->load->language('module/latest');



		$data['heading_title'] = $this->language->get('heading_title');



		$data['text_tax'] = $this->language->get('text_tax');



		$data['button_cart'] = $this->language->get('button_cart');
 
				$data['text_quick'] = $this->language->get('text_quick');
				$data['text_price'] = $this->language->get('text_price');
				$data['button_wishlist'] = $this->language->get('button_wishlist');
				$data['button_compare'] = $this->language->get('button_compare');	
				$data['button_details'] = $this->language->get('button_details');
				$data['text_manufacturer'] = $this->language->get('text_manufacturer');
				$data['text_category'] = $this->language->get('text_category');
				$data['text_model'] = $this->language->get('text_model');
				$data['text_availability'] = $this->language->get('text_availability');
				$data['text_instock'] = $this->language->get('text_instock');
				$data['text_outstock'] = $this->language->get('text_outstock');
				$data['reviews'] = $this->language->get('reviews');
				$data['text_price'] = $this->language->get('text_price');
				$data['text_product'] = $this->language->get('text_product');
				

		$data['button_wishlist'] = $this->language->get('button_wishlist');

		$data['button_compare'] = $this->language->get('button_compare');

			$data['text_new'] = $this->language->get('text_new');
			



		$this->load->model('catalog/product');



		$this->load->model('tool/image');
 
						$this->load->model('catalog/manufacturer');
						$this->language->load('product/product');
						$this->language->load('product/category');
						$this->load->model('catalog/review');
				



		$data['products'] = array();



		$filter_data = array(

			'sort'  => 'p.date_added',

			'order' => 'DESC',

			'start' => 0,

			'limit' => $setting['limit']

		);



		$results = $this->model_catalog_product->getProducts($filter_data);



		if ($results) {

			$data['products'] = $this->model_catalog_product->format($results);


			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/latest.tpl')) {

				return $this->load->view($this->config->get('config_template') . '/template/module/latest.tpl', $data);

			} else {

				return $this->load->view('default/template/module/latest.tpl', $data);

			}

		}

	}

}