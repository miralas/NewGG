class Company < ActiveRecord::Base
  include Bootsy::Container
  belongs_to :owner
  has_many :company_news
  validates_presence_of :company_type, :company_name

  # after_create :add_owner

  private
      def add_owner
        self.owner = Owner.create(user: self.owner)
      end
end
