# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comments   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  user_id    :integer
#
class Comment < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:item, { :required => true, :class_name => "Item", :foreign_key => "item_id" })
end
