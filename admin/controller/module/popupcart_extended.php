<?php
class ControllerModulePopUpCartExtended extends Controller {
	//private $error = array(); 
	
	public function index() {   
		$this->load->language('module/popupcart_extended');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		
		$this->load->model('setting/setting');
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			if ($this->request->post['apply']) {
				$url = $this->url->link('module/popupcart_extended', 'token=' . $this->session->data['token'], 'SSL');
			} else {
				$url = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
			}
			
			unset($this->request->post['apply']);
			
			$this->model_setting_setting->editSetting('popupcart_extended', $this->request->post);
		
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($url);
		}
				
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_module'] = $this->language->get('text_module');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['text_head'] = $this->language->get('text_head');
		$data['text_button_name_shopping'] = $this->language->get('text_button_name_shopping');
		$data['text_button_name_shopping_show'] = $this->language->get('text_button_name_shopping_show');
		$data['text_button_name_checkout'] = $this->language->get('text_button_name_checkout');
		$data['text_button_name_cart'] = $this->language->get('text_button_name_cart');
		$data['text_button_name_cart_show'] = $this->language->get('text_button_name_cart_show');
		$data['text_manufacturer_show'] = $this->language->get('text_manufacturer_show');
		$data['text_addtocart_logic'] = $this->language->get('text_addtocart_logic');
		$data['text_button_name_default'] = $this->language->get('text_button_name_default');
		$data['text_click_on_cart'] = $this->language->get('text_click_on_cart');
		$data['text_related_show'] = $this->language->get('text_related_show');
		$data['text_related_heading'] = $this->language->get('text_related_heading');
		$data['text_related_product'] = $this->language->get('text_related_product');
		$data['text_popupcart_extended_module_related_product0'] = $this->language->get('text_popupcart_extended_module_related_product0');
		$data['text_popupcart_extended_module_related_product1'] = $this->language->get('text_popupcart_extended_module_related_product1');
		$data['text_popupcart_extended_module_related_product2'] = $this->language->get('text_popupcart_extended_module_related_product2');
		$data['text_button_name_incart_logic'] = $this->language->get('text_button_name_incart_logic');
		$data['text_button_name_incart_logic_label0'] = $this->language->get('text_button_name_incart_logic_label0');
		$data['text_button_name_incart_logic_label1'] = $this->language->get('text_button_name_incart_logic_label1');
		$data['text_button_name_incart'] = $this->language->get('text_button_name_incart');
		$data['text_button_name_incart_with_options'] = $this->language->get('text_button_name_incart_with_options');
		
		$data['entry_head'] = $this->language->get('entry_head');
		$data['entry_related_heading'] = $this->language->get('entry_related_heading');
		$data['entry_button_name_shopping'] = $this->language->get('entry_button_name_shopping');
		$data['entry_button_name_cart_show'] = $this->language->get('entry_button_name_cart_show');
		$data['entry_button_name_cart'] = $this->language->get('entry_button_name_cart');
		
		$data['entry_button_name_checkout'] = $this->language->get('entry_button_name_checkout');
		$data['entry_button_name_default'] = $this->language->get('entry_button_name_default');
		$data['entry_button_name_incart'] = $this->language->get('entry_button_name_incart');
		$data['entry_button_name_incart_with_options'] = $this->language->get('entry_button_name_incart_with_options');
		
		$data['text_copyright'] = $this->language->get('text_copyright');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_remove'] = $this->language->get('button_remove');
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
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
			'href'      => $this->url->link('module/popupcart_extended', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/popupcart_extended', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['modules'] = array();
		
		if (isset($this->request->post['popupcart_extended_module'])) {
			$data['modules'] = $this->request->post['popupcart_extended_module'];
		} elseif ($this->config->get('popupcart_extended_module')) { 
			$data['modules'] = $this->config->get('popupcart_extended_module');
		}

		$config_vars = array(
			'popupcart_extended_module_head', 
			'popupcart_extended_module_button_shopping_show', 'popupcart_extended_module_button_shopping',
			'popupcart_extended_module_button_cart_show', 'popupcart_extended_module_button_cart',
			'popupcart_extended_module_manufacturer_show',
			'popupcart_extended_module_button_checkout', 
			'popupcart_extended_module_addtocart_logic',
			'popupcart_extended_module_click_on_cart',
			'popupcart_extended_module_related_show',
			'popupcart_extended_module_related_product',
			'popupcart_extended_module_related_heading',
			'popupcart_extended_module_button_incart_logic', 
			'popupcart_extended_module_button_incart',
			'popupcart_extended_module_button_incart_with_options',
		);
	
		foreach ($config_vars as $config_var) {
			if (isset($this->request->post[$config_var])) {
				$data[$config_var] = $this->request->post[$config_var];
			} elseif ($this->config->get($config_var)) {
				$data[$config_var] = $this->config->get($config_var);
			} else {
				$data[$config_var] = '0';
			}
		}		
	
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/popupcart_extended.tpl', $data));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/popupcart_extended')) {
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