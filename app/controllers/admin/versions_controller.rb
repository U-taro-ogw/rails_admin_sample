module Admin
  class VersionsController < ApplicationController
    def index
      sql = <<-"EOS"
        SELECT
          versions.*,
          administrators.email
        FROM versions
        LEFT OUTER JOIN administrators
          ON versions.whodunnit = CAST(administrators.id AS CHAR(5))
        ORDER BY versions.id DESC
      EOS

      @versions = ActiveRecord::Base.connection.select_all(sql).to_hash.map(&:with_indifferent_access)
    end
  end
end
