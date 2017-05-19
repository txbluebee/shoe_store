class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
  validates :name, :presence => true,
                   :length => {:minimum => 3, :maximum => 100},
                   :uniqueness => {:case_sensitive => false}
  before_save :capitalize_name

  private
    def capitalize_name
      self.name = name().split.map(&:capitalize).join(' ')
    end
end
