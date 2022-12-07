# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  available   :boolean
#  description :string
#  image       :string
#  item_name   :string
#  price       :float
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Item < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  has_many(:saved_items, { :class_name => "SavedItem", :foreign_key => "item_id", :dependent => :destroy })
  has_many(:users, { :through => :saved_items, :source => :user })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "item_id", :dependent => :destroy })
end
