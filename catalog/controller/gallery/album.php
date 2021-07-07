<?php 
class ControllerGalleryAlbum extends Controller {  
	public function index() { 
		$this->load->language('gallery/album');

		$this->load->model('gallery/album');

		$this->load->model('tool/image'); 
		
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

		$data['heading_title_line'] = $this->config->get('og_heading_title_line');

		$og_album_per_row = $this->config->get('og_album_per_row');

		if($og_album_per_row == 1) {
			$data['apr'] = 'col-lg-12 col-md-12 col-sm-12';
		} else if($og_album_per_row == 2) {
			$data['apr'] = 'col-lg-6 col-md-6 col-sm-6';
		} else if($og_album_per_row == 3) {
			$data['apr'] = 'col-lg-4 col-md-4 col-sm-6';
		} else if($og_album_per_row == 4) {
			$data['apr'] = 'col-lg-3 col-md-3 col-sm-6';
		} else if($og_album_per_row == 6) {
			$data['apr'] = 'col-lg-2 col-md-2 col-sm-6';
		}


		$data['og_album_size'] = $this->config->get('og_album_size');

		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/opencart_gallery.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/opencart_gallery.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/opencart_gallery.css');
		}

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'a.sort_order';
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
			$limit = $this->config->get('og_album_per_page');
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
			'text'      => $this->language->get('text_gallery_album'),
			'href'      => $this->url->link('gallery/album', $url),
			'separator' => $this->language->get('text_separator')
		);

		if (isset($this->request->get['album_id'])) {
			$album_id = (int)$this->request->get['album_id'];
		} else {
			$album_id = 0;
		}

		$album_info = $this->model_gallery_album->getAlbum($album_id);

		if ($album_info) {
			$this->document->setTitle($album_info['name']);
			$this->document->setDescription($album_info['meta_description']);
			$this->document->setKeywords($album_info['meta_keyword']);

			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');


			$data['heading_title'] = $album_info['name'];

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

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $album_info['reviews']);

			$data['button_continue'] = $this->language->get('button_continue');

			$data['og_allow_review'] = $this->config->get('og_allow_review');
			
			$data['breadcrumbs'][] = array(
				'text'      => $album_info['name'],
				'href'      => $this->url->link('gallery/album', 'album_id=' . $this->request->get['album_id'] . $url),
				'separator' => $this->language->get('text_separator')
			);

			$data['album_id'] = $this->request->get['album_id'];

			$data['og_album_image_type'] = $this->config->get('og_album_image_type');

			if($data['og_album_image_type']) {
				$img_height = 336;
				
				$thumb_height = 120;
			} else {
				$img_height = 252;
			
				$thumb_height = 90;
			}
			
			$popup_width = $this->config->get('og_image_pu_width');
			$popup_height = $this->config->get('og_image_pu_height');

			$this->load->model('tool/image');

			if ($album_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($album_info['image'], $popup_width , $popup_height);
			} else {
				$data['popup'] = '';
			}

			if ($album_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($album_info['image'], 336 , $img_height);
			} else {
				$data['thumb'] = '';
			}

			$data['images'] = array();

			$results = $this->model_gallery_album->getAlbumImages($this->request->get['album_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
					'name'  => $result['name'],
					'popup' => $this->model_tool_image->resize($result['image'], $popup_width , $popup_height),
					'thumb' => $this->model_tool_image->resize($result['image'], 120, $thumb_height),
				);
			}	

			$data['description'] = html_entity_decode($album_info['description'], ENT_QUOTES, 'UTF-8');

			$data['viewed'] = $album_info['viewed'];

			$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$album_info['reviews']);
			$data['rating'] = (int)$album_info['rating'];

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

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('gallery/album', 'album_id=' . $this->request->get['album_id'] . '&sort=a.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('gallery/album', 'album_id=' . $this->request->get['album_id'] . '&sort=ad.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('gallery/album', 'album_id=' . $this->request->get['album_id'] . '&sort=ad.name&order=DESC' . $url)
			); 

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('gallery/album', 'album_id=' . $this->request->get['album_id'] . '&sort=rating&order=DESC' . $url)
				); 

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('gallery/album', 'album_id=' . $this->request->get['album_id'] . '&sort=rating&order=ASC' . $url)
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('gallery/album', 'album_id=' . $this->request->get['album_id'] . '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('gallery/album', 'album_id=' . $this->request->get['album_id'] . '&sort=p.model&order=DESC' . $url)
			);

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

			$data['continue'] = $this->url->link('gallery/album');

			$this->model_gallery_album->updateViewed($this->request->get['album_id']);
			
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/gallery/album_info.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/gallery/album_info.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/gallery/album_info.tpl', $data));
			}

		} else {

			$url = '';

			if (isset($this->request->get['album_id'])) {
				$url .= '&album_id=' . $this->request->get['album_id'];
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

			if(isset($this->request->get['album_id'])) {					

				$data['breadcrumbs'][] = array(
					'text'      => $this->language->get('text_error'),
					'href'      => $this->url->link('gallery/album', $url),
					'separator' => $this->language->get('text_separator')
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
					$sort = 'a.sort_order';
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
					$limit = $this->config->get('og_album_per_page');
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
				$data['og_title_font_weight'] = $this->config->get('og_title_font_weight');

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

				$data['albums'] = array();

				$data_albums = array(
					'sort'               => $sort,
					'order'              => $order,
					'start'              => ($page - 1) * $limit,
					'limit'              => $limit
				);

				$data['og_album_height'] = $this->config->get('og_album_height');

				$data['og_album_image_type'] = $this->config->get('og_album_image_type');

				if($data['og_album_size'] == 1) {
					$img_width = 120;
					if($data['og_album_image_type']) {
						$img_height = 120;
					} else {
						$img_height = 90;
					}
				} else if ($data['og_album_size'] == 2) {
					$img_width = 160;
					if($data['og_album_image_type']) {
						$img_height = 160;
					} else {
						$img_height = 120;
					}
				} else if ($data['og_album_size'] == 3) {
					$img_width = 200;
					if($data['og_album_image_type']) {
						$img_height = 200;
					} else {
						$img_height = 150;
					}
				} 

				$album_total = $this->model_gallery_album->getTotalAlbums($data_albums); 

				$results = $this->model_gallery_album->getAlbums($data_albums);

				foreach ($results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $img_width, $img_height);
					} else {
						$image = false;
					}

					if ($this->config->get('og_album_display_rating')) {
						$rating = (int)$result['rating'];
					} else {
						$rating = false;
					}

					$data['albums'][] = array(
						'album_id'  => $result['album_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'rating'      => $rating,
						'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
						'href'        => $this->url->link('gallery/album', '&album_id=' . $result['album_id'] )
					);
				}

				$url = '';

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['sorts'] = array();

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_default'),
					'value' => 'a.sort_order-ASC',
					'href'  => $this->url->link('gallery/album', '&sort=a.sort_order&order=ASC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_name_asc'),
					'value' => 'ad.name-ASC',
					'href'  => $this->url->link('gallery/album', '&sort=ad.name&order=ASC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_name_desc'),
					'value' => 'ad.name-DESC',
					'href'  => $this->url->link('gallery/album', '&sort=ad.name&order=DESC' . $url)
				);

				if ($this->config->get('config_review_status')) {
					$data['sorts'][] = array(
						'text'  => $this->language->get('text_rating_desc'),
						'value' => 'rating-DESC',
						'href'  => $this->url->link('gallery/album', '&sort=rating&order=DESC' . $url)
					); 

					$data['sorts'][] = array(
						'text'  => $this->language->get('text_rating_asc'),
						'value' => 'rating-ASC',
						'href'  => $this->url->link('gallery/album', '&sort=rating&order=ASC' . $url)
					);
				}

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_viewed_asc'),
					'value' => 'a.viewed-ASC',
					'href'  => $this->url->link('gallery/album', '&sort=a.viewed&order=ASC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_viewed_desc'),
					'value' => 'a.viewed-DESC',
					'href'  => $this->url->link('gallery/album', '&sort=a.viewed&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_date_asc'),
					'value' => 'a.date_added-ASC',
					'href'  => $this->url->link('gallery/album', '&sort=a.date_added&order=ASC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_date_desc'),
					'value' => 'a.date_added-DESC',
					'href'  => $this->url->link('gallery/album', '&sort=a.date_added&order=DESC' . $url)
				);


				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}	

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				$data['limits'] = array();

				$limits = array_unique(array($this->config->get('og_album_per_page'), $this->config->get('og_album_per_page')*2, $this->config->get('og_album_per_page')*4, $this->config->get('og_album_per_page')*8, $this->config->get('og_album_per_page')*16 ));

				sort($limits);

				foreach($limits as $value){
					$data['limits'][] = array(
						'text'  => $value,
						'value' => $value,
						'href'  => $this->url->link('gallery/album', $url . '&limit=' . $value)
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
				$pagination->total = $album_total;
				$pagination->page = $page;
				$pagination->limit =  $limit;
				$pagination->text = $this->language->get('text_pagination');
				$pagination->url = $this->url->link('gallery/album', $url . '&page={page}');

				$data['pagination'] = $pagination->render();
				$data['results'] = sprintf($this->language->get('text_pagination'), ($album_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($album_total - $limit)) ? $album_total : ((($page - 1) * $limit) + $limit), $album_total, ceil($album_total / $limit));


				$data['sort'] = $sort;
				$data['order'] = $order;
				$data['limit'] = $limit;

				$data['column_left'] = $this->load->controller('common/column_left');
				$data['column_right'] = $this->load->controller('common/column_right');
				$data['content_top'] = $this->load->controller('common/content_top');
				$data['content_bottom'] = $this->load->controller('common/content_bottom');
				$data['footer'] = $this->load->controller('common/footer');
				$data['header'] = $this->load->controller('common/header');

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/gallery/album.tpl')) {
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/gallery/album.tpl', $data));
				} else {
					$this->response->setOutput($this->load->view('default/template/gallery/album.tpl', $data));
				}

			}
		}
	}

	public function review() {
		$this->load->language('gallery/album');

		$this->load->model('gallery/review');

		$data['text_on'] = $this->language->get('text_on');
		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}  

		$data['reviews'] = array();

		$review_total = $this->model_gallery_review->getTotalReviewsByAlbumId($this->request->get['album_id']);

		$results = $this->model_gallery_review->getReviewsByAlbumId($this->request->get['album_id'], ($page - 1) * 5, 5);

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
		$pagination->url = $this->url->link('gallery/album/review', 'album_id=' . $this->request->get['album_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/gallery/review.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/gallery/review.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/gallery/review.tpl', $data));
		}
	}

	public function write() {
		$this->load->language('gallery/album');

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
				$this->model_gallery_review->addAlbumReview($this->request->get['album_id'], $this->request->post);

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