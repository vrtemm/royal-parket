<?php 
class ControllerGalleryVideo extends Controller {  
	public function index() { 
		$this->load->language('gallery/video');

		$this->load->model('gallery/video');

		$this->load->model('tool/image'); 

		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/opencart_gallery.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/opencart_gallery.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/opencart_gallery.css');
		}

		$data['heading_title_size'] = $this->config->get('og_heading_title_size');
				
		$heading_title_font = $this->config->get('og_heading_title_font');
		
		if($heading_title_font == 1) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Open+Sans:400,800');
			$data['heading_title_font'] = "'Open Sans', sans-serif";
		} else if ($heading_title_font == 2) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Josefin+Slab:400,700');
			$data['heading_title_font'] = "'Josefin Slab', serif";	
		} else if ($heading_title_font == 3) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Arvo:400,700');
			$data['heading_title_font'] = "'Arvo', serif";
		} else if ($heading_title_font == 6) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Ubuntu:400,700');
			$data['heading_title_font'] = "'Ubuntu', sans-serif";
		} else if ($heading_title_font == 7) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=PT+Sans:400,700');
			$data['heading_title_font'] = "'PT Sans', sans-serif";
		} else if ($heading_title_font == 8) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Old+Standard+TT:400,700');
			$data['heading_title_font'] = "'Old Standard TT', serif";
		} else if ($heading_title_font == 9) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Droid+Sans:400,700');
			$data['heading_title_font'] = "'Droid Sans', sans-serif";
		} else if ($heading_title_font == 10) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Oswald:400,700');
			$data['heading_title_font'] = "'Oswald', sans-serif";
		} else if ($heading_title_font == 11) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Lato:400,700');
			$data['heading_title_font'] = "'Lato', sans-serif";
		} else if ($heading_title_font == 12) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Lobster+Two:400,700');
			$data['heading_title_font'] = "'Lobster Two', cursive";
		} else if ($heading_title_font == 13) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Pacifico');
			$data['heading_title_font'] = "'Pacifico', cursive";
		} else if ($heading_title_font == 14) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Oleo+Script:400,700');
			$data['heading_title_font'] = "'Oleo Script', cursive";
		}else if ($heading_title_font == 21) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Montserrat:400,700');
			$data['heading_title_font'] = "'Montserrat', sans-serif";
		} else if ($heading_title_font == 24) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Inconsolata:400,700');
			$data['heading_title_font'] = "'Inconsolata'";
		} else if ($heading_title_font == 25) {
			$this->document->addStyle('http://fonts.googleapis.com/css?family=Roboto:400,700');
			$data['heading_title_font'] = "'Roboto', sans-serif";
		} else if ($heading_title_font == 27) {
			$data['heading_title_font'] = "Arial";
		} else if ($heading_title_font == 28) {
			$data['heading_title_font'] = "'Times New Roman'";
		} else if ($heading_title_font == 29) {
			$data['heading_title_font'] = "'Tahoma'";
		} else if ($heading_title_font == 30) {
			$data['heading_title_font'] = "'Verdana'";
		} 

		$og_video_per_row = $this->config->get('og_video_per_row');

		if($og_video_per_row == 1) {
			$data['apr'] = 'col-lg-12 col-md-12 col-sm-12';
		} else if($og_video_per_row == 2) {
			$data['apr'] = 'col-lg-6 col-md-6 col-sm-6';
		} else if($og_video_per_row == 3) {
			$data['apr'] = 'col-lg-4 col-md-4 col-sm-6';
		} else if($og_video_per_row == 4) {
			$data['apr'] = 'col-lg-3 col-md-3 col-sm-6';
		} else if($og_video_per_row == 6) {
			$data['apr'] = 'col-lg-2 col-md-2 col-sm-6';
		}

		$data['heading_title_line'] = $this->config->get('og_heading_title_line');

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'v.sort_order';
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
			$limit = $this->config->get('config_catalog_limit');
		}

		// Set the last category breadcrumb		
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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_gallery_video'),
			'href'      => $this->url->link('gallery/video', $url),
			'separator' => $this->language->get('text_separator')
		);

		if (isset($this->request->get['video_id'])) {
			$video_id = $this->request->get['video_id'];
		} else {
			$video_id = 0;
		}

		$video_info = $this->model_gallery_video->getVideo($video_id);

		if ($video_info) {
			$this->document->setTitle($video_info['name']);
			$this->document->setDescription($video_info['meta_description']);
			$this->document->setKeywords($video_info['meta_keyword']);

			$data['heading_title'] = $video_info['name'];

			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_write'] = $this->language->get('text_write');
			$data['text_note'] = $this->language->get('text_note');
			$data['text_share'] = $this->language->get('text_share');
			$data['text_wait'] = $this->language->get('text_wait');			
			
			$data['text_list'] = $this->language->get('text_list');
			$data['text_grid'] = $this->language->get('text_grid');
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');

			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');
			$data['entry_captcha'] = $this->language->get('entry_captcha');

			$this->document->addScript('catalog/view/javascript/jquery/tabs.js');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['og_allow_review'] = $this->config->get('og_allow_review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $video_info['reviews']);

			// Set the last category breadcrumb		
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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text'      => $video_info['name'],
				'href'      => $this->url->link('gallery/video', 'video_id=' . $this->request->get['video_id']),
				'separator' => $this->language->get('text_separator')
			);

			$data['video_id'] = $this->request->get['video_id'];

			if (strpos($video_info['video'], 'youtube') > 0) {
			 	
				$data['video_type'] = 'youtube';

				$parts = explode('v=', (string)$video_info['video']);

				$data['video_code'] = $parts['1'];

			} else if (strpos($video_info['video'], 'vimeo') > 0) {
			
				$data['video_type'] = 'vimeo';

				$parts = explode('com/', (string)$video_info['video']);

				$data['video_code'] = $parts['1'];

			}

			if($this->config->get('og_video_size') == 1) {
				$data['v_width'] = 320;
				$data['v_height'] = 180; 
			} else if($this->config->get('og_video_size') == 2) {
				$data['v_width'] = 432;
				$data['v_height'] = 243; 
			} else if($this->config->get('og_video_size') == 3) {
				$data['v_width'] = 560;
				$data['v_height'] = 315; 
			} else if($this->config->get('og_video_size') == 4) {
				$data['v_width'] = 640;
				$data['v_height'] = 360; 
			} else if($this->config->get('og_video_size') == 5) {
				$data['v_width'] = 672;
				$data['v_height'] = 378; 
			} else if($this->config->get('og_video_size') == 6) {
				$data['v_width'] = 752;
				$data['v_height'] = 423; 
			} else if($this->config->get('og_video_size') == 7) {
				$data['v_width'] = 784;
				$data['v_height'] = 441; 
			} else if($this->config->get('og_video_size') == 8) {
				$data['v_width'] = 896;
				$data['v_height'] = 504; 
			} 

			$data['description'] = html_entity_decode($video_info['description'], ENT_QUOTES, 'UTF-8');
			$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$video_info['reviews']);
			$data['rating'] = (int)$video_info['rating'];
			$data['viewed'] = $video_info['viewed'];

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


			$data['continue'] = $this->url->link('gallery/video');

			$this->model_gallery_video->updateViewed($this->request->get['video_id']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/gallery/video_info.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/gallery/video_info.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/gallery/video_info.tpl', $data));
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

			

			if(isset($this->request->get['video_id'])) {	

				$data['breadcrumbs'][] = array(
					'text'      => $this->language->get('text_error'),
					'href'      => $this->url->link('gallery/video', $url),
					'separator' => $this->language->get('text_separator')
				);

				$this->document->setTitle($this->language->get('text_error'));

				$data['heading_title'] = $this->language->get('text_error');

				$data['text_error'] = $this->language->get('text_error');

				$data['button_continue'] = $this->language->get('button_continue');

				$data['continue'] = $this->url->link('common/home');

				$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
				} else {
					$this->template = 'default/template/error/not_found.tpl';
				}

			} else {

				$this->document->setTitle($this->language->get('heading_title'));

				$data['heading_title'] = $this->language->get('heading_title');

				$data['text_display'] = $this->language->get('text_display');
				$data['text_list'] = $this->language->get('text_list');
				$data['text_grid'] = $this->language->get('text_grid');
				$data['text_sort'] = $this->language->get('text_sort');
				$data['text_limit'] = $this->language->get('text_limit');

				if (isset($this->request->get['sort'])) {
					$sort = $this->request->get['sort'];
				} else {
					$sort = 'v.sort_order';
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
					$limit = $this->config->get('og_video_per_page');
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

				$data['title_size'] = $this->config->get('og_title_size');
				
				$title_font = $this->config->get('og_title_font');
				
				if($title_font == 1) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Open+Sans:400,800');
					$data['title_font'] = "'Open Sans', sans-serif";
				} else if ($title_font == 2) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Josefin+Slab:400,700');
					$data['title_font'] = "'Josefin Slab', serif";	
				} else if ($title_font == 3) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Arvo:400,700');
					$data['title_font'] = "'Arvo', serif";
				} else if ($title_font == 6) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Ubuntu:400,700');
					$data['title_font'] = "'Ubuntu', sans-serif";
				} else if ($title_font == 7) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=PT+Sans:400,700');
					$data['title_font'] = "'PT Sans', sans-serif";
				} else if ($title_font == 8) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Old+Standard+TT:400,700');
					$data['title_font'] = "'Old Standard TT', serif";
				} else if ($title_font == 9) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Droid+Sans:400,700');
					$data['title_font'] = "'Droid Sans', sans-serif";
				} else if ($title_font == 10) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Oswald:400,700');
					$data['title_font'] = "'Oswald', sans-serif";
				} else if ($title_font == 11) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Lato:400,700');
					$data['title_font'] = "'Lato', sans-serif";
				} else if ($title_font == 12) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Lobster+Two:400,700');
					$data['title_font'] = "'Lobster Two', cursive";
				} else if ($title_font == 13) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Pacifico');
					$data['title_font'] = "'Pacifico', cursive";
				} else if ($title_font == 14) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Oleo+Script:400,700');
					$data['title_font'] = "'Oleo Script', cursive";
				}else if ($title_font == 21) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Montserrat:400,700');
					$data['title_font'] = "'Montserrat', sans-serif";
				} else if ($title_font == 24) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Inconsolata:400,700');
					$data['title_font'] = "'Inconsolata'";
				} else if ($title_font == 25) {
					$this->document->addStyle('http://fonts.googleapis.com/css?family=Roboto:400,700');
					$data['title_font'] = "'Roboto', sans-serif";
				} else if ($title_font == 27) {
					$data['title_font'] = "Arial";
				} else if ($title_font == 28) {
					$data['title_font'] = "'Times New Roman'";
				} else if ($title_font == 29) {
					$data['title_font'] = "'Tahoma'";
				} else if ($title_font == 30) {
					$data['title_font'] = "'Verdana'";
				} 

				$data['video_btn'] = $this->config->get('og_video_btn');

				$data['videos'] = array();

				$data_videos = array(
					'sort'               => $sort,
					'order'              => $order,
					'start'              => ($page - 1) * $limit,
					'limit'              => $limit
				);
				
				$data['og_title_font_weight'] = $this->config->get('og_title_font_weight');
				$data['og_video_per_row'] = $this->config->get('og_video_per_row');
				$data['og_video_height'] = $this->config->get('og_video_height');

				$data['og_video_list_size'] = $this->config->get('og_video_list_size');

				if ($data['og_video_list_size'] == 1) {
					$data['img_width'] = 128;  
					$data['img_height'] = 72; 
				} else if($data['og_video_list_size'] == 2) { 
					$data['img_width'] = 160;  
					$data['img_height'] = 90;
				} else if($data['og_video_list_size'] == 3) { 
					$data['img_width'] = 192;  
					$data['img_height'] = 108;
                } else if($data['og_video_list_size'] == 4) { 
                	$data['img_width'] = 224;  
					$data['img_height'] = 126;
                } else if($data['og_video_list_size'] == 5) { 
                	$data['img_width'] = 256;  
					$data['img_height'] = 144; 
                } else if($data['og_video_list_size'] == 6) {
                	$data['img_width'] = 288;  
					$data['img_height'] = 162;
                }else if($data['og_video_list_size'] == 7) { 
                	$data['img_width'] = 320;  
					$data['img_height'] = 180;
                }

                $data['play_btn_top'] = (int)(($data['img_height'] - 50) / 2);  
                $data['play_btn_left'] = (int)(($data['img_width'] - 50) / 2);  

				$video_total = $this->model_gallery_video->getTotalVideos($data_videos); 

				$results = $this->model_gallery_video->getVideos($data_videos);

				foreach ($results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $data['img_width'] , $data['img_height']);
					} else {
						$image = false;
					}

					if ($this->config->get('og_video_display_rating')) {
						$rating = (int)$result['rating'];
					} else {
						$rating = false;
					}

					$data['videos'][] = array(
						'video_id'    => $result['video_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'rating'      => $rating,
						'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
						'href'        => $this->url->link('gallery/video', '&video_id=' . $result['video_id'] )
					);
				}

				$url = '';

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['sorts'] = array();

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_default'),
					'value' => 'v.sort_order-ASC',
					'href'  => $this->url->link('gallery/video', '&sort=v.sort_order&order=ASC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_name_asc'),
					'value' => 'vd.name-ASC',
					'href'  => $this->url->link('gallery/video', '&sort=vd.name&order=ASC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_name_desc'),
					'value' => 'vd.name-DESC',
					'href'  => $this->url->link('gallery/video', '&sort=vd.name&order=DESC' . $url)
				);

				if ($this->config->get('config_review_status')) {
					$data['sorts'][] = array(
						'text'  => $this->language->get('text_rating_desc'),
						'value' => 'rating-DESC',
						'href'  => $this->url->link('gallery/video', '&sort=rating&order=DESC' . $url)
					); 

					$data['sorts'][] = array(
						'text'  => $this->language->get('text_rating_asc'),
						'value' => 'rating-ASC',
						'href'  => $this->url->link('gallery/video', '&sort=rating&order=ASC' . $url)
					);
				}

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_viewed_asc'),
					'value' => 'v.viewed-ASC',
					'href'  => $this->url->link('gallery/video', '&sort=v.viewed&order=ASC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_viewed_desc'),
					'value' => 'v.viewed-DESC',
					'href'  => $this->url->link('gallery/video', '&sort=v.viewed&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_date_asc'),
					'value' => 'v.date_added-ASC',
					'href'  => $this->url->link('gallery/video', '&sort=v.date_added&order=ASC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_date_desc'),
					'value' => 'v.date_added-DESC',
					'href'  => $this->url->link('gallery/video', '&sort=v.date_added&order=DESC' . $url)
				);


				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}	

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				$data['limits'] = array();
				
				$limits = array_unique(array($this->config->get('og_video_per_page'), $this->config->get('og_video_per_page')*2, $this->config->get('og_video_per_page')*4, $this->config->get('og_video_per_page')*8, $this->config->get('og_video_per_page')*16 ));
				

				sort($limits);

				foreach($limits as $value){
					$data['limits'][] = array(
						'text'  => $value,
						'value' => $value,
						'href'  => $this->url->link('gallery/video', $url . '&limit=' . $value)
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

				$pagination = new Pagination();
				$pagination->total = $video_total;
				$pagination->page = $page;
				$pagination->limit =  $limit;
				$pagination->text = $this->language->get('text_pagination');
				$pagination->url = $this->url->link('gallery/video', $url . '&page={page}');

				$data['pagination'] = $pagination->render();
				$data['results'] = sprintf($this->language->get('text_pagination'), ($video_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($video_total - $limit)) ? $video_total : ((($page - 1) * $limit) + $limit), $video_total, ceil($video_total / $limit));

				$data['sort'] = $sort;
				$data['order'] = $order;
				$data['limit'] = $limit;

			}

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/gallery/video.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/gallery/video.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/gallery/video.tpl', $data));
			}

		}
	}

	public function review() {
		$this->language->load('gallery/video');

		$this->load->model('gallery/review');

		$data['text_on'] = $this->language->get('text_on');
		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}  

		$data['reviews'] = array();

		$review_total = $this->model_gallery_review->getTotalReviewsByVideoId($this->request->get['video_id']);

		$results = $this->model_gallery_review->getReviewsByVideoId($this->request->get['video_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => $result['text'],
				'rating'     => (int)$result['rating'],
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$review_total),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5; 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('gallery/video/review', 'video_id=' . $this->request->get['video_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/gallery/review.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/gallery/review.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/gallery/review.tpl', $data));
		}
	}

	public function write() {
		$this->language->load('gallery/video');

		$this->load->model('gallery/review');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating'])) {
				$json['error'] = $this->language->get('error_rating');
			}

			if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
				$json['error'] = $this->language->get('error_captcha');
			}

			if (!isset($json['error'])) {
				$this->model_gallery_review->addVideoReview($this->request->get['video_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function captcha() {
		$this->load->library('captcha');

		$captcha = new Captcha();

		$this->session->data['captcha'] = $captcha->getCode();

		$captcha->showImage();
	}
}
?>