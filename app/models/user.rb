class User < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
  require 'activerecord-import/active_record/adapters/postgresql_adapter'


  belongs_to :csv_file

  def self.my_import(file)
    csv_file = CsvFile.new
    csv_file.save
    users = []
    CSV.foreach(file.path, headers: true, col_sep: ';', header_converters: :symbol) do |row|
      users << User.new(row.to_h)
    end
    User.import users, recursive: true
    users.each do |user|
      user.csv_file = csv_file
      user.save
    end
  end
end
