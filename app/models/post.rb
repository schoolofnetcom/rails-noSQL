class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: "posts", database: "todo_development"

  field :title, type: String
  field :body, type: String

  embeds_many :comments
end
