module Admin
  class VersionsController < ApplicationController
    def index
      sql = <<-"EOS"
        SELECT
          *
        FROM versions
      EOS

      @versions = ActiveRecord::Base.connection.select_all(sql).to_hash.map(&:with_indifferent_access)
      puts "####################"
      puts "####################"
      puts "####################"
      pp @versions
      puts "####################"
      puts "####################"
      puts "####################"
    end
  end
end
