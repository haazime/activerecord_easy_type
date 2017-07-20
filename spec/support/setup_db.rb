require 'active_record'

db_config = {
  adapter: 'sqlite3',
  database: ':memory:'
}
ActiveRecord::Base.establish_connection(db_config)
