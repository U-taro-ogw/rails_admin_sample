module PaperTrail
  class Version < ActiveRecord::Base
    include PaperTrail::VersionConcern
    # attr_accessor :item_type, :item_id, :event, :whodunnit, :object, :object_changes, :created_at

    # belongs_to :email, foreign_key: 'whodunnit', class_name: 'Administrator', inverse_of: :versions
    # def whodunnit_email
    #   return whodunnit unless whodunnit

      # admin = Administrator.find whodunnit.to_i
      # admin.email
    # end
  end
end