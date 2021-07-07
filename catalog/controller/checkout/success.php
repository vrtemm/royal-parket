<?php
class ControllerCheckoutSuccess extends Controller {
	public function index() {
		$this->load->language('checkout/success');

		if (isset($this->session->data['order_id'])) {	
		
		//NOC get Order-id
	$order_id = $this->session->data['order_id'];
	
	//NOC get Order-details
	if(isset($order_id))
	{
		//LOAD MODEL
		$this->load->model('checkout/order');
		
		//GET ORDER DETAILS
		$order_info = $this->model_checkout_order->getOrder($order_id);
		
		//NEW MODEL TO COLLECT TAX
		$get_order_tax = $this->model_checkout_order->getOrderTax($order_id);
		
		if($get_order_tax){
				//ASSIGN TAX TO NEW VARIABLE
				$order_tax = $get_order_tax['value'];
		} else {
				//THERE WAS NO TAX COLLECTED
				$order_tax = 0;
		}
		
		//NEW MODEL TO COLLECT SHIPPING
		$get_order_shipping = $this->model_checkout_order->getOrderShipping($order_id);
		
		if($get_order_shipping){
				//ASSIGN SHIPPING TO NEW VARIABLE
				$order_shipping = $get_order_shipping['value'];
		} else {
				//THERE WAS NO SHIPPING COLLECTED
				$order_shipping = 0;
		}
		
		//NEW MODEL TO COLLECT ALL PRODUCTS ASSOCIATED WITH ORDER
		$get_order_products = $this->model_checkout_order->getOrderProducts($order_id);
		
		//CREATE ARRAY TO HOLD PRODUCTS
		$order_products = array();
		
		foreach($get_order_products as $prod){				
		
				$order_products[] = array(
						'order_id'  => $order_id,
						'model'     => $prod['model'],
						'name'      => $prod['name'],
						'category'  => '',
						'price'     => number_format($prod['price'], 2, '.', ','),
						'quantity'  => $prod['quantity']
				);
		
		}
		
		//NEW ORDER ARRAY
		$order_tracker = array(
				'order_id'    => $order_id,
				'store_name'  => $order_info['store_name'],
				'total'       => $order_info['total'],
				'tax'         => $order_tax,
				'shipping'    => $order_shipping,
				'city'        => $order_info['payment_city'],
				'state'       => $order_info['payment_zone'],
				'country'     => $order_info['payment_country'],
				'currency'    => $order_info['currency_code'],
				'products'    => $order_products
		);   
		$data['order_tracker'] = $order_tracker;
	}
		
		
				
			$this->cart->clear();

			// Add to activity log
			$this->load->model('account/activity');

			if ($this->customer->isLogged()) {
				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
					'order_id'    => $this->session->data['order_id']
				);

				$this->model_account_activity->addActivity('order_account', $activity_data);
			} else {
				$activity_data = array(
					'name'     => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
					'order_id' => $this->session->data['order_id']
				);

				$this->model_account_activity->addActivity('order_guest', $activity_data);
			}

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('checkout/success')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', 'SSL'), $this->url->link('account/order', '', 'SSL'), $this->url->link('account/download', '', 'SSL'), $this->url->link('information/contact'));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/success.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/success.tpl', $data));
		}
	}
}