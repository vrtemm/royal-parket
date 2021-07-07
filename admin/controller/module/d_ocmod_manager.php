<?php
class ControllerModuleDOCMODManager extends Controller {
	
	public $route = 'module/d_ocmod_manager';
	public $mbooth = 'd_ocmod_manager.xml';
	private $error = array();

	public function index() {
		$this->load->language('module/d_ocmod_manager');

		$this->document->setTitle($this->language->get('heading_title_main'));
		$this->document->addScript('view/javascript/shopunity/jquery.autosize.min.js');		
		$this->document->addStyle('view/javascript/shopunity/codemirror/codemirror.css');
		$this->document->addScript('view/javascript/shopunity/codemirror/codemirror.js');
		$this->document->addScript('view/javascript/shopunity/codemirror/css.js');
		
		$this->load->model('module/d_ocmod_manager');

		$this->getList();

	}
	
	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
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
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		$data['refresh'] = $this->url->link('module/d_ocmod_manager/refresh', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['clear'] = $this->url->link('module/d_ocmod_manager/clear', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['add'] = $this->url->link('module/d_ocmod_manager/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('module/d_ocmod_manager/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['modifications'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$modification_total = $this->model_module_d_ocmod_manager->getTotalModifications();

		$results = $this->model_module_d_ocmod_manager->getModifications($filter_data);

		foreach ($results as $result) {
			$data['modifications'][] = array(
				'modification_id' => $result['modification_id'],
				'name'            => $result['name'],
				'author'          => $result['author'],
				'version'         => $result['version'],
				'status'          => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'date_added'      => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'link'            => $result['link'],
				'edit'          => $this->url->link('module/d_ocmod_manager/edit', 'token=' . $this->session->data['token'] . '&modification_id=' . $result['modification_id'], 'SSL'),
				'enable'          => $this->url->link('module/d_ocmod_manager/enable', 'token=' . $this->session->data['token'] . '&modification_id=' . $result['modification_id'], 'SSL'),
				'disable'         => $this->url->link('module/d_ocmod_manager/disable', 'token=' . $this->session->data['token'] . '&modification_id=' . $result['modification_id'], 'SSL'),
				'enabled'         => $result['status'],
			);
		}

		$data['heading_title'] = $this->language->get('heading_title_main');
		
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_refresh'] = $this->language->get('text_refresh');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_author'] = $this->language->get('column_author');
		$data['column_version'] = $this->language->get('column_version');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_refresh'] = $this->language->get('button_refresh');
		$data['button_clear'] = $this->language->get('button_clear');
		$data['button_add'] = $this->language->get('button_insert');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_link'] = $this->language->get('button_link');
		$data['button_enable'] = $this->language->get('button_enable');
		$data['button_disable'] = $this->language->get('button_disable');
		$data['button_edit'] = $this->language->get('button_edit');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_log'] = $this->language->get('tab_log');

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_author'] = $this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . '&sort=author' . $url, 'SSL');
		$data['sort_version'] = $this->url->link('extension/version', 'token=' . $this->session->data['token'] . '&sort=author' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $modification_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($modification_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($modification_total - $this->config->get('config_limit_admin'))) ? $modification_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $modification_total, ceil($modification_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		// Log
		$file = DIR_LOGS . 'ocmod.log';

		if (file_exists($file)) {
			$data['log'] = file_get_contents($file, FILE_USE_INCLUDE_PATH, null);
		} else {
			$data['log'] = '';
		}

		$data['clear_log'] = $this->url->link('module/d_ocmod_manager/clearlog', 'token=' . $this->session->data['token'], 'SSL');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/d_ocmod_manager_list.tpl', $data));
	}
	
	protected function getForm($code='') {
				
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		$url = '';
				
		if (isset($this->request->get['modification_id'])) {
			$url .= '&modification_id=' . $this->request->get['modification_id'];
		}
		
		$data['save'] = $this->url->link('module/d_ocmod_manager/save', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['download'] = $this->url->link('module/d_ocmod_manager/download', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['cancel'] = $this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . $url, 'SSL');
						
		$data['heading_title'] = $this->language->get('heading_title_main');
		$data['text_form'] = $this->language->get('text_form');
		$data['code'] = $code;
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_download'] = $this->language->get('button_download');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['token'] = $this->session->data['token'];
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
				
		$this->response->setOutput($this->load->view('module/d_ocmod_manager_form.tpl', $data));
	}
	
	public function add() {
		$this->load->language('module/d_ocmod_manager');

		$this->document->setTitle($this->language->get('heading_title_main'));
		$this->document->addScript('view/javascript/shopunity/jquery.autosize.min.js');		
		$this->document->addStyle('view/javascript/shopunity/codemirror/codemirror.css');
		$this->document->addScript('view/javascript/shopunity/codemirror/codemirror.js');
		$this->document->addScript('view/javascript/shopunity/codemirror/css.js');

		$this->load->model('module/d_ocmod_manager');
				
		$this->getForm();
		
	}
	
	public function edit() {
		$this->load->language('module/d_ocmod_manager');

		$this->document->setTitle($this->language->get('heading_title_main'));
		$this->document->addScript('view/javascript/shopunity/jquery.autosize.min.js');		
		$this->document->addStyle('view/javascript/shopunity/codemirror/codemirror.css');
		$this->document->addScript('view/javascript/shopunity/codemirror/codemirror.js');
		$this->document->addScript('view/javascript/shopunity/codemirror/css.js');

		$this->load->model('module/d_ocmod_manager');
		
		if (isset($this->request->get['modification_id'])) {
			$modification_id = $this->request->get['modification_id'];
			$result = $this->model_module_d_ocmod_manager->getModification($modification_id);
			$this->getForm($result['code']);
		}
	}
	
	public function download() {
		$this->load->language('module/d_ocmod_manager');

		$this->document->setTitle($this->language->get('heading_title_main'));
		$this->document->addScript('view/javascript/shopunity/jquery.autosize.min.js');		
		$this->document->addStyle('view/javascript/shopunity/codemirror/codemirror.css');
		$this->document->addScript('view/javascript/shopunity/codemirror/codemirror.js');
		$this->document->addScript('view/javascript/shopunity/codemirror/css.js');
		
		$this->load->model('module/d_ocmod_manager');
		
		if (isset($this->request->get['modification_id'])) {
			$modification_id = $this->request->get['modification_id'];
			$result = $this->model_module_d_ocmod_manager->getModification($modification_id);	
			$output = $result['code'];
			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($output);
		}
	}
	
	public function save() {
	
		$this->load->language('module/d_ocmod_manager');

		$this->document->setTitle($this->language->get('heading_title_main'));
		$this->document->addScript('view/javascript/shopunity/jquery.autosize.min.js');		
		$this->document->addStyle('view/javascript/shopunity/codemirror/codemirror.css');
		$this->document->addScript('view/javascript/shopunity/codemirror/codemirror.js');
		$this->document->addScript('view/javascript/shopunity/codemirror/css.js');

		$this->load->model('module/d_ocmod_manager');
		
		$url = '';
		$xml = '';
		$modification_id=false;
		
		if (isset($this->request->get['modification_id'])) $modification_id = $this->request->get['modification_id'];
		
		if (isset($this->request->post['code'])) $xml = html_entity_decode($this->request->post['code']);
		
		if ($this->validate()) {
		
			if ($xml) {
				try {
					$dom = new DOMDocument('1.0', 'UTF-8');
					$dom->loadXml($xml);

					$name = $dom->getElementsByTagName('name')->item(0);

					if ($name) {
						$name = $name->nodeValue;
					} else {
						$name = '';
					}

					$author = $dom->getElementsByTagName('author')->item(0);

					if ($author) {
						$author = $author->nodeValue;
					} else {
						$author = '';
					}

					$version = $dom->getElementsByTagName('version')->item(0);

					if ($version) {
						$version = $version->nodeValue;
					} else {
						$version = '';
					}

					$link = $dom->getElementsByTagName('link')->item(0);

					if ($link) {
						$link = $link->nodeValue;
					} else {
						$link = '';
					}

					$modification_data = array(
						'name'       => $name,
						'author'     => $author,
						'version'    => $version,
						'link'       => $link,
						'code'       => $xml,
						'status'     => 1
					);
					
					if ($modification_id) $this->model_module_d_ocmod_manager->deleteModification($modification_id);
					$this->model_module_d_ocmod_manager->addModification($modification_data);
					
				} catch(Exception $exception) {
					$json['error'] = sprintf($this->language->get('error_exception'), $exception->getCode(), $exception->getMessage(), $exception->getFile(), $exception->getLine());
				}
			}
		
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('module/d_ocmod_manager/', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		
		$this->getForm($xml);
	}
	
	public function delete() {
		$this->load->language('module/d_ocmod_manager');

		$this->document->setTitle($this->language->get('heading_title_main'));
		$this->document->addScript('view/javascript/shopunity/jquery.autosize.min.js');		
		$this->document->addStyle('view/javascript/shopunity/codemirror/codemirror.css');
		$this->document->addScript('view/javascript/shopunity/codemirror/codemirror.js');
		$this->document->addScript('view/javascript/shopunity/codemirror/css.js');

		$this->load->model('module/d_ocmod_manager');

		if (isset($this->request->post['selected']) && $this->validate()) {
			foreach ($this->request->post['selected'] as $modification_id) {
				$this->model_module_d_ocmod_manager->deleteModification($modification_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function refresh() {
		$this->load->language('module/d_ocmod_manager');

		$this->document->setTitle($this->language->get('heading_title_main'));

		$this->load->model('module/d_ocmod_manager');

		if ($this->validate()) {
			//Log
			$log = array();

			// Clear all modification files
			$files = glob(DIR_MODIFICATION . '{*.php,*.tpl}', GLOB_BRACE);

			if ($files) {
				foreach ($files as $file) {
					if (file_exists($file)) {
						unlink($file);
					}
				}
			}

			// Begin
			$xml = array();

			// Load the default modification XML
			$xml[] = file_get_contents(DIR_SYSTEM . 'modification.xml');

			// Get the default modification file
			$results = $this->model_module_d_ocmod_manager->getModifications();

			foreach ($results as $result) {
				if ($result['status']) {
					$xml[] = $result['code'];
				}
			}

			$modification = array();

			foreach ($xml as $xml) {
				$dom = new DOMDocument('1.0', 'UTF-8');
				$dom->preserveWhiteSpace = false;
				$dom->loadXml($xml);

				// Log
				$log[] = 'MOD: ' . $dom->getElementsByTagName('name')->item(0)->textContent;

				$files = $dom->getElementsByTagName('modification')->item(0)->getElementsByTagName('file');

				foreach ($files as $file) {
					$operations = $file->getElementsByTagName('operation');

					$path = '';

					// Get the full path of the files that are going to be used for modification
					if (substr($file->getAttribute('path'), 0, 7) == 'catalog') {
						$path = DIR_CATALOG . str_replace('../', '', substr($file->getAttribute('path'), 8));
					}

					if (substr($file->getAttribute('path'), 0, 5) == 'admin') {
						$path = DIR_APPLICATION . str_replace('../', '', substr($file->getAttribute('path'), 6));
					}

					if (substr($file->getAttribute('path'), 0, 6) == 'system') {
						$path = DIR_SYSTEM . str_replace('../', '', substr($file->getAttribute('path'), 7));
					}

					if ($path) {
						$files = glob($path, GLOB_BRACE);

						if ($files) {
							foreach ($files as $file) {
								// Get the key to be used for the modification cache filename.
								if (substr($file, 0, strlen(DIR_CATALOG)) == DIR_CATALOG) {
									$key = 'catalog/' . substr($file, strlen(DIR_CATALOG));
								}

								if (substr($file, 0, strlen(DIR_APPLICATION)) == DIR_APPLICATION) {
									$key = 'admin/' . substr($file, strlen(DIR_APPLICATION));
								}

								if (substr($file, 0, strlen(DIR_SYSTEM)) == DIR_SYSTEM) {
									$key = 'system/' . substr($file, strlen(DIR_SYSTEM));
								}

								if (!isset($modification[$key])) {
									$content = file_get_contents($file);

									$content = preg_replace('~\r?\n~', "\n", $content);

									$modification[$key] = $content;
									$original[$key] = $content;

									// Log
									$log[] = 'FILE: ' . $key;
								}

								foreach ($operations as $operation) {
									// Search and replace
									if ($operation->getElementsByTagName('search')->item(0)->getAttribute('regex') != 'true') {
										$search = $operation->getElementsByTagName('search')->item(0)->textContent;
										$trim = $operation->getElementsByTagName('search')->item(0)->getAttribute('trim');
										$offset = $operation->getElementsByTagName('search')->item(0)->getAttribute('offset');
										$limit = $operation->getElementsByTagName('search')->item(0)->getAttribute('limit');
										$add = $operation->getElementsByTagName('add')->item(0)->textContent;
										$position = $operation->getElementsByTagName('add')->item(0)->getAttribute('position');

										// Trim
										if (!$trim || $trim == 'true') {
											$search = trim($search);
										}

										switch ($position) {
											default:
											case 'replace':
												$replace = $add;
												break;
											case 'before':
												$replace = $add . $search;
												break;
											case 'after':
												$replace = $search . $add;
												break;
										}

										$i = 0;
										$pos = -1;
										$match = array();

										// Create an array of all the start postions of all the matched code
										while (($pos = strpos($modification[$key], $search, $pos + 1)) !== false) {
											$match[$i++] = $pos;
										}

										// Offset
										if (!$offset) {
											$offset = 0;
										}

										// Limit
										if (!$limit) {
											$limit = count($match);
										} else {
											$limit = $offset + $limit;
										}

										// Log
										$log[] = 'CODE: ' . $search;

										$status = false;

										// Only replace the occurance of the string that is equal to the between the offset and limit
										for ($i = $offset; $i < $limit; $i++) {
											if (isset($match[$i])) {
												$modification[$key] = substr_replace($modification[$key], $replace, $match[$i], strlen($search));

												// Log
												$log[] = 'LINE: ' . (substr_count(substr($modification[$key], 0, $match[$i]), "\n") + 1);

												$status = true;
											}
										}

										if (!$status) {
											$log[] = 'NOT FOUND!';
										}
									} else {
										$search = $operation->getElementsByTagName('search')->item(0)->textContent;
										$replace = $operation->getElementsByTagName('add')->item(0)->textContent;
										$limit = $operation->getElementsByTagName('search')->item(0)->getAttribute('limit');

										// Limit
										if (!$limit) {
											$limit = -1;
										}

										// Log
										$match = array();

										preg_match_all($search, $modification[$key], $match, PREG_OFFSET_CAPTURE);

										// Remove part of the the result if a limit is set.
										if ($limit > 0) {
											$match[0] = array_slice($match[0], 0, $limit);
										}

										if ($match[0]) {
											$log[] = 'REGEX: ' . $search;

											for ($i = 0; $i < count($match[0]); $i++) {
												$log[] = 'LINE: ' . (substr_count(substr($modification[$key], 0, $match[0][$i][1]), "\n") + 1);
											}
										} else {
											$log[] = 'NOT FOUND!';
										}

										// Make the modification
										$modification[$key] = preg_replace($search, $replace, $modification[$key], $limit);
									}
								}
							}
						}
					}

					// Log
					$log[] = '----------------------------------------------------------------';
				}
			}

			// Log
			$ocmod = new Log('ocmod.log');
			$ocmod->write(implode("\n", $log));

			// Write all modification files
			foreach ($modification as $key => $value) {
				// Only create a file if there are changes
				if ($original[$key] != $value) {
					$path = '';

					$directories = explode('/', dirname($key));

					foreach ($directories as $directory) {
						$path = $path . '/' . $directory;

						if (!is_dir(DIR_MODIFICATION . $path)) {
							@mkdir(DIR_MODIFICATION . $path, 0777);
						}
					}

					$handle = fopen(DIR_MODIFICATION . $key, 'w');

					fwrite($handle, $value);

					fclose($handle);
				}
			}

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function clear() {
		$this->load->language('module/d_ocmod_manager');

		$this->document->setTitle($this->language->get('heading_title_main'));

		$this->load->model('module/d_ocmod_manager');

		if ($this->validate()) {
			// Make path into an array
			$path = array(DIR_MODIFICATION . '*');

			// While the path array is still populated keep looping through
			while (count($path) != 0) {
				$next = array_shift($path);

				foreach (glob($next) as $file) {
					// If directory add to path array
					if (is_dir($file)) {
						$path[] = $file . '/*';
					}

					// Add the file to the files to be deleted array
					$files[] = $file;
				}
			}
			
			// Reverse sort the file array
			rsort($files);
			
			// Clear all modification files
			foreach ($files as $file) {
				if ($file != DIR_MODIFICATION . 'index.html') {
					// If file just delete
					if (is_file($file)) {
						unlink($file);
	
					// If directory use the remove directory function
					} elseif (is_dir($file)) {
						rmdir($file);
					}
				}
			}					

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function enable() {
		$this->load->language('module/d_ocmod_manager');

		$this->document->setTitle($this->language->get('heading_title_main'));

		$this->load->model('module/d_ocmod_manager');

		if (isset($this->request->get['modification_id']) && $this->validate()) {
			$this->model_module_d_ocmod_manager->enableModification($this->request->get['modification_id']);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function disable() {
		$this->load->language('module/d_ocmod_manager');

		$this->document->setTitle($this->language->get('heading_title_main'));

		$this->load->model('module/d_ocmod_manager');

		if (isset($this->request->get['modification_id']) && $this->validate()) {
			$this->model_module_d_ocmod_manager->disableModification($this->request->get['modification_id']);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function clearlog() {
		$this->load->language('module/d_ocmod_manager');

		if ($this->validate()) {
			$handle = fopen(DIR_LOGS . 'ocmod.log', 'w+');

			fclose($handle);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('module/d_ocmod_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/d_ocmod_manager')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
	
	private function userPermission($permission = 'modify') {
		$this->language->load('module/d_ocmod_manager');
		
		if (!$this->user->hasPermission($permission, 'module/d_ocmod_manager')) {
            $this->session->data['error'] = $this->language->get('error_permission');
            return false;
		}else{
        	return true;
		}
	}  

	public function get_version(){
		$xml = file_get_contents(DIR_SYSTEM . 'mbooth/xml/' . $this->mbooth);

		$mbooth = new SimpleXMLElement($xml);

		return $mbooth->version ;
	}
		
	public function version_check(){
		$json = array();
		$mbooth = $this->mbooth;
		$this->load->language($this->route);
		$str = file_get_contents(DIR_SYSTEM . 'mbooth/xml/' . $this->mbooth);
		$xml = new SimpleXMLElement($str);
	
		$current_version = $xml->version ;
	
		$check_version_url = 'http://opencart.dreamvention.com/update/index.php?mbooth=' . $mbooth ;
		
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $check_version_url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		$return_data = curl_exec($curl);
		$return_code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
		curl_close($curl);

      if ($return_code == 200) {
         $data = simplexml_load_string($return_data);
	
         if ((string) $data->version == (string) $current_version || (string) $data->version <= (string) $current_version) {
			 
           $json['success']   = $this->language->get('text_no_update');

         } elseif ((string) $data->version > (string) $current_version) {
			 
			$json['attention']   = $this->language->get('text_new_update');
				
			foreach($data->updates->update as $update){

				if((string) $update->attributes()->version > (string)$current_version){
					$version = (string)$update->attributes()->version;
					$json['update'][$version] = (string) $update[0];
				}
			}
         } else {
            $json['error']   = $this->language->get('text_error_update');
         }
      } else { 
         $json['error']   =  $this->language->get('text_error_failed');
      }
		 $json['asdasd']= 'asdasda';
	      if (file_exists(DIR_SYSTEM.'library/json.php')) { 
	         $this->load->library('json');
	         $this->response->setOutput(Json::encode($json));
	      } else {
	         $this->response->setOutput(json_encode($json));
	      }
	}
}