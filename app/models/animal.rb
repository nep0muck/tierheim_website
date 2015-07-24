class Animal < ActiveRecord::Base
    belongs_to :user
    
    has_attached_file :image, :styles => { :full => "1920x540#", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
