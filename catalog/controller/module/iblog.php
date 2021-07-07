<?php
	class ControllerModuleiBlog extends Controller {
	
	private $moduleName = 'iBlog';
	private $moduleNameSmall = 'iblog';
	private $moduleData_module = 'iblog_module';
	private $moduleModel = 'model_module_iblog';
	
	public function index($setting) {

  	}

	private function getStore($store_id) {    
        if($store_id && $store_id != 0) {
            $store = $this->model_setting_store->getStore($store_id);
        } else {
            $store['store_id'] = 0;
            $store['name'] = $this->config->get('config_name');
            $store['url'] = $this->getCatalogURL();
        }
        return $store;
    }
	
	private function getCatalogURL(){
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTP_SERVER;
        } else {
            $storeURL = HTTPS_SERVER;
        } 
        return $storeURL;
    }
	
	public function post() {
		$this->language->load('module/'.$this->moduleNameSmall);
		$this->load->model('module/'.$this->moduleNameSmall);
		$this->load->model('setting/setting');

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),			
			'separator' => false
		);
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/iblog/listing'),
			'separator' => $this->language->get('text_separator')
		);
		
		if (isset($this->request->get['post_id'])) {
			$post_id = (int)$this->request->get['post_id'];
		} else {
			$post_id = 0;
		}
		
		$moduleSettings						= $this->model_setting_setting->getSetting($this->moduleName, $this->config->get('config_store_id'));
        $data['moduleData']					= isset($moduleSettings[$this->moduleName]) ? ($moduleSettings[$this->moduleName]) : array();
		$post_info							= $this->{$this->moduleModel}->getPost($post_id);
		
		if ($post_info) {												
			$data['breadcrumbs'][] = array(
				'text'      => $post_info['title'],
				'href'      => $this->url->link('module/'.$this->moduleNameSmall.'/post', 'post_id=' . $this->request->get['post_id']),
				'separator' => $this->language->get('text_separator')
			);			
			
			$this->document->setTitle($post_info['title']);
			$this->document->setDescription($post_info['meta_description']);
			$this->document->setKeywords($post_info['meta_keyword']);

			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			
			$data['heading_title'] = $post_info['title'];
			
			$this->load->model('tool/image');

			if ($post_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($post_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$data['popup'] = '';
			}
			
			if ($post_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($post_info['image'], $data['moduleData']['MainImageWidth'], $data['moduleData']['MainImageHeight']);
			} else {
				$data['thumb'] = '';
			}
			
			$data['iblog_keywords'] = $this->language->get('iblog_keywords');
			$data['keywords'] = isset($post_info['meta_keyword']) ? $post_info['meta_keyword'] : $this->language->get('no_keywords');			
			$data['author'] = $post_info['author'];
			$data['date_created'] = date('Y/m/d', strtotime($post_info['created']));
			$data['body'] = html_entity_decode($post_info['body'], ENT_QUOTES, 'UTF-8');
			
			$data['text_author'] = $this->language->get('text_author');
			$data['text_date_created'] = $this->language->get('text_date_created');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/'.$this->moduleNameSmall.'.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/'.$this->moduleNameSmall.'.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/'.$this->moduleNameSmall.'.css');
			}

			$data['column_left']				= $this->load->controller('common/column_left');
			$data['column_right']				= $this->load->controller('common/column_right');
			$data['content_top']				= $this->load->controller('common/content_top');
			$data['content_bottom']				= $this->load->controller('common/content_bottom');
			$data['footer']						= $this->load->controller('common/footer');
			$data['header']						= $this->load->controller('common/header');
	
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/'.$this->moduleNameSmall.'-post.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template').'/template/module/'.$this->moduleNameSmall.'-post.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/module/'.$this->moduleNameSmall.'-post.tpl', $data));
			}  
		} else {
			$data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('iblog/post', 'post_id=' . $post_id),
        		'separator' => $this->language->get('text_separator')
      		);			
		
      		$this->document->setTitle($this->language->get('text_error'));

      		$data['heading_title']				= $this->language->get('text_error');
      		$data['text_error']					= $this->language->get('text_error');
      		$data['button_continue']			= $this->language->get('button_continue');
      		$data['continue']					= $this->url->link('common/home');
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/'.$this->moduleNameSmall.'.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/'.$this->moduleNameSmall.'.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/'.$this->moduleNameSmall.'.css');
			}
			
			$data['column_left']				= $this->load->controller('common/column_left');
			$data['column_right']				= $this->load->controller('common/column_right');
			$data['content_top']				= $this->load->controller('common/content_top');
			$data['content_bottom']				= $this->load->controller('common/content_bottom');
			$data['footer']						= $this->load->controller('common/footer');
			$data['header']						= $this->load->controller('common/header');
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
    	}
	}
	
	public function listing() {
		$this->language->load('module/'.$this->moduleNameSmall);
		
		$this->load->model('setting/setting');
		$this->load->model('tool/image'); 
		$this->load->model('module/'.$this->moduleNameSmall);
		
		$moduleSettings						= $this->model_setting_setting->getSetting($this->moduleName, $this->config->get('config_store_id'));
        $data['moduleData']					= isset($moduleSettings[$this->moduleName]) ? ($moduleSettings[$this->moduleName]) : array();
		$data['heading_title']				= $this->language->get('heading_title');

		$data['text_iblog_empty']			= $this->language->get('text_iblog_empty');
		$data['button_continue']			= $this->language->get('button_continue');
		$data['continue']					= $this->url->link('common/home');
		
		$data['text_display'] = $this->language->get('text_display');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_grid'] = $this->language->get('text_grid');
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');
		$data['iblog_button'] = $this->language->get('iblog_button');
		$data['search_string'] = $this->language->get('search_string');
		$data['search_button'] = $this->language->get('search_button');
		$data['search_placeholder'] = $this->language->get('search_placeholder');

		$data['search_link'] = $this->url->link('module/iblog/search');
		
		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
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

		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
		
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/iblog/listing'),
			'separator' => $this->language->get('text_separator')
		);
		
		$url = '';

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		$data['sorts'] = array();
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_default'),
			'value' => 'p.sort_order-ASC',
			'href'  => $this->url->link('module/iblog/listing', '&sort=p.sort_order&order=ASC' . $url)
		);
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_asc'),
			'value' => 'pd.title-ASC',
			'href'  => $this->url->link('module/iblog/listing', '&sort=pd.title&order=ASC' . $url)
		);
		$data['sorts'][] = array(
			'text'  => $this->language->get('text_name_desc'),
			'value' => 'pd.title-DESC',
			'href'  => $this->url->link('module/iblog/listing', '&sort=pd.title&order=DESC' . $url)
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

		$limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));
		sort($limits);
		foreach($limits as $value){
			$data['limits'][] = array(
				'text'  => $value,
				'value' => $value,
				'href'  => $this->url->link('module/iblog/listing', $url . '&limit=' . $value)
			);
		}

		$postData = array(
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);

		$posts_total = $this->{$this->moduleModel}->getPosts($postData); 
		$total_posts = $this->{$this->moduleModel}->getTotalPosts($this->config->get('config_store_id'));

		foreach ($posts_total as $post) {
			$data['posts'][] = array(
				'post_id'	=> $post['iblog_post_id'],
				'title'		=> $post['title'],
				'image'		=> (isset($post['image'])) ? $this->model_tool_image->resize($post['image'], $data['moduleData']['ListingImageWidth'], $data['moduleData']['ListingImageHeight']) : '',
				'excerpt'	=> $post['excerpt'],
				'href'		=> $this->url->link('module/'.$this->moduleNameSmall.'/post', 'post_id=' . $post['iblog_post_id'])
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
	
		$pagination 						= new Pagination();
		$pagination->total 					= $total_posts;
		$pagination->page 					= $page;
		$pagination->limit 					= $limit;
		$pagination->url 					= $this->url->link('module/iblog/listing', $url.'&page={page}');
		$data['pagination']					= $pagination->render();
		$data['results']					= sprintf($this->language->get('text_pagination'), ($total_posts) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total_posts - $limit)) ? $total_posts : ((($page - 1) * $limit) + $limit), $total_posts, ceil($total_posts / $limit));
		
		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/'.$this->moduleNameSmall.'.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/'.$this->moduleNameSmall.'.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/'.$this->moduleNameSmall.'.css');
		}

		$data['column_left']				= $this->load->controller('common/column_left');
		$data['column_right']				= $this->load->controller('common/column_right');
		$data['content_top']				= $this->load->controller('common/content_top');
		$data['content_bottom']				= $this->load->controller('common/content_bottom');
		$data['footer']						= $this->load->controller('common/footer');
		$data['header']						= $this->load->controller('common/header');
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/'.$this->moduleNameSmall.'-listing.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template').'/template/module/'.$this->moduleNameSmall.'-listing.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/module/'.$this->moduleNameSmall.'-listing.tpl', $data));
		}  

	}
	
	public function search() {
		$this->language->load('module/'.$this->moduleNameSmall);
		
		$this->load->model('module/'.$this->moduleNameSmall);		
		$this->load->model('catalog/product');
		$this->load->model('tool/image'); 
		$this->load->model('setting/setting');
		
		$moduleSettings						= $this->model_setting_setting->getSetting($this->moduleName, $this->config->get('config_store_id'));
        $data['moduleData']					= isset($moduleSettings[$this->moduleName]) ? ($moduleSettings[$this->moduleName]) : array();

		if (isset($this->request->get['search'])) {
			$search = $this->request->get['search'];
		} else {
			$search = '';
		} 
		if (isset($this->request->get['description'])) {
			$description = $this->request->get['description'];
		} else {
			$description = '';
		} 
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
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

		if (isset($this->request->get['search'])) {
			$this->document->setTitle($this->language->get('heading_title_search') .  ' - ' . $this->request->get['search']);
		} else {
			$this->document->setTitle($this->language->get('heading_title_search'));
		}

		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/iblog/listing'),
			'separator' => $this->language->get('text_separator')
		);


		$url = '';
		if (isset($this->request->get['search'])) {
			$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
		}
		if (isset($this->request->get['description'])) {
			$url .= '&description=' . $this->request->get['description'];
		}
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
			'text'      => $this->language->get('heading_title_search'),
			'href'      => $this->url->link('module/iblog/search', $url),
			'separator' => $this->language->get('text_separator')
		);

		if (isset($this->request->get['search'])) {
			$data['heading_title'] = $this->language->get('heading_title_search') .  ' - ' . $this->request->get['search'];
		} else {
			$data['heading_title'] = $this->language->get('heading_title_search');
		}

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_critea'] = $this->language->get('text_critea');
		$data['text_search'] = $this->language->get('text_search');
		$data['text_keyword'] = $this->language->get('text_keyword');
		$data['text_display'] = $this->language->get('text_display');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_grid'] = $this->language->get('text_grid');		
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');
		$data['entry_search'] = $this->language->get('entry_search');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['search_button'] = $this->language->get('search_button');
		$data['iblog_button'] = $this->language->get('iblog_button');

		$data['products'] = array();

		if (isset($this->request->get['search'])) {
			$postData = array(
				'filter_name'         => $search, 
				'filter_description'  => $description,
				'sort'                => $sort,
				'order'               => $order,
				'start'               => ($page - 1) * $limit,
				'limit'               => $limit
			);
			
			$total_posts = $this->{$this->moduleModel}->getTotalPosts($this->config->get('config_store_id'), $postData);
			$results = $this->{$this->moduleModel}->getPosts($postData); 
			
			foreach ($results as $post) {
				$data['posts'][] = array(
					'post_id'	=> $post['iblog_post_id'],
					'title'		=> $post['title'],
					'image'		=> (isset($post['image'])) ? $this->model_tool_image->resize($post['image'], $data['moduleData']['ListingImageWidth'], $data['moduleData']['ListingImageHeight']) : '',
					'excerpt'	=> $post['excerpt'],
					'href'		=> $this->url->link('module/'.$this->moduleNameSmall.'/post', 'post_id=' . $post['iblog_post_id'])
				);	
			}

			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('module/iblog/search', '&sort=p.sort_order&order=ASC' . $url)
			);
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.title-ASC',
				'href'  => $this->url->link('module/iblog/search', '&sort=pd.title&order=ASC' . $url)
			);
			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.title-DESC',
				'href'  => $this->url->link('module/iblog/search', '&sort=pd.title&order=DESC' . $url)
			);
			
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value){
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('module/iblog/search', $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination 						= new Pagination();
			$pagination->total 					= $total_posts;
			$pagination->page 					= $page;
			$pagination->limit 					= $limit;
			$pagination->url 					= $this->url->link('module/iblog/search', $url.'&page={page}');
			$data['pagination']					= $pagination->render();
			$data['results']					= sprintf($this->language->get('text_pagination'), ($total_posts) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total_posts - $limit)) ? $total_posts : ((($page - 1) * $limit) + $limit), $total_posts, ceil($total_posts / $limit));
		}	

		$data['search'] = $search;
		$data['description'] = $description;

		$data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/'.$this->moduleNameSmall.'.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/'.$this->moduleNameSmall.'.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/'.$this->moduleNameSmall.'.css');
		}

		$data['column_left']				= $this->load->controller('common/column_left');
		$data['column_right']				= $this->load->controller('common/column_right');
		$data['content_top']				= $this->load->controller('common/content_top');
		$data['content_bottom']				= $this->load->controller('common/content_bottom');
		$data['footer']						= $this->load->controller('common/footer');
		$data['header']						= $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/'.$this->moduleNameSmall.'-search.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template').'/template/module/'.$this->moduleNameSmall.'-search.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/module/'.$this->moduleNameSmall.'-search.tpl', $data));
		}  
	}
}
?>