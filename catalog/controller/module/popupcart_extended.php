<?php 
class ControllerModulePopupCartExtended extends Controller {

	public function index() {
		$this->load->language('common/cart');
		$this->language->load('module/popupcart_extended');
		
		$text_head = $this->config->get('popupcart_extended_module_head');
		$text_related_heading = $this->config->get('popupcart_extended_module_related_heading');
		$text_shopping = $this->config->get('popupcart_extended_module_button_shopping');
		$text_cart = $this->config->get('popupcart_extended_module_button_cart');
		$text_checkout = $this->config->get('popupcart_extended_module_button_checkout');
		$text_incart = $this->config->get('popupcart_extended_module_button_incart');
		$text_incart_with_options = $this->config->get('popupcart_extended_module_button_incart_with_options');
		
		$data['click_on_cart'] = $this->config->get('popupcart_extended_module_click_on_cart');
		$data['addtocart_logic'] = $this->config->get('popupcart_extended_module_addtocart_logic');
		$data['related'] = $this->config->get('popupcart_extended_module_related_show');
		$data['button_shopping_show'] = $this->config->get('popupcart_extended_module_button_shopping_show');
		$data['button_cart_show'] = $this->config->get('popupcart_extended_module_button_cart_show');
		$data['manufacturer_show'] = $this->config->get('popupcart_extended_module_manufacturer_show');
		$data['button_incart_logic'] = $this->config->get('popupcart_extended_module_button_incart_logic');
		
		$language_id = $this->session->data['language'];
		$language_id = $this->config->get('config_language_id');
		
		$data['head'] = $text_head[$language_id];
		$data['button_shopping'] = $text_shopping[$language_id];
		$data['button_cart'] = $text_cart[$language_id];
		$data['button_checkout'] = $text_checkout[$language_id];
		$data['button_incart'] = $text_incart[$language_id];
		$data['button_incart_with_options'] = $text_incart_with_options[$language_id];
		$data['text_related'] = $text_related_heading[$language_id];
		
		$data['button_cart_default'] = $this->language->get('button_cart');
		$data['text_foto'] = $this->language->get('text_foto');
		$data['text_name'] = $this->language->get('text_name');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_quantity'] = $this->language->get('text_quantity');
		$data['text_price'] = $this->language->get('text_price');
		$data['text_total'] = $this->language->get('text_total');
		
		$data['in_stock'] = $this->language->get('text_in_stock');
		$data['left'] = $this->language->get('text_left');
		$data['left1'] = $this->language->get('text_left1');
		$data['just'] = $this->language->get('text_just');
		$data['pcs'] = $this->language->get('text_pcs');

		// Totals
		$this->load->model('extension/extension');

		$total_data = array();
		$total = 0;
		$taxes = $this->cart->getTaxes();
		
		if(VERSION >= 2.2) {
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
		}
		
		$this->document->addScript('catalog/view/javascript/popupcart_ext/jquery.total-storage.min.js');
		$this->document->addScript('catalog/view/javascript/popupcart_ext/popupcart_ext.js');
		$this->document->addScript('catalog/view/javascript/popupcart_ext/owl.carousel.min.js');
		$this->document->addStyle('catalog/view/javascript/popupcart_ext/popupcart_ext.css?ver=1.5');
		$this->document->addStyle('catalog/view/javascript/popupcart_ext/owl.carousel.css');
		
		if(VERSION >= 2.2) {
			$currency = $this->session->data['currency'];
		} else {
			$currency = '';
		}

		// Display prices
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);
					if(VERSION >= 2.2) {
						$this->{'model_total_' . $result['code']}->getTotal($total_data);
					} else {
						$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
					}
				}
			}

			$sort_order = array();
			
			if(VERSION >= 2.2) {
				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				array_multisort($sort_order, SORT_ASC, $totals);
			} else {
				foreach ($total_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				array_multisort($sort_order, SORT_ASC, $total_data);
			}
		}
		
		$data['total_summ'] = $this->currency->format($total, $currency);
		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_cart'] = $this->language->get('text_cart');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_recurring'] = $this->language->get('text_recurring');
		$data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $currency));
		$data['text_loading'] = $this->language->get('text_loading');

		$data['button_remove'] = $this->language->get('button_remove');
		
		$this->load->model('catalog/product');
		$this->load->model('module/popupcart_extended');
		$this->load->model('tool/image');
		$this->load->model('tool/upload');

		$data['products'] = array();
		
		$getProducts = array_reverse($this->cart->getProducts());

		foreach ($getProducts as $product) {
			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], 60, 60);
			} else {
				$image = '';
			}

			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['value'];
				} else {
					$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

					if ($upload_info) {
						$value = $upload_info['name'];
					} else {
						$value = '';
					}
				}

				$option_data[] = array(
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
					'type'  => $option['type']
				);
			}

			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $currency);
			} else {
				$price = false;
			}

			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $currency);
			} else {
				$total = false;
			}
			
			if (VERSION < 2.1) {
				$key = $product['key'];
			} else {
				$key = $product['cart_id'];
			}

			$data['products'][] = array(
				'key'       => $key,
				'id'       => $product['product_id'],
				'thumb'     => $image,
				'name'      => $product['name'],
				'model'     => $product['model'],
				'option'    => $option_data,
				'recurring' => ($product['recurring'] ? $product['recurring']['name'] : ''),
			
				'quantity'  => $product['quantity'],
				'stock'    => $this->config->get('config_stock_checkout'),
				'minimum'    => $product['minimum'],
			
				'price'     => $price,
				'total'     => $total,
				'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
			);
			
			$rel_product = $this->config->get('popupcart_extended_module_related_product');
			
			if($rel_product == 0) {
				$results = $this->model_catalog_product->getProductRelated($product['product_id']);	
			} elseif($rel_product == 1) {
				$results = $this->model_module_popupcart_extended->getProducts($product['product_id']);	
			} else {
				$results1 = $this->model_catalog_product->getProductRelated($product['product_id']);	
				$results2 = $this->model_module_popupcart_extended->getProducts($product['product_id']);
				$results = array_merge($results1, $results2);
				
			}
			
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], 100, 100);
				} else {
					$image = false;
				}
				
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
				} else {
					$price = false;
				}
						
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency);
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
							
				$data['products_related'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $result['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}	
		}

		// Gift Voucher
		$data['vouchers'] = array();

		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $key => $voucher) {
				$data['vouchers'][] = array(
					'key'         => $key,
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'])
				);
			}
		}

		$data['cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		
		if (VERSION >= 2.2) {
			return $this->load->view('module/popupcart_extended', $data);
		} else {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/popupcart_extended.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/popupcart_extended.tpl', $data);
			} else {
				return $this->load->view('default/template/module/popupcart_extended.tpl', $data);
			}
		}
	}
	
	public function info() {
		$this->response->setOutput($this->index());
	}
}
?>