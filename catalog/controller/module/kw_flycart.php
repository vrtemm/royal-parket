<?php  
class ControllerModuleKwFlyCart extends Controller {

	private $_name = 'kw_flycart';
	private $_path = HTTPS_SERVER;

	public function index($setting) {

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$base_url = $this->config->get('config_ssl');
		} else {
			$base_url = $this->config->get('config_url');
		}

		$www = parse_url($this->url->link(false));

		if( preg_match('/www/', $this->request->server['HTTP_HOST']) ) {
			$data['url'] = $www['scheme'] . '://www.' . $www['host'] . $www['path'] . '?route=';
		}
		else {
			$data['url'] = $this->url->link(false);
		}

		$this->language->load('module/kw_flycart');
		$this->load->model('setting/setting');
		$this->load->model('tool/image');
		$this->load->model('localisation/language');

		$tools = $this->model_setting_setting->getSetting('kw_flycart');

		$data['tools'] = $tools['kw_flycart_tools'];

		if (isset($data['tools']['status_module']) && $data['tools']['status_module'] === "true")
		{
			$this->document->addStyle($base_url . 'kw_application/flycart/catalog/css/kw_flycart.css', $rel = 'stylesheet', $media = 'screen');
			$this->document->addScript($base_url . 'kw_application/flycart/catalog/jquery/jquery.magnific-popup.min.js');

			$this->document->addScript($base_url . 'kw_application/flycart/catalog/app/angular.min.js');
			$this->document->addScript($base_url . 'kw_application/flycart/catalog/app/flow.min.js');

			if ($this->config->get('config_language') === 'ru') {
				$this->document->addScript($base_url . 'kw_application/flycart/catalog/app/i18n/angular-locale_ru-ru.js');
			}
			else {
				$this->document->addScript($base_url . 'kw_application/flycart/catalog/app/i18n/angular-locale_en.js');
			}

			$this->document->addScript($base_url . 'kw_application/flycart/catalog/app/angular-resource.min.js');
			$this->document->addScript($base_url . 'kw_application/flycart/catalog/app/angular-sanitize.min.js');
			$this->document->addScript($base_url . 'kw_application/flycart/catalog/app/angular-animate.min.js');
			$this->document->addScript($base_url . 'kw_application/flycart/catalog/app/angular-retina.min.js');
			$this->document->addScript($base_url . 'kw_application/flycart/catalog/app/ui-bootstrap-tpls.js');
			$this->document->addScript($base_url . 'kw_application/flycart/catalog/app/datetime-picker.js');
			$this->document->addScript($base_url . 'kw_application/flycart/catalog/app/ng-flow.min.js');

			$this->document->addScript($base_url . 'kw_application/flycart/catalog/build/flycart-build.js');
		}

		$data['language'] = $this->config->get('config_language');

		$data['lang_id'] = $this->config->get('config_language_id');
		$data['cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

		/** load language vars **/
		$data['heading_title']  = $this->language->get('heading_title');
		$data['noti_title_1']   = $this->language->get('noti_title_1');
		$data['sku']            = $this->language->get('sku');
		$data['manuf']          = $this->language->get('manuf');
		$data['model']          = $this->language->get('model');
		$data['noti_title_2']   = $this->language->get('noti_title_2');
		$data['cont_btn']       = $this->language->get('cont_btn');
		$data['check_btn']      = $this->language->get('check_btn');
		$data['tocart_btn']     = $this->language->get('tocart_btn');
		$data['items_1']        = $this->language->get('items_1');
		$data['items_2']        = $this->language->get('items_2');
		$data['items_3']        = $this->language->get('items_3');
		$data['items_b1']       = $this->language->get('items_b1');
		$data['items_b2']       = $this->language->get('items_b2');
		$data['items_b3']       = $this->language->get('items_b3');
		$data['items_n1']       = $this->language->get('items_n1');
		$data['items_n2']       = $this->language->get('items_n2');
		$data['items_n3']       = $this->language->get('items_n3');
		$data['items_t1']       = $this->language->get('items_t1');
		$data['items_t2']       = $this->language->get('items_t2');
		$data['items_t3']       = $this->language->get('items_t3');
		$data['text_added']     = $this->language->get('text_added');
		$data['text_empty']     = $this->language->get('text_empty');
		$data['b_total']        = $this->language->get('b_total');
		$data['min_error']      = $this->language->get('min_error');
		$data['max_error']      = $this->language->get('max_error');
		$data['options_text']   = $this->language->get('options_text');
		$data['require_text']   = $this->language->get('require_text');
		$data['file_btn']       = $this->language->get('file_btn');
		$data['add_btn']        = $this->language->get('add_btn');
		$data['adding_btn']     = $this->language->get('adding_btn');
		$data['today_txt']      = $this->language->get('today_txt');
		$data['now_txt']        = $this->language->get('now_txt');
		$data['date_txt']       = $this->language->get('date_txt');
		$data['time_txt']       = $this->language->get('time_txt');
		$data['clear_txt']      = $this->language->get('clear_txt');
		$data['close_txt']      = $this->language->get('close_txt');
		$data['select_text']    = $this->language->get('select_text');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/kw_flycart.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/kw_flycart.tpl', $data);
		} else {
			return $this->load->view('default/template/module/kw_flycart.tpl', $data);
		}
	}
	
	/* Load Settinds
	---------------------------------------------------------------------------------------------------------------------------*/	
	public function loader()
	{
		/** Models **/
		$this->load->model('extension/extension');
		$this->load->model('setting/setting');
		$this->load->model('tool/image');
		$this->load->model('tool/upload');
		$this->load->model('catalog/product');

		$tools = $this->model_setting_setting->getSetting('kw_flycart');

		$total_data = array();
		$total = 0;
		$taxes = $this->cart->getTaxes();

		if (isset($this->request->post['width']) && isset($this->request->post['height']))
		{
			$width = $this->request->post['width'];
			$height = $this->request->post['height'];
		}
		elseif ($tools['kw_flycart_tools']['module_type'] === 'module') {
			$width = isset($tools['kw_flycart_tools']['module_imgage_width']) ? $tools['kw_flycart_tools']['module_imgage_width'] : 100;
			$height = isset($tools['kw_flycart_tools']['module_imgage_height']) ? $tools['kw_flycart_tools']['module_imgage_height'] : 100;
		}
		else {
			$width = isset($tools['kw_flycart_tools']['popup_imgage_width']) ? $tools['kw_flycart_tools']['popup_imgage_width'] : 100;
			$height = isset($tools['kw_flycart_tools']['popup_imgage_height']) ? $tools['kw_flycart_tools']['popup_imgage_height'] : 100;
		}

		/** Display prices **/
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

					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}
			}

			$sort_order = array();

			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $total_data);
		}

		$totals = array();
		$products = array();
		$vouchers = array();
		$weight = '';
		$retina = false;

		foreach ($total_data as $total) {
			$totals[] = array(
				'title' => $total['title'],
				'text'  => $this->currency->format($total['value'])
			);
		}

		foreach ($this->cart->getProducts() as $product) {

			if ($product['image'] && $product['image'] !== '') {
				if (isset($tools['kw_flycart_tools']['retina']) && $tools['kw_flycart_tools']['retina'] === 'true')
				{
					$image = $this->model_tool_image->resize($product['image'], $width * 2, $height * 2);
				}
				else {
					$image = $this->model_tool_image->resize($product['image'], $width, $height);
				}
			}
			else {
				if (isset($tools['kw_flycart_tools']['retina']) && $tools['kw_flycart_tools']['retina'] === 'true')
				{
					$image = $this->model_tool_image->resize('kw_no_image.png', $width * 2, $height * 2);
				}
				else {
					$image = $this->model_tool_image->resize('kw_no_image.png', $width, $height);
				}
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
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
				);
			}

			$product_info = $this->model_catalog_product->getProduct($product['product_id']);

			/** Display prices **/
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
				$totalAlone = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$total = false;
				$totalAlone = false;
			}

			if ((float)$product_info['special']) {
				$option_price = 0;
				$special = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
				$specialAlone = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));

				if ($product['option']) {
					foreach ($product['option'] as $option) {
						if ($option['price_prefix'] == '+') {
							$option_price += $option['price'];
						} elseif ($option['price_prefix'] == '-') {
							$option_price -= $option['price'];
						}
					}

					$special = $this->currency->format($this->tax->calculate(($product_info['price'] + $option_price), $product_info['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
					$specialAlone = $this->currency->format($this->tax->calculate(($product_info['price'] + $option_price), $product_info['tax_class_id'], $this->config->get('config_tax')));
				}
			} else {
				$special = false;
				$specialAlone = false;
			}

			if ($this->config->get('config_cart_weight')) {
				$weight = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
			}


			$maximum = $product_info['quantity'];

			$products[] = array(
				'id'       	=> $product['product_id'],
				'key'       => $product['key'],
				'thumb'     => $image,
				'name'      => $product['name'],
				'model'     => $product['model'],
				'option'    => $option_data,
				'quantity'  => $product['quantity'],
				'total'     => $total,
				'href'      => htmlspecialchars_decode($this->url->link('product/product', 'product_id=' . $product['product_id'])),
				'recurring' => isset($product['recurring']) ? $product['recurring'] : NULL,
				'profile'   => isset($product['profile_name']) ? $product['profile_name'] : NULL,
				'minimum'   => $product['minimum'],
				'maximum'   => $maximum,
				'model'  		=> $product_info['model'],
				'sku'  			=> $product_info['sku'],
				'brand_name'=> $product_info['manufacturer'],
				'brand_url' => htmlspecialchars_decode($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id'])),
				'special'   => $special,
				'total_alone'   => $totalAlone,
				'special_alone'   => $specialAlone
			);
		}

		/** Gift Voucher **/

		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $key => $voucher) {
				$vouchers[] = array(
					'key'         => $key,
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'])
				);
			}
		}

		$this->response->setOutput(json_encode(array(
			'products' 	=> $products,
			'vouchers' 	=> $vouchers,
			'totals'	 	=> $totals,
			'count'			=> $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0),
			'total'			=> $this->currency->format($total_data[sizeof ($total_data) - 1]['value']),
			'profile'	 	=> $this->language->get('text_payment_profile') ? $this->language->get('text_payment_profile') : NULL,
			'weight'	 	=> $weight
		)));
	}
	
	/* Currency Format
	---------------------------------------------------------------------------------------------------------------------------*/	
	public function currencyFormat()
	{
		$result = 0;

		if (!empty($this->request->post['sum']))
		{
			/** Models **/
			$this->load->model('extension/extension');
			$this->load->model('setting/setting');

		$result = $this->currency->format($this->request->post['sum']);
    }


		$this->response->setOutput(json_encode(array(
			'format' => $result
		)));
	}

	/* Quantity Update
	---------------------------------------------------------------------------------------------------------------------------*/
	public function quantityUpdate()
	{
		if (!empty($this->request->post['quantity']))
		{
			foreach ($this->request->post['quantity'] as $key => $value) {
    		$this->cart->update($key, $value);
    	}

    	unset($this->session->data['shipping_method']);
    	unset($this->session->data['shipping_methods']);
    	unset($this->session->data['payment_method']);
    	unset($this->session->data['payment_methods']);
    	unset($this->session->data['reward']);
    }

		return $this->loader();
	}
	
	/* Remove Products
	---------------------------------------------------------------------------------------------------------------------------*/	
	public function removeProduct() {
		if (isset($this->request->post['remove'])) {
			$this->cart->remove($this->request->post['remove']);

			unset($this->session->data['vouchers'][$this->request->post['remove']]);
		}
		
		return $this->loader();
	}

	/* Add Products
	---------------------------------------------------------------------------------------------------------------------------*/	
	
	public function addProduct() {
		$this->language->load('checkout/cart');

		$json = array();

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if (isset($this->request->post['quantity'])) {
				$quantity = $this->request->post['quantity'];
			} else {
				$quantity = 1;
			}

			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();	
			}

			$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

			foreach ($product_options as $product_option) {
				if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
					$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
				}
			}

			if (isset($this->request->post['recurring_id'])) {
				$recurring_id = $this->request->post['recurring_id'];
			} else {
				$recurring_id = 0;
			}

			$recurrings = $this->model_catalog_product->getProfiles($product_info['product_id']);

			if ($recurrings) {
				$recurring_ids = array();

				foreach ($recurrings as $recurring) {
					$recurring_ids[] = $recurring['recurring_id'];
				}

				if (!in_array($recurring_id, $recurring_ids)) {
					$json['error']['recurring'] = $this->language->get('error_recurring_required');
				}
			}

			if (!$json) {
				$this->cart->add($this->request->post['product_id'], $quantity, $option, $recurring_id);

				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);

				// Totals
				$this->load->model('extension/extension');

				$total_data = array();
				$total = 0;
				$taxes = $this->cart->getTaxes();

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

							$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
						}
					}

					$sort_order = array();

					foreach ($total_data as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
					}

					array_multisort($sort_order, SORT_ASC, $total_data);
				}

				return $this->loader();
			} else {
				$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
				$this->response->setOutput(json_encode($json));
			}
		}
	}
	
	/* Get Product Options
	---------------------------------------------------------------------------------------------------------------------------*/	
	
	public function productOptions() {
		$json = array();
		
		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}
		
		$this->load->model('extension/extension');
		$this->load->model('catalog/product');										
		$this->load->model('tool/image');
		$this->load->model('setting/setting');
		
		$total_data = array();					
		$total = 0;
		$taxes = $this->cart->getTaxes();

		$tools = $this->model_setting_setting->getSetting('kw_flycart');
		
		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		if ($product_info) {

			$minimum = ($product_info['minimum'] > 0) ? $product_info['minimum'] : 1;

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$total = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')) * $minimum);
				$total_price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$total = false;
				$total_price = false;
			}

			if ((float)$product_info['special']) {
				$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')) * $minimum);
				$special_price = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
				$special_price = false;
			}

			$options = array();

			foreach ($this->model_catalog_product->getProductOptions($product_info['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false));
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$options[] = array(
					'product_option_id'    => $option['product_option_id'],
					'option_value'         => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);

				if ($product_info['image'])
				{
					if (isset($tools['kw_flycart_tools']['retina']) && $tools['kw_flycart_tools']['retina'] === 'true')
					{
						$image = $this->model_tool_image->resize($product_info['image'], 60, 60);
					}
					else {
						$image = $this->model_tool_image->resize($product_info['image'], 30, 30);
					}
				}
				else {
					if (isset($tools['kw_flycart_tools']['retina']) && $tools['kw_flycart_tools']['retina'] === 'true')
					{
						$image = $this->model_tool_image->resize('kw_no_image.png', 60, 60);
					}
					else {
						$image = $this->model_tool_image->resize('kw_no_image.png', 30, 30);
					}
				}

				$options['minimum'] = $minimum;
				$options['maximum'] = $product_info['quantity'];
				$options['product_id'] = $product_info['product_id'];
				$options['name'] = $product_info['name'];
				$options['image'] = $image;
				$options['total'] = $total;
				$options['special'] = $special;
				$options['tax'] = $this->tax->calculate(0, $product_info['tax_class_id'], $this->config->get('config_tax'));
				$options['total_price'] = $total_price;
				$options['special_price'] = $special_price;
			}

			if (!$json) {
				$json = $options;
			}
		}

		$this->response->setOutput(json_encode($json));
	}
	
	/* Get Product Image
	---------------------------------------------------------------------------------------------------------------------------*/	
	
	public function productImage() {
		
		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}
		
		if (isset($this->request->post['width'])) {
			$width = $this->request->post['width'];
		} else {
			$width = 100;
		}		
		if (isset($this->request->post['height'])) {
			$height = $this->request->post['height'];
		} else {
			$height = 100;
		}
		
		$this->load->model('catalog/product');										
		$this->load->model('tool/image');
		
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$json = $product_info['image'] ? $this->model_tool_image->resize($product_info['image'], $width, $height) : $this->model_tool_image->resize('kw_no_image.png', $width, $height);
		
		$this->response->setOutput($json);
	}

	/* Get Product Minimal
	---------------------------------------------------------------------------------------------------------------------------*/

	public function productMinimal() {
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if (isset($product_info['minimum']) && (int) $product_info['minimum'] > 1) {
			$minimum = (int) $product_info['minimum'];
		}
		else {
			$minimum = 1;
		}


		$this->response->setOutput(json_encode( $minimum ));
	}
}

?>