<?php
class ModelOpencartGalleryReview extends Model {

	public function addAlbumReview($data) {
		$this->db->query("INSERT INTO po_opencart_gallery_album_review SET author = '" . $this->db->escape($data['author']) . "', album_id = '" . $this->db->escape($data['album_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		$this->cache->delete('album');
	}

	public function addVideoReview($data) {
		$this->db->query("INSERT INTO po_opencart_gallery_video_review SET author = '" . $this->db->escape($data['author']) . "', video_id = '" . $this->db->escape($data['video_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		$this->cache->delete('video');
	}

	public function editAlbumReview($review_id, $data) {
		$this->db->query("UPDATE po_opencart_gallery_album_review SET author = '" . $this->db->escape($data['author']) . "', album_id = '" . $this->db->escape($data['album_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = NOW() WHERE review_id = '" . (int)$review_id . "'");

		$this->cache->delete('album');
	}

	public function editVideoReview($review_id, $data) {
		$this->db->query("UPDATE po_opencart_gallery_video_review SET author = '" . $this->db->escape($data['author']) . "', video_id = '" . $this->db->escape($data['video_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = NOW() WHERE review_id = '" . (int)$review_id . "'");

		$this->cache->delete('video');
	}

	public function deleteAlbumReview($review_id) {
		$this->db->query("DELETE FROM po_opencart_gallery_album_review WHERE review_id = '" . (int)$review_id . "'");

		$this->cache->delete('album');
	}

	public function deleteVideoReview($review_id) {
		$this->db->query("DELETE FROM po_opencart_gallery_video_review WHERE review_id = '" . (int)$review_id . "'");

		$this->cache->delete('video');
	}

	public function getAlbumReview($review_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT ad.name FROM po_opencart_gallery_album_description ad WHERE ad.album_id = r.album_id AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "') AS album FROM po_opencart_gallery_album_review r WHERE r.review_id = '" . (int)$review_id . "'");

		return $query->row;
	}

	public function getVideoReview($review_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT vd.name FROM po_opencart_gallery_video_description vd WHERE vd.video_id = r.video_id AND vd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS video FROM po_opencart_gallery_video_review r WHERE r.review_id = '" . (int)$review_id . "'");

		return $query->row;
	}

	public function getAlbumReviews($data = array()) {
		$sql = "SELECT r.review_id, ad.name, r.author, r.rating, r.status, r.date_added FROM po_opencart_gallery_album_review r LEFT JOIN po_opencart_gallery_album_description ad ON (r.album_id = ad.album_id) WHERE ad.language_id = '" . (int)$this->config->get('config_language_id') . "'";																																					  

		$sort_data = array(
			'ad.name',
			'r.author',
			'r.rating',
			'r.status',
			'r.date_added'
		);	

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY r.date_added";	
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
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

	public function getVideoReviews($data = array()) {
		$sql = "SELECT r.review_id, vd.name, r.author, r.rating, r.status, r.date_added FROM po_opencart_gallery_video_review r LEFT JOIN po_opencart_gallery_video_description vd ON (r.video_id = vd.video_id) WHERE vd.language_id = '" . (int)$this->config->get('config_language_id') . "'";																																					  

		$sort_data = array(
			'vd.name',
			'r.author',
			'r.rating',
			'r.status',
			'r.date_added'
		);	

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY r.date_added";	
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
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

	public function getTotalAlbumReviews() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM po_opencart_gallery_album_review");

		return $query->row['total'];
	}
	
	public function getTotalVideoReviews() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM po_opencart_gallery_video_review");

		return $query->row['total'];
	}

	public function getTotalAlbumReviewsAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM po_opencart_gallery_album_review WHERE status = '0'");

		return $query->row['total'];
	}

	public function getTotalVideoReviewsAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM po_opencart_gallery_video_review WHERE status = '0'");

		return $query->row['total'];
	}	
}
?>