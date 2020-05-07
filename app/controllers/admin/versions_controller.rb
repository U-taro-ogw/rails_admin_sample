module Admin
  class VersionsController < ApplicationController
    def index
      sql = <<-"EOS"
        SELECT
          versions.*
        FROM versions
      EOS

      @versions = ActiveRecord::Base.connection.select_all(sql).to_hash.map(&:with_indifferent_access)
    end
  end
end
