<?php
class ControllerModuleCurrencycourse extends Controller {
	private $error = array(); 

	public function index() {   
		$this->language->load('module/currencycourse');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		

		$data['heading_title'] = $this->language->get('heading_title');
		$data['button_cancel'] = $this->language->get('button_cancel');
$data['text'] = $this->language->get('text');
		

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
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
			'href'      => $this->url->link('module/currencycourse', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['action'] = $this->url->link('module/currencycourse', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['token'] = $this->session->data['token'];


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/currencycourse.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/currencycourse')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	public function install() {
$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "product_currency` (
  `product_id` int(11) NOT NULL,
  `price_currency` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;"); 

} 

public function uninstall() {
$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "product_currency`"); 
}
}
?>