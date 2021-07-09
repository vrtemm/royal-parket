<div>
<?php if ($reviews) { ?>
	<div class="r-items">
	<?php foreach ($reviews as $review) { ?>
		<div class="review-item">
			<div class="review-top">
				<div class="review-name-rating">
					<div class="review-name"><?php echo $review['author']; ?></div>
					<div class="review-rating">
						<div class="rating">
							<?php for($i = 0; $i < 5; $i++) { ?>
								<?php if($review['rating'] > $i) { ?>
									<span class="ic ic-star"></span>
									<?php } else { ?>
									<span class="ic ic-star-o"></span>
								<?php } ?>
							<?php } ?>
						</div>
					</div>
				</div>
				<div class="review-date"><?php echo $review['date_added']; ?></div>
			</div>
			<div class="review-text">
				<p><?php echo $review['text']; ?></p>
				<?php if($review['good']) { ?>
					<div class="r-plus">	
						<span>+ Плюсы:</span> <?php echo $review['good']; ?>
					</div>
				<?php } ?>
				<?php if($review['bads']) { ?>
					<div class="r-minus">	
						<span>- Минусы:</span> <?php echo $review['bads']; ?>
					</div>
					<?php } ?>
				</div>
				<button type="button" class="review-answer" data-id="<?php echo $review['review_id']; ?>"><i class="fa fa-reply"></i> <span>Ответить</span></button>
				<?php //level 1 ?>
				<?php	if($review['answer'] || $review['child']) { ?>
					<?php if($review['answer']) { ?>
						<div class="review-item ri-level ri-level1 ri-admin">
							<div class="review-top">
								<div class="review-name-rating">
									<div class="review-name">Ответ магазина</div>
								</div>
							</div>
							<div class="review-text">
								<p><?php echo $review['answer']; ?></p>
							</div>
						</div>
					<?php } ?>
					<?php if($review['child']) { ?>
						<?php foreach($review['child'] as $child1) { ?>
							<div class="review-item ri-level ri-level1"> 
								<div class="review-top">
									<div class="review-name-rating">
										<div class="review-name"><?php echo $child1['author']; ?></div>
									</div>
									<div class="review-date"><?php echo $child1['date_added']; ?></div>
								</div>
								<div class="review-text">
									<p><?php echo $child1['text']; ?></p>
								</div>
								<button type="button" class="review-answer" data-id="<?php echo $child1['review_id']; ?>"><i class="fa fa-reply"></i> <span>Ответить</span></button>
							</div>
							<?php //level 2 ?>
							<?php if($child1['answer'] || $child1['child']) { ?>
								<?php if($child1['answer']) { ?>
									<div class="review-item ri-level ri-level2 ri-admin">
										<div class="review-top">
											<div class="review-name-rating">
												<div class="review-name">Ответ магазина</div>
											</div>
										</div>
										<div class="review-text">
											<p><?php echo $child1['answer']; ?></p>
										</div>
									</div>
								<?php } ?>
								
								<?php if($child1['child']) { ?>
									<?php foreach($child1['child'] as $child2) { ?>
										<div class="review-item ri-level ri-level2"> 
											<div class="review-top">
												<div class="review-name-rating">
													<div class="review-name"><?php echo $child2['author']; ?></div>
												</div>
												<div class="review-date"><?php echo $child2['date_added']; ?></div>
											</div>
											<div class="review-text">
												<p><?php echo $child2['text']; ?></p>
											</div>
											<button type="button" class="review-answer" data-id="<?php echo $child2['review_id']; ?>"><i class="fa fa-reply"></i> <span>Ответить</span></button>
										</div>
										<?php //level 3 ?>
										<?php if($child2['answer'] || $child2['child']) { ?>
											<?php if($child2['answer']) { ?>
												<div class="review-item ri-level ri-level3 ri-admin">
													<div class="review-top">
														<div class="review-name-rating">
															<div class="review-name">Ответ магазина</div>
														</div>
													</div>
													<div class="review-text">
														<p><?php echo $child2['answer']; ?></p>
													</div>
												</div>
											<?php } ?>
											
											<?php if($child2['child']) { ?>
												<?php foreach($child2['child'] as $child3) { ?>
													<div class="review-item ri-level ri-level3"> 
														<div class="review-top">
															<div class="review-name-rating">
																<div class="review-name"><?php echo $child3['author']; ?></div>
															</div>
															<div class="review-date"><?php echo $child3['date_added']; ?></div>
														</div>
														<div class="review-text">
															<p><?php echo $child3['text']; ?></p>
														</div>
														<button type="button" class="review-answer" data-id="<?php echo $child3['review_id']; ?>"><i class="fa fa-reply"></i> <span>Ответить</span></button>
													</div>
													<?php //level 4 ?>
													<?php if($child3['answer'] || $child3['child']) { ?>
														<?php if($child3['answer']) { ?>
															<div class="review-item ri-level ri-level4 ri-admin">
																<div class="review-top">
																	<div class="review-name-rating">
																		<div class="review-name">Ответ магазина</div>
																	</div>
																</div>
																<div class="review-text">
																	<p><?php echo $child3['answer']; ?></p>
																</div>
															</div>
														<?php } ?>
														
														<?php if($child3['child']) { ?>
															<?php foreach($child3['child'] as $child4) { ?>
																<div class="review-item ri-level ri-level4"> 
																	<div class="review-top">
																		<div class="review-name-rating">
																			<div class="review-name"><?php echo $child4['author']; ?></div>
																		</div>
																		<div class="review-date"><?php echo $child4['date_added']; ?></div>
																	</div>
																	<div class="review-text">
																		<p><?php echo $child4['text']; ?></p>
																	</div>
																</div>
															<?php } ?>
														<?php } ?>
														
													<?php } ?>
												<?php } ?>
											<?php } ?>
											
										<?php } ?>
									<?php } ?>
								<?php } ?>
								
							<?php } ?>
						<?php } ?>
					<?php } ?>
				<?php } ?>
			</div>
		<?php } ?>
		</div>
		<div class="text-right"><?php echo $pagination; ?></div>
		<?php } else { ?>
		<p><?php echo $text_no_reviews; ?></p>
	<?php } ?>	
</div>