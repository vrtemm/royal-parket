<?php
class ControllerCommonSeoUrl extends Controller {
	public function index() {
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);

      // OCFilter start
      if (!is_null($this->registry->get('ocfilter'))) {
  			$this->url->addRewrite($this->registry->get('ocfilter'));
  		}
      // OCFilter end
      
		}

		// Decode URL
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);

            $this->load->model('setting/setting');
			$iBlog = $this->model_setting_setting->getSetting('iBlog',$this->config->get('config_store_id'));
			$ibSeoSlug = isset($iBlog['iBlog']['SeoURL']) ? $iBlog['iBlog']['SeoURL'] : array('iblog');
			
			$parts = array_filter($parts);
			foreach ($ibSeoSlug as $ib_slug) { 
				if (count($parts) == 1 && ($parts[0] == $ib_slug)) {
					$this->request->get['route'] = 'module/iblog/listing';
					return new Action($this->request->get['route']);
				}
				if (count($parts) == 2 && ($parts[1] == 'search')) {
					$this->request->get['route'] = 'module/iblog/search';
					return new Action($this->request->get['route']);
				}
			}
			

			// remove any empty arrays from trailing
			if (utf8_strlen(end($parts)) == 0) {
				array_pop($parts);
			}

			foreach ($parts as $part) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");

				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);

					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}

					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}

					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}

					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}
					
					if ($query->row['query'] && $url[0] != 'information_id' && $url[0] != 'manufacturer_id' && $url[0] != 'category_id' && $url[0] != 'product_id') {
						$this->request->get['route'] = $query->row['query'];
					}
					
				} else {
					

				$iblog = $this->db->query("SELECT id from " . DB_PREFIX . "iblog_post WHERE slug='" . $this->db->escape($parts['1']) . "' LIMIT 1");
				if (!empty($iblog->row['id'])) {
					$this->request->get['post_id'] = $iblog->row['id'];
				} else {
					$this->request->get['route'] = 'error/not_found';
				}
			

					break;
				}
			}

			if (!isset($this->request->get['route'])) {
				if (isset($this->request->get['product_id'])) {
					$this->request->get['route'] = 'product/product';
				} elseif (isset($this->request->get['path'])) {
					$this->request->get['route'] = 'product/category';
				} elseif (isset($this->request->get['manufacturer_id'])) {
					$this->request->get['route'] = 'product/manufacturer/info';
				} elseif (isset($this->request->get['information_id'])) {
					$this->request->get['route'] = 'information/information';
			} elseif (isset($this->request->get['post_id'])) {
				$this->request->get['route'] = 'module/iblog/post';
			
				}
			}

			if (isset($this->request->get['route'])) {
				return new Action($this->request->get['route']);
			}
		}
	}

	public function rewrite($link) {
		$url_info = parse_url(str_replace('&amp;', '&', $link));

		$url = '';

		$data = array();

		parse_str($url_info['query'], $data);

		if (isset($data['route']) && $data['route'] == 'module/iblog/listing') {
			$this->load->model('setting/setting');
			$iBlog = $this->model_setting_setting->getSetting('iBlog',$this->config->get('config_store_id'));
			$ibSeoSlug = isset($iBlog['iBlog']['SeoURL'][$this->config->get('config_language_id')]) ? $iBlog['iBlog']['SeoURL'][$this->config->get('config_language_id')] : 'iblog';
			$url .= '/'.$ibSeoSlug;
		}
		if (isset($data['route']) && $data['route'] == 'module/iblog/search') {
			$this->load->model('module/iblog');
			$iBlog = $this->model_setting_setting->getSetting('iBlog',$this->config->get('config_store_id'));
			$ibSeoSlug = isset($iBlog['iBlog']['SeoURL'][$this->config->get('config_language_id')]) ? $iBlog['iBlog']['SeoURL'][$this->config->get('config_language_id')] : 'iblog';
			$url .= '/'.$ibSeoSlug.'/search';
		}
			

		foreach ($data as $key => $value) {

			if ($data['route'] == 'module/iblog/post' && $key == 'post_id') {
				$iblog = $this->db->query("SELECT slug FROM " . DB_PREFIX . "iblog_post WHERE id='" . $this->db->escape($data['post_id']) . "'");
				if (!empty($iblog->row['slug'])) {
					$this->load->model('setting/setting');
					$iBlog = $this->model_setting_setting->getSetting('iBlog',$this->config->get('config_store_id'));
					$ibSeoSlug = isset($iBlog['iBlog']['SeoURL'][$this->config->get('config_language_id')]) ? $iBlog['iBlog']['SeoURL'][$this->config->get('config_language_id')] : 'iblog';
					$url .= '/'.$ibSeoSlug.'/' . $iblog->row['slug'];
					unset($data[$key]);
					continue;
				}
			}
			
			if (isset($data['route'])) {
				if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id')) {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");

					if ($query->num_rows && $query->row['keyword']) {
						$url .= '/' . $query->row['keyword'];

						unset($data[$key]);
					}
				} elseif ($key == 'path') {
					$categories = explode('_', $value);

					foreach ($categories as $category) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'");

						if ($query->num_rows && $query->row['keyword']) {
							$url .= '/' . $query->row['keyword'];
						} else {
							$url = '';

							break;
						}
					}

					unset($data[$key]);
				} else  {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" .$data['route'] . "'");

					if ($query->num_rows && $query->row['keyword']) {
						$url .= '/' . $query->row['keyword'];

						unset($data[$key]);
					}
				}
			}
		}

		if ($url) {
			unset($data['route']);

			$query = '';

			if ($data) {
				foreach ($data as $key => $value) {
					$query .= '&' . rawurlencode((string)$key) . '=' . rawurlencode((string)$value);
				}

				if ($query) {
					$query = '?' . str_replace('&', '&amp;', trim($query, '&'));
				}
			}

			return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
		} else {
			return $link;
		}
	}
}
