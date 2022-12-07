# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  items_count     :integer
#  password_digest :string
#  user_location   :string
#  user_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many(:items, { :class_name => "Item", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:saved_items, { :class_name => "SavedItem", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:preferred_items, { :through => :saved_items, :source => :item })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "user_id", :dependent => :destroy })

  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
