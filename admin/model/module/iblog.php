<?php 
class ModelModuleiBlog extends Model {
	
  	public function install() {
		$sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "iblog_post` (
					`id` int(11) NOT NULL auto_increment,
					`slug` varchar(255) character set utf8 NOT NULL,
					`author_id` int(11) NOT NULL,
					`image` varchar(255) character set utf8 NOT NULL,
					`category_id` int(11) NOT NULL,
					`is_published` tinyint(1) NOT NULL,
					`is_featured` tinyint(1) NOT NULL,
					`modified` datetime NOT NULL,
					`created` datetime NOT NULL,
					`store_id` int(11) NOT NULL DEFAULT 0,
					PRIMARY KEY  (`id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8;";
		$this->db->query($sql);
		$sql = 	"CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "iblog_post_description` (
					`id` int(11) NOT NULL auto_increment,
					`iblog_post_id` int(11) NOT NULL,
					`language_id` int(11) NOT NULL,
					`title` varchar(255) character set utf8 NOT NULL,
					`excerpt` text character set utf8 NOT NULL,
					`body` longtext character set utf8 NOT NULL,
					`meta_description` text NOT NULL,
					`meta_keywords` text NOT NULL,
					PRIMARY KEY  (`id`),
					KEY `select` (`iblog_post_id`,`language_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8";
		$this->db->query($sql);
		
		$this->db->query("UPDATE `" . DB_PREFIX . "modification` SET status=1 WHERE `name` LIKE'%iBlog by iSenseLabs%'");
		$modifications = $this->load->controller('extension/modification/refresh');
  	} 
  
  	public function uninstall() {
		$sql = "DROP TABLE IF EXISTS `" . DB_PREFIX . "iblog_post`;";
		$this->db->query($sql);
		$sql = "DROP TABLE IF EXISTS `" . DB_PREFIX . "iblog_post_description`;";
		$this->db->query($sql);
		
		$this->db->query("UPDATE `" . DB_PREFIX . "modification` SET status=0 WHERE `name` LIKE'%iBlog by iSenseLabs%'");
		$modifications = $this->load->controller('extension/modification/refresh');
  	}
	
	public function getTotalPosts($store_id) {
		$sql = "SELECT COUNT(DISTINCT p.id) AS total FROM " . DB_PREFIX . "iblog_post p LEFT JOIN " . DB_PREFIX . "iblog_post_description pd ON (p.id = pd.iblog_post_id)";
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.store_id = '" . (int)$store_id . "'";
		$query = $this->db->query($sql);
		return $query->row['total'];
	}
	
	public function viewPosts($page=1, $limit=8, $store_id=0,$sort="p.id", $order="DESC") {
		if ($page) {
				$start = ($page - 1) * $limit;
		}
			
		$sql = "SELECT *, (SELECT CONCAT_WS(' ', u.firstname, u.lastname) FROM " . DB_PREFIX . "user u WHERE p.author_id = u.user_id) as author FROM " . DB_PREFIX . "iblog_post p LEFT JOIN " . DB_PREFIX . "iblog_post_description pd ON (p.id = pd.iblog_post_id)";
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.store_id = '" . (int)$store_id . "'"; 
		$sql .= " GROUP BY p.id";
		$sort_data = array(
			'pd.title',
			'pd.excerpt',
			'author',
			'p.created',
			'p.is_published'
		);	
		if (isset($sort)) {
			$sql .= " ORDER BY " . $sort;	
		}
		if (isset($order)) {
			$sql .= " " . $order;
		}
		if (isset($start) || isset($limit)) {
			$sql .= " LIMIT ".$start.", ".$limit;
		}	
		$query = $this->db->query($sql);
		return $query->rows;
	}
	
	public function addPost($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "iblog_post SET slug = '" . $this->db->escape($data['slug']) . "', author_id = '" . $this->db->escape($data['author_id']) . "', category_id = '0', is_published = '" . $this->db->escape($data['status']) . "', is_featured='" . !empty($data['featured']) . "', modified = NOW(), created = '" . $data['date_published'] . "', store_id='" . $this->db->escape($data['store_id']) . "'");
		
		$post_id = $this->db->getLastId();
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "iblog_post SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE id = '" . (int)$post_id . "'");
		}
		
		foreach ($data['post_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "iblog_post_description SET iblog_post_id = '" . (int)$post_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', excerpt = '" . $this->db->escape($value['excerpt']) . "', body = '" . $this->db->escape($value['body']) . "', meta_keywords = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "'");
		}
		
		if (isset($data['slug'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'post_id=" . (int)$post_id . "', keyword = '" . $this->db->escape($data['slug']) . "'");
		}
		
		$this->cache->delete('seo_pro');
		
	}
	
	public function deletePost($post_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "iblog_post WHERE id = '" . (int)$post_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "iblog_post_description WHERE iblog_post_id = '" . (int)$post_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'post_id=" . (int)$post_id . "'");
		$this->cache->delete('seo_pro');
	}
	
	public function getPost($post_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "iblog_post p LEFT JOIN " . DB_PREFIX . "iblog_post_description pd ON (p.id = pd.iblog_post_id) WHERE pd.iblog_post_id = '" . (int)$post_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				
		return $query->row;
	}
	
	public function getPostDescriptions($post_id) {
		$post_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "iblog_post_description WHERE iblog_post_id = '" . (int)$post_id . "'");
		
		foreach ($query->rows as $result) {
			$post_description_data[$result['language_id']] = array(
				'title'             => $result['title'],
				'body'     			=> $result['body'],
				'meta_keyword'     	=> $result['meta_keywords'],
				'meta_description' 	=> $result['meta_description'],
				'excerpt'           => $result['excerpt']
			);
		}
		
		return $post_description_data;
	}
	
	public function editPost($post_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "iblog_post SET slug = '" . $this->db->escape($data['slug']) . "', author_id = '" . $this->db->escape($data['author_id']) . "', category_id = '0', is_published = '" . $this->db->escape($data['status']) . "', is_featured='" . !empty($data['featured']) . "', modified = NOW(), created = '" . $data['date_published'] . "' WHERE id = '" . (int)$post_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "iblog_post SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE id = '" . (int)$post_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "iblog_post_description WHERE iblog_post_id = '" . (int)$post_id . "'");
		
		foreach ($data['post_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "iblog_post_description SET iblog_post_id = '" . (int)$post_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', excerpt = '" . $this->db->escape($value['excerpt']) . "', body = '" . $this->db->escape($value['body']) . "', meta_keywords = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'post_id=" . (int)$post_id . "'");
		
		if (isset($data['slug'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'post_id=" . (int)$post_id . "', keyword = '" . $this->db->escape($data['slug']) . "'");
		}
		$this->cache->delete('seo_pro');
	}
	
	public function getLastModuleByCode($code) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "module` WHERE `code` = '" . $this->db->escape($code) . "' ORDER BY `module_id` DESC");

		return $query->rows;
	}
	
  }
?>