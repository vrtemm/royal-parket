<?php
	
	class ControllerProductCategory extends Controller {
		
		public function index() {
			
			$this->load->language('product/category');
			
			
			
			$this->load->model('catalog/category');
			
			
			
			$this->load->model('catalog/product');
			
			
			
			$this->load->model('tool/image');
			
			
			
			if (isset($this->request->get['filter'])) {
				
				$filter = $this->request->get['filter'];
				
				} else {
				
				$filter = '';
				
			}
			
			
			
			if (isset($this->request->get['sort'])) {
				
				$sort = $this->request->get['sort'];
				
				} else {
				
				$sort = 'p.price';
				
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
			
			
			

		// OCFilter start
    if (isset($this->request->get['filter_ocfilter'])) {
      $filter_ocfilter = $this->request->get['filter_ocfilter'];
    } else {
      $filter_ocfilter = '';
    }
		// OCFilter end
      
			$data['breadcrumbs'] = array();
			
			
			
			$data['breadcrumbs'][] = array(
			
			'text' => $this->language->get('text_home'),
			
			'href' => $this->url->link('common/home')
			
			);
			
			
			
			if (isset($this->request->get['path'])) {
				
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
				
				
				
				$path = '';
				
				
				
				$parts = explode('_', (string)$this->request->get['path']);
				
				
				
				$category_id = (int)array_pop($parts);
				
				
				
				foreach ($parts as $path_id) {
					
					if (!$path) {
						
						$path = (int)$path_id;
						
						} else {
						
						$path .= '_' . (int)$path_id;
						
					}
					
					
					
					$category_info = $this->model_catalog_category->getCategory($path_id);
					
					
					
					if ($category_info) {
						
						$data['breadcrumbs'][] = array(
						
						'text' => $category_info['name'],
						
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
						
						);
						
					}
					
				}
				
				} else {
				
				$category_id = 0;
				
			}
			
			
			
			$category_info = $this->model_catalog_category->getCategory($category_id);
			
			
			
			if ($category_info) {
				
				$this->document->setTitle($category_info['meta_title']);
				
				$this->document->setDescription($category_info['meta_description']);
				
				$this->document->setKeywords($category_info['meta_keyword']);
				
				$this->document->addLink($this->url->link('product/category', 'path=' . $this->request->get['path']), 'canonical');
				
				
				
				$data['heading_title'] = $category_info['name'];
				
				
				
				$data['text_refine'] = $this->language->get('text_refine');
				
				$data['text_empty'] = $this->language->get('text_empty');
				
				$data['text_quantity'] = $this->language->get('text_quantity');
				
				$data['text_manufacturer'] = $this->language->get('text_manufacturer');
				
				$data['text_model'] = $this->language->get('text_model');
				
				$data['text_price'] = $this->language->get('text_price');
				
				$data['text_tax'] = $this->language->get('text_tax');
				
				$data['text_points'] = $this->language->get('text_points');
				
				$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
				
				$data['text_sort'] = $this->language->get('text_sort');
				
				$data['text_limit'] = $this->language->get('text_limit');
				
				$data['text_sale'] = $this->language->get('text_sale');
				
				$data['text_new'] = $this->language->get('text_new');
				
				$data['text_best'] = $this->language->get('text_best');
				
				
				
				$data['button_cart'] = $this->language->get('button_cart');
				
				$data['button_wishlist'] = $this->language->get('button_wishlist');
				
				$data['button_compare'] = $this->language->get('button_compare');
				
				$data['button_continue'] = $this->language->get('button_continue');
				
				$data['button_list'] = $this->language->get('button_list');
				
				$data['button_grid'] = $this->language->get('button_grid');
				
				
				
				// Set the last category breadcrumb
				
				$data['breadcrumbs'][] = array(
				
				'text' => $category_info['name'],
				
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
				
				);
				
				
				
				if ($category_info['image']) {

				if ( ($this->config->get('config_image_category_width') < 300) || ($this->config->get('config_image_category_height') < 300) ) {
				    $this->document->addOGMeta( 'property="og:image"', str_replace(' ', '%20', $this->model_tool_image->resize($category_info['image'], 300, 300)) );
					$this->document->addOGMeta('property="og:image:width"', '300');
					$this->document->addOGMeta('property="og:image:height"', '300');
				} else { 
				    $this->document->addOGMeta( 'property="og:image"', str_replace(' ', '%20', $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'))) );
					$this->document->addOGMeta('property="og:image:width"', $this->config->get('config_image_category_width'));
					$this->document->addOGMeta('property="og:image:height"', $this->config->get('config_image_category_height'));
				}
                
					
					$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
					
					} else {
					

		    	$this->document->addOGMeta( 'property="og:image"', str_replace(' ', '%20', $this->model_tool_image->resize($this->config->get('config_logo'), 300, 300)) );
				$this->document->addOGMeta('property="og:image:width"', '300');
				$this->document->addOGMeta('property="og:image:height"', '300');
                
					$data['thumb'] = '';
					
				}
				
				
				$mypage = $page;
				if ($mypage == 1) {
					$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
					} else {
					$data['description'] = "";
				}
				
				
				$data['compare'] = $this->url->link('product/compare');
				
				
				
				$url = '';
				
				
				
				if (isset($this->request->get['filter'])) {
					
					$url .= '&filter=' . $this->request->get['filter'];
					
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
				
				
				
				$data['categories'] = array();
				
				
				
				$results = $this->model_catalog_category->getCategories($category_id);
				
				
				
				foreach ($results as $result) {
					
					$filter_data = array(
					
					'filter_category_id'  => $result['category_id'],
					
					'filter_sub_category' => true
					
					);
					
					
					
  $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));   
					$data['categories'][] = array(
					
					'name'  => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
,'thumb' => $image
					
					);
					
				}
				
				
				
				$data['products'] = array();
				
				
				
				$filter_data = array(
				
				'filter_category_id' => $category_id,
				
				'filter_filter'      => $filter,
				
				'sort'               => $sort,
				
				'order'              => $order,
				
				'start'              => ($page - 1) * $limit,
				
				'limit'              => $limit
				
				);
				
				
				

  		// OCFilter start
  		$filter_data['filter_ocfilter'] = $filter_ocfilter;
  		// OCFilter end
      
				$product_total = $this->model_catalog_product->getTotalProducts($filter_data);
				
				
				
				$results = $this->model_catalog_product->getProducts($filter_data);
				
				$data['products'] = $this->model_catalog_product->format($results, $url, true);
				

					
					
					
					$url = '';
					
					
					

      // OCFilter start
			if (isset($this->request->get['filter_ocfilter'])) {
				$url .= '&filter_ocfilter=' . $this->request->get['filter_ocfilter'];
			}
      // OCFilter end
      
					if (isset($this->request->get['filter'])) {
					
					$url .= '&filter=' . $this->request->get['filter'];
					
					}
					
					
					
					if (isset($this->request->get['limit'])) {
					
					$url .= '&limit=' . $this->request->get['limit'];
					
					}
					
					
					
					$data['sorts'] = array();

			/*$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);*/

			$data['sorts'][] = array(
				'text'  => '<i class="fa fa-long-arrow-down"></i>Дешевые',
				'value' => 'p.price-ASC',
				'ts'    => 0,
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);
			
			$data['sorts'][] = array(
				'text'  => '<i class="fa fa-long-arrow-up"></i>Дорогие',
				'value' => 'p.price-DESC',
				'ts'    => 0,
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => 'Популярные',
				'value' => 'p.viewed-DESC',
				'ts'    => 1,
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.viewed&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => 'По рейтингу',
					'ts'    => 1,
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				);

				/*$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);*/
			}

			/*$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);*/
					
					
					$url = '';
					
					
					

      // OCFilter start
			if (isset($this->request->get['filter_ocfilter'])) {
				$url .= '&filter_ocfilter=' . $this->request->get['filter_ocfilter'];
			}
      // OCFilter end
      
					if (isset($this->request->get['filter'])) {
					
					$url .= '&filter=' . $this->request->get['filter'];
					
					}
					
					
					
					if (isset($this->request->get['sort'])) {
					
					$url .= '&sort=' . $this->request->get['sort'];
					
					}
					
					
					
					if (isset($this->request->get['order'])) {
					
					$url .= '&order=' . $this->request->get['order'];
					
					}
					
					
					
					$data['limits'] = array();
					
					
					
					$limits = array_unique(array($this->config->get('config_product_limit'), 48, 72, 96, 120));
					
					
					
					sort($limits);
					
					
					
					foreach($limits as $value) {
					
					$data['limits'][] = array(
					
					'text'  => $value,
					
					'value' => $value,
					
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
					
					);
					
					}
					
					
					
					$url = '';
					
					
					

      // OCFilter start
			if (isset($this->request->get['filter_ocfilter'])) {
				$url .= '&filter_ocfilter=' . $this->request->get['filter_ocfilter'];
			}
      // OCFilter end
      
					if (isset($this->request->get['filter'])) {
					
					$url .= '&filter=' . $this->request->get['filter'];
					
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
					
					
					

		    	$this->document->addOGMeta('property="og:url"', $this->url->link('product/category', 'path=' . $category_info['category_id'] . ( ($page != 1) ? '&page='. $page : '' ), 'SSL') );
                
					$pagination = new Pagination();
					
					$pagination->total = $product_total;
					
					$pagination->page = $page;
					
					$pagination->limit = $limit;
					
					$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');
					
					
					
					$data['pagination'] = $pagination->render();
					
					// $this->document->addLink($this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page='. $pagination->page), 'canonical');
					if($pagination->limit && ceil($pagination->total / $pagination->limit) > $pagination->page) {
					$this->document->addLink($this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page='. ($pagination->page + 1)), 'next');
					}
					if($pagination->page > 1) {
					$this->document->addLink($this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page='. ($pagination->page - 1)), 'prev');
					}
					
					
					
					$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));
					
					
					
					$data['sort'] = $sort;
					
					$data['order'] = $order;
					
					$data['limit'] = $limit;

      // OCFilter Start
      $ocfilter_page_info = $this->load->controller('module/ocfilter/getPageInfo');

      if ($ocfilter_page_info) {
        $this->document->setTitle($ocfilter_page_info['meta_title']);

        if ($ocfilter_page_info['meta_description']) {
			    $this->document->setDescription($ocfilter_page_info['meta_description']);
        }

        if ($ocfilter_page_info['meta_keyword']) {
			    $this->document->setKeywords($ocfilter_page_info['meta_keyword']);
        }

			  $data['heading_title'] = $ocfilter_page_info['title'];

        if ($ocfilter_page_info['description'] && !isset($this->request->get['page']) && !isset($this->request->get['sort']) && !isset($this->request->get['order']) && !isset($this->request->get['search']) && !isset($this->request->get['limit'])) {
        	$data['description'] = html_entity_decode($ocfilter_page_info['description'], ENT_QUOTES, 'UTF-8');
        }
      } else {
        $meta_title = $this->document->getTitle();
        $meta_description = $this->document->getDescription();
        $meta_keyword = $this->document->getKeywords();

        $filter_title = $this->load->controller('module/ocfilter/getSelectedsFilterTitle');

        if ($filter_title) {
          if (false !== strpos($meta_title, '{filter}')) {
            $meta_title = trim(str_replace('{filter}', $filter_title, $meta_title));
          } else {
            $meta_title .= ' ' . $filter_title;
          }

          $this->document->setTitle($meta_title);

          if ($meta_description) {
            if (false !== strpos($meta_description, '{filter}')) {
              $meta_description = trim(str_replace('{filter}', $filter_title, $meta_description));
            } else {
              $meta_description .= ' ' . $filter_title;
            }

  			    $this->document->setDescription($meta_description);
          }

          if ($meta_keyword) {
            if (false !== strpos($meta_keyword, '{filter}')) {
              $meta_keyword = trim(str_replace('{filter}', $filter_title, $meta_keyword));
            } else {
              $meta_keyword .= ' ' . $filter_title;
            }

           	$this->document->setKeywords($meta_keyword);
          }

          $heading_title = $data['heading_title'];

          if (false !== strpos($heading_title, '{filter}')) {
            $heading_title = trim(str_replace('{filter}', $filter_title, $heading_title));
          } else {
            $heading_title .= ' ' . $filter_title;
          }

          $data['heading_title'] = $heading_title;

          $data['description'] = '';
        } else {
          $this->document->setTitle(trim(str_replace('{filter}', '', $meta_title)));
          $this->document->setDescription(trim(str_replace('{filter}', '', $meta_description)));
          $this->document->setKeywords(trim(str_replace('{filter}', '', $meta_keyword)));

          $data['heading_title'] = trim(str_replace('{filter}', '', $data['heading_title']));
        }
      }
      // OCFilter End
      
					
					
					
					$data['continue'] = $this->url->link('common/home');
					
					
					
					$data['column_left'] = $this->load->controller('common/column_left');
					
					$data['column_right'] = $this->load->controller('common/column_right');
					
					$data['content_top'] = $this->load->controller('common/content_top');
					
					$data['content_bottom'] = $this->load->controller('common/content_bottom');
					
					$data['footer'] = $this->load->controller('common/footer');
					
					$data['header'] = $this->load->controller('common/header');
					
					
					
					if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {
					
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/category.tpl', $data));
					
					} else {
					
					$this->response->setOutput($this->load->view('default/template/product/category.tpl', $data));
					
					}
					
					} else {
					
					$url = '';
					
					
					
					if (isset($this->request->get['path'])) {
					
					$url .= '&path=' . $this->request->get['path'];
					
					}
					
					
					
					if (isset($this->request->get['filter'])) {
					
					$url .= '&filter=' . $this->request->get['filter'];
					
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
					
					'text' => $this->language->get('text_error'),
					
					'href' => $this->url->link('product/category', $url)
					
					);
					
					
					
					$this->document->setTitle($this->language->get('text_error'));
					
					
					
					$data['heading_title'] = $this->language->get('text_error');
					
					
					
					$data['text_error'] = $this->language->get('text_error');
					
					
					
					$data['button_continue'] = $this->language->get('button_continue');
					
					
					
					$data['continue'] = $this->url->link('common/home');
					
					
					
					$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');
					
					
					
					$data['column_left'] = $this->load->controller('common/column_left');
					
					$data['column_right'] = $this->load->controller('common/column_right');
					
					$data['content_top'] = $this->load->controller('common/content_top');
					
					$data['content_bottom'] = $this->load->controller('common/content_bottom');
					
					$data['footer'] = $this->load->controller('common/footer');
					
					$data['header'] = $this->load->controller('common/header');
					
					
					
					if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
					
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
					
					} else {
					
					$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
					
					}
					
					}
					
					
					
					}
					
					}					