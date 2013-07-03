class Facility < ActiveRecord::Base
  
  attr_accessible 	:has_buffet, 
  					:has_parking, 
  					:is_alcohol_allowed, 
  					:is_nonveg_allowed,
  					:airconditioning,
  					:audio_video_equipment,
  					:has_bar,
  					:has_projector,
  					:has_stage,
  					:has_smoking_area,
  					:has_wifi_or_internet,
  					:has_whiteboard,
  					:has_video_conference_phone,
  					:has_dance_floor

  belongs_to :venue
end
