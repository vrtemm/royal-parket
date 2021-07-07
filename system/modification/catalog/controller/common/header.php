<?php
class ControllerCommonHeader extends Controller {
	public function index() {

				$data['global_path'] = 'catalog/view/theme/' . $this->config->get('config_template') . '/';
				
		if(isset($this->request->get['ajax'])) {
			return;
		}
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();

    // OCFilter start
    $data['noindex'] = $this->document->isNoindex();
    // OCFilter end
      
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		$data['name'] = $this->config->get('config_name');
 
			$data['maintenance'] = $this->config->get('config_maintenance');
			
		$data['alter_lang'] = $this->getAlterLanguageLinks($this->document->getLinks());

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

 
			if (($data['maintenance']==0)) {
			$data['informations'] = array();
			foreach ($this->model_catalog_information->getInformations() as $result) {
				if ($result['bottom']) {
					$data['informations'][] = array(
						'title' => $result['title'],
						'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
					);
				}
			}	
		}
			
		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');
		$data['text_wishlist'] = $this->language->get('text_wishlist'); 
$data['text_wishlist2'] = (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0);
			
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
 
			
			$data['text_shopcart'] = $this->language->get('text_shopcart');
			$data['text_information'] = $this->language->get('text_information');
			$data['text_service'] = $this->language->get('text_service');
			$data['text_extra'] = $this->language->get('text_extra');
			$data['text_account'] = $this->language->get('text_account');
			$data['text_contact'] = $this->language->get('text_contact');
			$data['text_return'] = $this->language->get('text_return');
			$data['text_sitemap'] = $this->language->get('text_sitemap');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_voucher'] = $this->language->get('text_voucher');
			$data['text_affiliate'] = $this->language->get('text_affiliate');
			$data['text_special'] = $this->language->get('text_special');
			$data['text_account'] = $this->language->get('text_account');
			$data['text_order'] = $this->language->get('text_order');
			$data['text_newsletter'] = $this->language->get('text_newsletter');
			$data['text_category'] = $this->language->get('text_category');
			
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
 
			$data['sitemap'] = $this->url->link('information/sitemap');
			$data['special'] = $this->url->link('product/special');
			$data['contact'] = $this->url->link('information/contact');
			$data['contact'] = $this->url->link('information/contact');
			$data['return'] = $this->url->link('account/return/insert', '', 'SSL');
			$data['sitemap'] = $this->url->link('information/sitemap');
			$data['manufacturer'] = $this->url->link('product/manufacturer', '', 'SSL');
			$data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
			$data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
			$data['account'] = $this->url->link('account/account', '', 'SSL');
			$data['order'] = $this->url->link('account/order', '', 'SSL');
			$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');		
			

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],

				'sort_order' => $category['sort_order'],
			
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		
			if($this->config->get('megamenu_status')=="1")
			{
			
		$this->language->load('module/megamenu');
		$this->load->model('module/megamenu');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		
		
	 
		$data['heading_title'] = $this->language->get('heading_title');		
	
		$data['items']=array();
		$tmp_items= $this->model_module_megamenu->getItems();
		if(count($tmp_items))
		{
			foreach($tmp_items as $item){
			if($item['menu_type']=="category")	{
			$data['items'][]=$this->model_module_megamenu->parseCategory($item);
			}
			if($item['menu_type']=="html")	{
			$data['items'][]=$this->model_module_megamenu->parseHtml($item);
			}
            if($item['menu_type']=="link")	{
			$data['items'][]=$this->model_module_megamenu->parseLink($item);
			}
			if($item['menu_type']=="manufacturer")	{
			$data['items'][]=$this->model_module_megamenu->parseManufacturer($item);
			}
			if($item['menu_type']=="information")	{
			$data['items'][]=$this->model_module_megamenu->parseInformation($item);
			}
			if($item['menu_type']=="product")	{
			$data['items'][]=$this->model_module_megamenu->parseProduct($item);
			}	
			if($item['menu_type']=="auth" && !$this->customer->isLogged())	{
			$data['items'][]=$this->model_module_megamenu->parseAuth($item);
			}
				
				
			}
			
			
			
		}
		
		//auth
		$this->load->language('account/login');
		$this->load->language('module/megamenu');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['text_forgotten'] = $this->language->get('text_forgotten');
		$data['text_register'] = $this->language->get('text_register');
		$data['menu_title'] = $this->language->get('menu_title');
		
		$data['button_login'] = $this->language->get('button_login');
		$data['action'] = $this->url->link('account/login', '', 'SSL');
		$data['email'] = "";
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
		$data['use_megamenu']=true;
	    }
		else
		$data['use_megamenu']=false;
		
	    $data['language'] = $this->load->controller('common/language');
			

				$this->load->model('setting/setting');
				$iBlog = $this->model_setting_setting->getSetting('iBlog', $this->config->get('config_store_id'));
				
				if  ((isset($iBlog['iBlog'])) && ($iBlog['iBlog']['Enabled']== 'yes') && ($iBlog['iBlog']['MainLinkEnabled']== 'yes') && (!empty($iBlog['iBlog']['LinkTitle'][$this->config->get('config_language_id')]))) {
					$data['categories'][] = array(
						'name'     => $iBlog['iBlog']['LinkTitle'][$this->config->get('config_language_id')],
						'children' => array(),
						'column'   => 1,
						'sort_order' => $iBlog['iBlog']['LinkSortOrder'],
						'href'     => $this->url->link('module/iblog/listing')
					);
				}
			
				if (!function_exists('cmpCategoriesOrder')) {
					function cmpCategoriesOrder($a, $b) {
						if ($a['sort_order'] == $b['sort_order']) {
							return 0;
						}
						return ($a['sort_order'] < $b['sort_order']) ? -1 : 1;
					}
				}

				uasort($data['categories'], 'cmpCategoriesOrder');
			
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];				$data['product_id'] = $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;

				if (strpos($data['class'], 'product-product') !== false) {
				  $this->document->addOGMeta('property="og:type"', 'product');
				} elseif (strpos($data['class'], 'information') !== false) {
				  $this->document->addOGMeta('property="og:type"', 'article');
				} else {
				  $this->document->addOGMeta('property="og:type"', 'website');
				}
                
		} else {
			$data['class'] = 'common-home';

				$this->document->addOGMeta('property="og:type"', 'website');
                
		}


				$data['logo_meta'] = str_replace(' ', '%20', $this->model_tool_image->resize($this->config->get('config_logo'), 300, 300));
				$data['ogmeta'] = $this->document->getOGMeta();
                
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
	
	protected function getAlterLanguageLinks($links) {
		$result = array();
		if ($this->config->get('config_seo_url')) {
			foreach($links as $link) {
				if($link['rel']=='canonical') {
					$url=$link['href'];
					$schema = parse_url($url,PHP_URL_SCHEME);
					$server = strtolower($schema)=='https' ? HTTPS_SERVER : HTTP_SERVER; 
					$cur_lang = substr($url, strlen($server),2);
					$query = substr($url, strlen($server)+2);
					$this->load->model('localisation/language');
					$languages = $this->model_localisation_language->getLanguages();
					$active_langs = array();
					foreach($languages as $lang) {
						if($lang['status']) {
							$active_langs[]=$lang['code'];
						} 
					}
					if(in_array($cur_lang, $active_langs)) {
						foreach($active_langs as $lang) {
							$result[$lang] = $server.$lang.($query ? $query : '');
						}
					}
				}
			}
		}
		return $result;
	}
}