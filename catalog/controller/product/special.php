<?php

class ControllerProductSpecial extends Controller {

	public function index() {

		$this->load->language('product/special');



		$this->load->model('catalog/product');



		$this->load->model('tool/image');



		if (isset($this->request->get['sort'])) {

			$sort = $this->request->get['sort'];

		} else {

			$sort = 'p.price';

		}



		if (isset($this->request->get['order'])) {

			$order = $this->request->get['order'];

		} else {

			$order = 'ASC';

		}



		if (isset($this->request->get['page'])) {

			$page = $this->request->get['page'];

		} else {

			$page = 1;

		}



		if (isset($this->request->get['limit'])) {

			$limit = $this->request->get['limit'];

		} else {

			$limit = $this->config->get('config_product_limit');

		}



		$this->document->setTitle($this->language->get('heading_title'));



		$data['breadcrumbs'] = array();



		$data['breadcrumbs'][] = array(

			'text' => $this->language->get('text_home'),

			'href' => $this->url->link('common/home')

		);



		$url = '';



		if (isset($this->request->get['sort'])) {

			$url .= '&sort=' . $this->request->get['sort'];

		}



		if (isset($this->request->get['order'])) {

			$url .= '&order=' . $this->request->get['order'];

		}



		if (isset($this->request->get['page'])) {

			$url .= '&page=' . $this->request->get['page'];

		}



		if (isset($this->request->get['limit'])) {

			$url .= '&limit=' . $this->request->get['limit'];

		}



		$data['breadcrumbs'][] = array(

			'text' => $this->language->get('heading_title'),

			'href' => $this->url->link('product/special', $url)

		);



		$data['heading_title'] = $this->language->get('heading_title');



		$data['text_empty'] = $this->language->get('text_empty');

		$data['text_quantity'] = $this->language->get('text_quantity');

		$data['text_manufacturer'] = $this->language->get('text_manufacturer');

		$data['text_model'] = $this->language->get('text_model');

		$data['text_price'] = $this->language->get('text_price');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['text_points'] = $this->language->get('text_points');

		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));

		$data['text_sort'] = $this->language->get('text_sort');

		$data['text_limit'] = $this->language->get('text_limit');



		$data['button_cart'] = $this->language->get('button_cart');

		$data['button_wishlist'] = $this->language->get('button_wishlist');

		$data['button_compare'] = $this->language->get('button_compare');

		$data['button_list'] = $this->language->get('button_list');

		$data['button_grid'] = $this->language->get('button_grid');

		$data['button_continue'] = $this->language->get('button_continue');

		

		$data['compare'] = $this->url->link('product/compare');



		$data['products'] = array();



		$filter_data = array(

			'sort'  => $sort,

			'order' => $order,

			'start' => ($page - 1) * $limit,

			'limit' => $limit

		);



		$product_total = $this->model_catalog_product->getTotalProductSpecials();



		$results = $this->model_catalog_product->getProductSpecials($filter_data);



		$data['products'] = $this->model_catalog_product->format($results, $url, true);



		$url = '';



		if (isset($this->request->get['limit'])) {

			$url .= '&limit=' . $this->request->get['limit'];

		}



		$data['sorts'] = array();
			

			$data['sorts'][] = array(
				'text'  => '<i class="fa fa-long-arrow-down"></i>Дешевые',
				'value' => 'p.price-ASC',
				'ts'    => 0,
				'href'  => $this->url->link('product/special', 'sort=p.price&order=ASC' . $url)
			);
			
			$data['sorts'][] = array(
				'text'  => '<i class="fa fa-long-arrow-up"></i>Дорогие',
				'value' => 'p.price-DESC',
				'ts'    => 0,
				'href'  => $this->url->link('product/special', 'sort=p.price&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => 'Популярные',
				'value' => 'p.viewed-DESC',
				'ts'    => 1,
				'href'  => $this->url->link('product/special', 'sort=p.viewed&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => 'По рейтингу',
					'ts'    => 1,
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/special', 'sort=rating&order=DESC' . $url)
				);

			}
			

		$url = '';



		if (isset($this->request->get['sort'])) {

			$url .= '&sort=' . $this->request->get['sort'];

		}



		if (isset($this->request->get['order'])) {

			$url .= '&order=' . $this->request->get['order'];

		}



		$data['limits'] = array();



		$limits = array_unique(array($this->config->get('config_product_limit'), 48, 72, 96, 120));



		sort($limits);



		foreach($limits as $value) {

			$data['limits'][] = array(

				'text'  => $value,

				'value' => $value,

				'href'  => $this->url->link('product/special', $url . '&limit=' . $value)

			);

		}



		$url = '';



		if (isset($this->request->get['sort'])) {

			$url .= '&sort=' . $this->request->get['sort'];

		}



		if (isset($this->request->get['order'])) {

			$url .= '&order=' . $this->request->get['order'];

		}



		if (isset($this->request->get['limit'])) {

			$url .= '&limit=' . $this->request->get['limit'];

		}



		$pagination = new Pagination();

		$pagination->total = $product_total;

		$pagination->page = $page;

		$pagination->limit = $limit;

		//$pagination->url = $this->url->link('product/special', $url . '&page={page}');
		$pagination->url = '/specials/'.($url ? $url.'&' : '?').'page={page}';



		$data['pagination'] = $pagination->render();



		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));



		$data['sort'] = $sort;

		$data['order'] = $order;

		$data['limit'] = $limit;



		$data['continue'] = $this->url->link('common/home');



		$data['column_left'] = $this->load->controller('common/column_left');

		$data['column_right'] = $this->load->controller('common/column_right');

		$data['content_top'] = $this->load->controller('common/content_top');

		$data['content_bottom'] = $this->load->controller('common/content_bottom');

		$data['footer'] = $this->load->controller('common/footer');

		$data['header'] = $this->load->controller('common/header');



		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/special.tpl')) {

			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/special.tpl', $data));

		} else {

			$this->response->setOutput($this->load->view('default/template/product/special.tpl', $data));

		}

	}

}

