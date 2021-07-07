<?php
class ModelGalleryReview extends Model {		
	public function addAlbumReview($album_id, $data) {
		$this->db->query("INSERT INTO po_opencart_gallery_album_review SET author = '" . $this->db->escape($data['name']) . "', customer_id = '" . (int)$this->customer->getId() . "', album_id = '" . (int)$album_id . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()");
	}
		
	public function getReviewsByAlbumId($album_id, $start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}
		
		if ($limit < 1) {
			$limit = 20;
		}		
		
		$query = $this->db->query("SELECT r.review_id, r.author, r.rating, r.text, a.album_id, ad.name, a.image, r.date_added FROM po_opencart_gallery_album_review r LEFT JOIN po_opencart_gallery_album a ON (r.album_id = a.album_id) LEFT JOIN po_opencart_gallery_album_description ad ON (a.album_id = ad.album_id) WHERE a.album_id = '" . (int)$album_id . "' AND a.status = '1' AND r.status = '1' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
			
		return $query->rows;
	}

	public function getTotalReviewsByAlbumId($album_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM po_opencart_gallery_album_review r LEFT JOIN po_opencart_gallery_album a ON (r.album_id = a.album_id) LEFT JOIN po_opencart_gallery_album_description ad ON (a.album_id = ad.album_id) WHERE a.album_id = '" . (int)$album_id . "' AND a.status = '1' AND r.status = '1' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row['total'];
	}

	public function addVideoReview($video_id, $data) {
		$this->db->query("INSERT INTO po_opencart_gallery_video_review SET author = '" . $this->db->escape($data['name']) . "', customer_id = '" . (int)$this->customer->getId() . "', video_id = '" . (int)$video_id . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()");
	}
		
	public function getReviewsByVideoId($video_id, $start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}
		
		if ($limit < 1) {
			$limit = 20;
		}		
		
		$query = $this->db->query("SELECT r.review_id, r.author, r.rating, r.text, v.video_id, vd.name, v.image, r.date_added FROM po_opencart_gallery_video_review r LEFT JOIN po_opencart_gallery_video v ON (r.video_id = v.video_id) LEFT JOIN po_opencart_gallery_video_description vd ON (v.video_id = vd.video_id) WHERE v.video_id = '" . (int)$video_id . "' AND v.status = '1' AND r.status = '1' AND vd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
			
		return $query->rows;
	}

	public function getTotalReviewsByVideoId($video_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM po_opencart_gallery_video_review r LEFT JOIN po_opencart_gallery_video v ON (r.video_id = v.video_id) LEFT JOIN po_opencart_gallery_video_description vd ON (v.video_id = vd.video_id) WHERE v.video_id = '" . (int)$video_id . "' AND v.status = '1' AND r.status = '1' AND vd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row['total'];
	}
}
?>