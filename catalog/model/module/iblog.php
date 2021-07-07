<?php
class ModelModuleiBlog extends Model {
	
	public function getFeaturedPost() {
		$query = $this->db->query("SELECT DISTINCT *, pd.title AS title, pd.body as body, (SELECT CONCAT_WS(' ', u.firstname, u.lastname) FROM " . DB_PREFIX . "user u WHERE p.author_id = u.user_id) as author FROM " . DB_PREFIX . "iblog_post p LEFT JOIN " . DB_PREFIX . "iblog_post_description pd ON (p.id = pd.iblog_post_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.is_published = '1' AND p.is_featured = '1' AND p.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY created DESC LIMIT 0,1");
		
		if ($query->num_rows) {
			return array(
				'post_id'       	=> $query->row['iblog_post_id'],
				'title'             => $query->row['title'],
				'body'      		=> $query->row['body'],
				'excerpt'			=> $query->row['excerpt'],
				'meta_description'	=> $query->row['meta_description'],
				'meta_keyword'		=> $query->row['meta_keywords'],
				'image'				=> $query->row['image'],
				'status'			=> $query->row['is_published'],
				'author'			=> $query->row['author'],
				'created'			=> $query->row['created'],
				'featured'			=> $query->row['is_featured'],
				'href'				=> $this->url->link('module/iblog/post', 'post_id=' . $query->row['iblog_post_id'])
			);
		} else {
			return false;
		}	
	}
	
	public function getPosts($data = array()) {
		$sql = "SELECT *, (SELECT CONCAT_WS(' ', u.firstname, u.lastname) FROM " . DB_PREFIX . "user u WHERE p.author_id = u.user_id) as author FROM " . DB_PREFIX . "iblog_post p LEFT JOIN " . DB_PREFIX . "iblog_post_description pd ON (p.id = pd.iblog_post_id)";
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.is_published = '1' AND p.store_id = '" . (int)$this->config->get('config_store_id') . "'"; 
		
		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
			$sql .= " AND (";

			if (!empty($data['filter_name'])) {
				$implode = array();

				$words = explode(' ', trim(preg_replace('/\s\s+/', ' ', $data['filter_name'])));

				foreach ($words as $word) {
					$implode[] = "pd.title LIKE '%" . $this->db->escape($word) . "%'";
				}

				if ($implode) {
					$sql .= " " . implode(" AND ", $implode) . "";
				}

				if (!empty($data['filter_description'])) {
					$sql .= " OR pd.body LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
			}
			$sql .= ")";
		}		
		
		$sql .= " GROUP BY p.id";
					
		$sort_data = array(
			'pd.title',
			'pd.excerpt',
			'author',
			'p.created',
			'p.is_published'
		);	
		
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
		} else {
			$sql .= " ORDER BY p.is_featured DESC, p.created DESC";
		}
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
	
		return $query->rows;
	}
	
	public function getPost($post_id) {	
		$query = $this->db->query("SELECT DISTINCT *, pd.title AS title, pd.body as body, (SELECT CONCAT_WS(' ', u.firstname, u.lastname) FROM " . DB_PREFIX . "user u WHERE p.author_id = u.user_id) as author FROM " . DB_PREFIX . "iblog_post p LEFT JOIN " . DB_PREFIX . "iblog_post_description pd ON (p.id = pd.iblog_post_id) WHERE p.id = '" . (int)$post_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.is_published = '1' AND p.store_id='" . (int)$this->config->get('config_store_id') . "'");
		
		if ($query->num_rows) {
			return array(
				'post_id'       	=> $query->row['iblog_post_id'],
				'title'             => $query->row['title'],
				'body'      		=> $query->row['body'],
				'meta_description'	=> $query->row['meta_description'],
				'meta_keyword'		=> $query->row['meta_keywords'],
				'image'				=> $query->row['image'],
				'status'			=> $query->row['is_published'],
				'author'			=> $query->row['author'],
				'created'			=> $query->row['created'],
				'featured'			=> $query->row['is_featured']
			);
		} else {
			return false;
		}
	}
	
	public function getTotalPosts($store_id, $data=array()) {
		$sql = "SELECT COUNT(DISTINCT p.id) AS total FROM " . DB_PREFIX . "iblog_post p LEFT JOIN " . DB_PREFIX . "iblog_post_description pd ON (p.id = pd.iblog_post_id)";
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.store_id = '" . (int)$store_id . "'";
		
		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
			$sql .= " AND (";

			if (!empty($data['filter_name'])) {
				$implode = array();

				$words = explode(' ', trim(preg_replace('/\s\s+/', ' ', $data['filter_name'])));

				foreach ($words as $word) {
					$implode[] = "pd.title LIKE '%" . $this->db->escape($word) . "%'";
				}

				if ($implode) {
					$sql .= " " . implode(" AND ", $implode) . "";
				}

				if (!empty($data['filter_description'])) {
					$sql .= " OR pd.body LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
			}
			$sql .= ")";
		}
		
		$query = $this->db->query($sql);
		return $query->row['total'];
	}
	
	public function sgetPosts($page=1, $limit=8, $store_id=0,$sort="p.id", $order="DESC") {
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
		if (isset($data['start']) || isset($data['limit'])) {
			$sql .= " LIMIT ".$start.", ".$limit;
		}	
		$query = $this->db->query($sql);
		return $query->rows;
	}
 
}
?>