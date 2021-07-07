<?php
class ModelModulePopupCartExtended extends Model {

	public function getProducts($product_id) {
		$product_data = array();
		$limit = 10;
		
		if (isset($product_id) && $product_id > 0) {
						
			$query = $this->db->query("SELECT op.product_id FROM " . DB_PREFIX . "order_product op INNER JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id) INNER JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)  WHERE EXISTS (SELECT 1 FROM " . DB_PREFIX . "order_product op1  WHERE op1.order_id = op.order_id AND op1.product_id = '" .(int)$product_id . "' ) AND op.product_id <> '" . (int)$product_id . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' GROUP BY op.product_id LIMIT " . (int)$limit);
			
			foreach ($query->rows as $result) {
				$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
			}					
		}
		
		return $product_data;
	}
}
?>