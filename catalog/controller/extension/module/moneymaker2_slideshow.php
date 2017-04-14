<?php
class ControllerExtensionModuleMoneymaker2Slideshow extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.moneymaker2.css');

		$data['animation'] = $setting['animation'];
		//if ($data['animation']) $this->document->addStyle('catalog/view/theme/moneymaker2/stylesheet/animate.min.css');
		if ($data['animation']) $this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.transitions.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$data['autoplay'] = $setting['autoplay'];
		$data['autoplay_timeout'] = $setting['autoplay_timeout'];
		$data['navigation'] = $setting['navigation'];
		$data['navigation_style'] = $setting['navigation_style'];
		$data['pagination'] = $setting['pagination'];
		//$data['pagination_style'] = $setting['pagination_style'];
		$data['fullwidth'] = $setting['fullwidth'];
		$data['fullwidth_bottom'] = $setting['fullwidth_bottom'];
		$data['hidden_xs'] = isset($setting['hidden_xs']) ? $setting['hidden_xs'] : '';
		$data['items'] = $setting['items'];
		$data['animation_in'] = $setting['animation_in'];
		//$data['animation_out'] = $setting['animation_out'];

		$data['parallax'] = $setting['parallax'];
		$data['parallax_speed'] = $setting['parallax_speed'];
		$data['parallax_heights'] = $setting['parallax_heights'];

		$data['moneymaker2_header_strip_bg_transparency'] = $this->config->get('moneymaker2_header_strip_bg_transparency');

		$data['banners_settings'] = array();
		$banners_settings = $setting['banners_settings'];
		if (!empty($banners_settings)){
			foreach ($banners_settings as $key => $value) {
				$data['banners_settings'][] = array(
					'link'  => $value['link'],
					'multilink' => isset($value['multilink'][$this->config->get('config_language_id')]) ? $value['multilink'][$this->config->get('config_language_id')] : '',
					'position'  => $value['position'],
					'text_width'  => $value['text_width'],
					'text_style'  => $value['text_style'],
					'title'  => $value['title'][$this->config->get('config_language_id')],
					'text'  => $value['text'][$this->config->get('config_language_id')],
					'btn_title'  => $value['btn_title'][$this->config->get('config_language_id')] ? $value['btn_title'][$this->config->get('config_language_id')] : '',
					'btn_style' => $value['btn_style'],
					'image' => is_file(DIR_IMAGE . $value['image']) ? $this->model_tool_image->resize($value['image'], $setting['width'], $setting['height']) : $this->model_tool_image->resize('no_image.png', $setting['width'], $setting['height'])
				);
				$banners_settings_sort_order[$key] = $value['sort_order'];
			}
		array_multisort($banners_settings_sort_order, SORT_ASC, $data['banners_settings']);
		}
		$data['module'] = $module++;
		return $this->load->view('extension/module/moneymaker2_slideshow', $data);
	}
}