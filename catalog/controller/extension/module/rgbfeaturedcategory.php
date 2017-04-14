<?php
class ControllerExtensionModuleRgbfeaturedCategory extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/rgbfeaturedcategory');

		if ($setting['displaytitle'] == '1') {
		$data['heading_title'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
		} else {
			$data['heading_title'] = false;
		}

		$data['items'] = $setting['items'];
		$data['url'] = $setting['url'];
		static $module = 0;
		$data['module'] = $module++;
		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/category');

		$this->load->model('tool/image');

		$data['categories'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}
     
		if (!empty($setting['category'])) {
			$categories = array_slice($setting['category'], 0, (int)$setting['limit']);
		    	
			foreach ($categories as $category_id) {
				$category_info = $this->model_catalog_category->getCategory($category_id);

				if ($category_info) {
					if ($category_info['image']) {
						$image = $this->model_tool_image->resize($category_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}
                    
				
					$data['categories'][] = array(
						'category_id'  => $category_info['category_id'],
						'thumb'       => $image,
						'name'        => $category_info['name'],
						'display_carousel_status'=>$setting['carousel_status'], 
						'description' => utf8_substr(strip_tags(html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['description_length']),
						'display_description_status'=>$setting['description_status'],
						'href'        => $this->url->link('product/category', 'path='. $category_info['category_id'])
					);
					
				}
			}
		}

		if ($data['categories']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/rgbfeaturedcategory.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/rgbfeaturedcategory.tpl', $data);
			} else {
				return $this->load->view('extension/module/rgbfeaturedcategory.tpl', $data);
			}
		}
	}
}