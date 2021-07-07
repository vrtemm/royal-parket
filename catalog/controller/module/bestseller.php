<?php

class ControllerModuleBestSeller extends Controller {

	public function index($setting) {

		$this->load->language('module/bestseller');



		$data['heading_title'] = $this->language->get('heading_title');



		$data['text_tax'] = $this->language->get('text_tax');

		$data['text_best'] = $this->language->get('text_best');



		$data['button_cart'] = $this->language->get('button_cart');

		$data['button_wishlist'] = $this->language->get('button_wishlist');

		$data['button_compare'] = $this->language->get('button_compare');



		$this->load->model('catalog/product');



		$this->load->model('tool/image');



		$data['products'] = array();



		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);



		if ($results) {

			$data['products'] = $this->model_catalog_product->format($results);



			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bestseller.tpl')) {

				return $this->load->view($this->config->get('config_template') . '/template/module/bestseller.tpl', $data);

			} else {

				return $this->load->view('default/template/module/bestseller.tpl', $data);

			}

		}

	}

}