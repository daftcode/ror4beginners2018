class Track < ApplicationRecord
  belongs_to :artist
  has_many :playlist_tracks, dependent: :destroy
  has_many :playlists, through: :playlist_tracks
  validates :title, presence: true
end
