class Project < ActiveRecord::Base
  has_many :tasks , :dependent => :destroy
  belongs_to :user , :foreign_key => :user_id
  validates :title, presence: { message: "入力してください"}
end
