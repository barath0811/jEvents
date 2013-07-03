class AddColumnsToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :airconditioning, :boolean, :default => false
    add_column :facilities, :audio_video_equipment, :boolean, :default => false
    add_column :facilities, :has_bar, :boolean, :default => false
    add_column :facilities, :has_projector, :boolean, :default => false
    add_column :facilities, :has_stage, :boolean, :default => false
    add_column :facilities, :has_smoking_area, :boolean, :default => false
    add_column :facilities, :has_wifi_or_internet, :boolean, :default => false
    add_column :facilities, :has_whiteboard, :boolean, :default => false
    add_column :facilities, :has_video_conference_phone, :boolean, :default => false
    add_column :facilities, :has_dance_floor, :boolean, :default => false
  end
end
