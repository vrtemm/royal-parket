<?php
class ControllerModuleSlideshow extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				if(utf8_substr(strrchr(basename($result['image']), '.'), 1) == 'mp4') {
					$tr = $result['image'];
					$video = true;
				} else {
					$tr = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
					$video = false;
				}
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $tr,
					'description' => html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
					'width' => $setting['width'],
					'height' => $setting['height'],
					'video' => $video 
				);
			}
		}

		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/slideshow.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/slideshow.tpl', $data);
		} else {
			return $this->load->view('default/template/module/slideshow.tpl', $data);
		}
	}
}
