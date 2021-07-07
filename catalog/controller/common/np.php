<?php
class ControllerCommonNp extends Controller {
	public function index() {
		$qnt = $this->request->get['quantity'];
		$product_id = $this->request->get['product'];
		$ref = $this->request->get['ref'];
		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		if(!(int)$product_info['weight']) {
			$weight = 5 * $qnt;
		} else {
			$weight = (int)$product_info['weight'] * $qnt;
		}
		if($product_info['special']) {
			$price = (int)($product_info['special'] * $qnt);
		} else {
			$price = (int)($product_info['price'] * $qnt);
		}
		require_once(DIR_APPLICATION . 'model/tool/NovaPoshtaApi2.php');
		$NP = new NovaPoshtaApi2('7c3ecdfb5614d67805ae9168f5193e17');
		
		$result = $NP->getDocumentPrice('db5c88d0-391c-11dd-90d9-001a92567626', $ref, 'WarehouseWarehouse', $weight, $price);
		if($result['success']) {
			$data['success'] = true;
			$data['cost'] = $result['data'][0]['Cost'];
		} else {
			$data['success'] = false;
		}
		$this->response->setOutput($this->load->view('default/template/common/np.tpl', $data));
	}
	
	public function city() {
		require_once(DIR_APPLICATION . 'model/tool/NovaPoshtaApi2.php');
		$data['products'] = array();
		if (isset($this->request->get['search']) && strlen($this->request->get['search']) > 3) {
			
			$search = $this->request->get['search'];
			$NP = new NovaPoshtaApi2('7c3ecdfb5614d67805ae9168f5193e17');
			$cities = $NP->getCities(0, $search);

			foreach($cities['data'] as $city) {
				$data['products'][] = array(
					'name'        => $city['DescriptionRu'],
					'href'        => $city['Ref']
				);
			}
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput( json_encode( $data['products'] ) );
	}
}