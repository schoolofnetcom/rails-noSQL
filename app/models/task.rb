class Task
  include Mongoid::Document
  # include Mongoid::Pagination
  store_in collection: "tasks", database: "todo_development"

  field :name, type: String
  validates :name,
            :presence => { :message => 'You must need to fill in this field' }

  field :description, type: String
  validates :description,
           :presence => { :message => 'You must need to fill in this field '},
           :length => { :minimum => 8, :maximum => 16 }
end
