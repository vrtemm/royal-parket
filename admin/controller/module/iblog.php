<?php
class ControllerModuleiBlog extends Controller {
	private $moduleName = 'iBlog';
	private $moduleNameSmall = 'iblog';
	private $moduleData_module = 'iblog_module';
	private $moduleModel = 'model_module_iblog';

    public function index() { 
		$data['moduleName'] = $this->moduleName;
		$data['moduleNameSmall'] = $this->moduleNameSmall;
		$data['moduleData_module'] = $this->moduleData_module;
		$data['moduleModel'] = $this->moduleModel;
	 
        $this->load->language('module/'.$this->moduleNameSmall);
		
        $this->load->model('module/'.$this->moduleNameSmall);
        $this->load->model('setting/store');
		$this->load->model('setting/setting');
        $this->load->model('localisation/language');
 
        $this->document->addStyle('view/stylesheet/'.$this->moduleNameSmall.'/'.$this->moduleNameSmall.'.css');
		$this->document->addScript('view/javascript/'.$this->moduleNameSmall.'/'.$this->moduleNameSmall.'.js');

        $this->document->setTitle($this->language->get('heading_title'));

        if(!isset($this->request->get['store_id'])) {
           $this->request->get['store_id'] = 0; 
        }
	
        $store = $this->getCurrentStore($this->request->get['store_id']);
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) { 	
            if (!empty($_POST['OaXRyb1BhY2sgLSBDb21'])) {
                $this->request->post[$this->moduleName]['LicensedOn'] = $_POST['OaXRyb1BhY2sgLSBDb21'];
            }
            if (!empty($_POST['cHRpbWl6YXRpb24ef4fe'])) {
                $this->request->post[$this->moduleName]['License'] = json_decode(base64_decode($_POST['cHRpbWl6YXRpb24ef4fe']), true);
            }

        	$this->model_setting_setting->editSetting($this->moduleName, $this->request->post, $this->request->post['store_id']);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('module/'.$this->moduleNameSmall, 'store_id='.$this->request->post['store_id'] . '&token=' . $this->session->data['token'], 'SSL'));
        }
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

        $data['breadcrumbs']   = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/'.$this->moduleNameSmall, 'token=' . $this->session->data['token'], 'SSL'),
        );

        $languageVariables = array(
			'heading_title', 'error_permission', 'text_success', 'text_enabled', 'text_disabled', 'button_cancel', 'save_changes', 'text_default', 'text_module', 'entry_code', 'entry_code_help', 'button_add_module', 'button_remove');
       
        foreach ($languageVariables as $languageVariable) {
            $data[$languageVariable] = $this->language->get($languageVariable);
        }

        $data['stores']					= array_merge(array(0 => array('store_id' => '0', 'name' => $this->config->get('config_name') . ' (' . $data['text_default'].')', 'url' => HTTP_SERVER, 'ssl' => HTTPS_SERVER)), $this->model_setting_store->getStores());
        $data['languages']              = $this->model_localisation_language->getLanguages();
        $data['store']                  = $store;
        $data['token']                  = $this->session->data['token'];
        $data['action']                 = $this->url->link('module/'.$this->moduleNameSmall, 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel']                 = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        $data['moduleSettings']			= $this->model_setting_setting->getSetting($this->moduleName, $store['store_id']);
        $data['moduleData']				= (isset($data['moduleSettings'][$this->moduleName])) ? $data['moduleSettings'][$this->moduleName] : array();
		
		$data['url']					= $this->url;
		
		$data['header']					= $this->load->controller('common/header');
		$data['column_left']			= $this->load->controller('common/column_left');
		$data['footer']					= $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('module/'.$this->moduleNameSmall.'.tpl', $data));
    }
	
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'module/'.$this->moduleNameSmall)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
	
    public function install() {
	    $this->load->model('module/'.$this->moduleNameSmall);
	    $this->{$this->moduleModel}->install();
    }
    
    public function uninstall() {
        $this->load->model('module/'.$this->moduleNameSmall);
        $this->load->model('setting/store');
        $this->load->model('localisation/language');
        $this->load->model('design/layout');
		
		$this->model_setting_setting->deleteSetting($this->moduleData_module,0);
		$stores=$this->model_setting_store->getStores();
		foreach ($stores as $store) {
			$this->model_setting_setting->deleteSetting($this->moduleData_module, $store['store_id']);
		}
        $this->load->model('module/'.$this->moduleNameSmall);
        $this->{$this->moduleModel}->uninstall();
    }
	
	
    private function getCatalogURL() {
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTPS_CATALOG;
        } else {
            $storeURL = HTTP_CATALOG;
        } 
        return $storeURL;
    }

    private function getServerURL() {
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTPS_SERVER;
        } else {
            $storeURL = HTTP_SERVER;
        } 
        return $storeURL;
    }

    private function getCurrentStore($store_id) {    
        if($store_id && $store_id != 0) {
            $store = $this->model_setting_store->getStore($store_id);
        } else {
            $store['store_id'] = 0;
            $store['name'] = $this->config->get('config_name');
            $store['url'] = $this->getCatalogURL(); 
        }
        return $store;
    }
	
	public function getPosts() {
		$data['moduleName'] = $this->moduleName;
		$data['moduleNameSmall'] = $this->moduleNameSmall;
		$data['moduleData_module'] = $this->moduleData_module;
		$data['moduleModel'] = $this->moduleModel;
		
		if (!empty($this->request->get['page'])) {
            $page = (int) $this->request->get['page'];
        } else {
			$page = 1;	
		}
			
		if(!isset($this->request->get['store_id'])) {
           $this->request->get['store_id'] = 0;
        } 
		
			
        $this->load->model('module/'.$this->moduleNameSmall);
		
		$data['url_link'] = $this->url;

		$data['store_id']			= $this->request->get['store_id'];
		$data['token']				= $this->session->data['token'];
		$data['limit']				= 10;
		$data['total']				= $this->{$this->moduleModel}->getTotalPosts($this->request->get['store_id']);
		
		$data['sources']			= $this->{$this->moduleModel}->viewPosts($page, $data['limit'], $data['store_id']);
	    $pagination					= new Pagination();
        $pagination->total			= $data['total'];
        $pagination->page			= $page;
        $pagination->limit			= $data['limit']; 
        $pagination->url			= $this->url->link('module/'.$this->moduleNameSmall.'/getPosts','token=' . $this->session->data['token'].'&page={page}&store_id='.$this->request->get['store_id'], 'SSL');
		
		$data['pagination']			= $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($data['total']) ? (($page - 1) * $data['limit']) + 1 : 0, ((($page - 1) * $data['limit']) > ($data['total'] - $data['limit'])) ? $data['total'] : ((($page - 1) * $data['limit']) + $data['limit']), $data['total'], ceil($data['total'] / $data['limit']));	
			
		$this->response->setOutput($this->load->view('module/'.$this->moduleNameSmall.'/view_blogs.tpl', $data));
	}
	
	public function newBlogPost() {
		$this->load->model('tool/image');
		$this->load->model('module/'.$this->moduleNameSmall);
		$this->load->model('localisation/language');
		$this->load->model('user/user');
		
		$this->language->load('module/'.$this->moduleNameSmall);		
		
		$data['text_published'] = $this->language->get('text_published');
    	$data['text_draft'] = $this->language->get('text_draft');
    	$data['text_none'] = $this->language->get('text_none');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');
		
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_body'] = $this->language->get('entry_body');
		$data['entry_excerpt'] = $this->language->get('entry_excerpt');
		$data['entry_slug'] = $this->language->get('entry_slug');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_author'] = $this->language->get('entry_author');
		$data['entry_date_published'] = $this->language->get('entry_date_published');
		$data['entry_featured'] = $this->language->get('entry_featured');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		if(!isset($this->request->get['store_id'])) {
           $this->request->get['store_id'] = 0; 
        }
		$data['store_id'] = $this->request->get['store_id'];
		
		if (isset($this->request->get['post_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$post_info = $this->{$this->moduleModel}->getPost($this->request->get['post_id']);
			$data['post_id'] = $this->request->get['post_id'];
    	}
		
		if (isset($this->request->post['post_description'])) {
			$data['post_description'] = $this->request->post['post_description'];
		} elseif (isset($this->request->get['post_id'])) {
			$data['post_description'] = $this->{$this->moduleModel}->getPostDescriptions($this->request->get['post_id']);
		} else {
			$data['post_description'] = array();
		}
		
		if (isset($this->request->post['slug'])) {
      		$data['slug'] = $this->request->post['slug'];
    	} elseif (!empty($post_info)) {
			$data['slug'] = $post_info['slug'];
		} else {
      		$data['slug'] = '';
    	}
		
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($post_info)) {
			$data['image'] = $post_info['image'];
		} else {
			$data['image'] = '';
		}
		
		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($post_info) && is_file(DIR_IMAGE . $post_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($post_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		if (isset($this->request->post['date_published'])) {
       		$data['date_published'] = $this->request->post['date_published'];
		} elseif (!empty($post_info)) {
			$data['date_published'] = date('Y-m-d H:i:s', strtotime($post_info['created']));
		} else {
			$data['date_published'] = date('Y-m-d H:i:s', time());
		}
				
    	if (isset($this->request->post['status'])) {
      		$data['status'] = $this->request->post['status'];
    	} elseif (!empty($post_info)) {
			$data['status'] = $post_info['is_published'];
		} else {
      		$data['status'] = 1;
    	}
		
		if (isset($this->request->post['featured'])) {
      		$data['featured'] = $this->request->post['featured'];
    	} elseif (!empty($post_info)) {
			$data['featured'] = !empty($post_info['is_featured']);
		} else {
      		$data['featured'] = 0;
    	}
		
		$users = $this->model_user_user->getUsers();
		$data['authors'] = array();
		
		foreach ($users as $user) {
			$data['authors'][] = array(
				'author_id' => $user['user_id'],
				'name' => $user['firstname'] . ' ' . $user['lastname']
			);	
		}
		
		if (isset($this->request->post['author_id'])) {
      		$data['author_id'] = $this->request->post['author_id'];
    	} elseif (!empty($post_info)) {
			$data['author_id'] = $post_info['author_id'];
		} else {
      		$data['author_id'] = 0;
    	}
		
		$data['token'] = $this->session->data['token'];
		
		$this->response->setOutput($this->load->view('module/'.$this->moduleNameSmall.'/add_new.tpl', $data));
	}
	
	public function updatePost() {
		$this->load->model('module/'.$this->moduleNameSmall);

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && (!isset($this->request->post['post_id'])) && $this->validateForm()) {
			$this->{$this->moduleModel}->addPost($this->request->post);
    	} else if ($this->request->server['REQUEST_METHOD'] == 'POST' && (isset($this->request->post['post_id']))) {
			$this->{$this->moduleModel}->editPost($this->request->post['post_id'], $this->request->post);
		}	
	}
	
	public function removePost() {
		$this->load->model('module/'.$this->moduleNameSmall);
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) {
			if (isset($this->request->post['id'])) {
				$this->{$this->moduleModel}->deletePost($this->request->post['id']);
			}
    	}	
	}
}
?>