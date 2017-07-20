require 'active_record'

db_config = {
  adapter: 'sqlite3',
  database: ':memory:'
}
ActiveRecord::Base.establish_connection(db_config)

ActiveRecord::Schema.define(verion: 0) do
  create_table :customers do |t|
    t.string :name
  end
end
