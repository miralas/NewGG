class Company < ActiveRecord::Base
  include Bootsy::Container
  has_and_belongs_to_many :user
  validates_presence_of :company_type, :company_name

  # after_create :add_owner

  private
      def add_owner
        self.owner = Owner.create(user: self.owner)
      end
end
