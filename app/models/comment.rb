class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "comments", database: "todo_development"

  embedded_in :post, inverse_of: :comments

  field :body, type: String
end
