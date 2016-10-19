<?php
class ControllerModuleSpecialCountdown extends Controller {
	public function index($setting) {
		$this->load->language('module/special_countdown');


		$data['heading_title'] = $setting['name'];
		$data['cols'] = 12 / $setting['cols'];
		$data['cols_sm'] = 12 / $setting['cols_sm'];
		$data['cols_xs'] = 12 / $setting['cols_xs'];

		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_days'] = $this->language->get('text_days');
		$data['text_hours'] = $this->language->get('text_hours');
		$data['text_minutes'] = $this->language->get('text_minutes');
		$data['text_seconds'] = $this->language->get('text_seconds');
		$data['text_expired'] = $this->language->get('text_expired');
		$data['text_hot'] = $this->language->get('text_hot');
		$data['text_save'] = $this->language->get('text_save');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->document->addScript('catalog/view/javascript/countdown.js');
		$this->document->addStyle('catalog/view/theme/default/stylesheet/countdown.css');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => 'ps.date_end',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProductSpecials($filter_data);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}			

				if ((float)$result['special']) {
				$data['percent'] = round(100 - ($result['special']*100/$result['price']));
				} else {
				$data['percent'] = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}			

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$to_date = $this->model_catalog_product->getProductSpecialData($result['product_id']);
				$to_date = $to_date['date_end'];

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'desc_stat'   => $setting['description'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'to_date'     => $to_date,
					'percent'     => $data['percent'],
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/special_countdown.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/special_countdown.tpl', $data);
			} else {
				return $this->load->view('default/template/module/special_countdown.tpl', $data);
			}
		}
	}
}