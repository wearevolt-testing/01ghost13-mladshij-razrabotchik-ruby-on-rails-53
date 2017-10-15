class Api::V1::PostResource < Api::V1::ApplicationResource
  attributes :title, :body, :published_at, :author_nickname
  model_name 'Post'
  has_one :user
  def author_nickname
    @model.user.nickname
  end
  def fetchable_fields
    super - [:updated_at] + [:author_nickname]
  end
  def self.sortable_fields(context)
    super + [:author_nickname]
  end
  def self.default_sort
    {
        published_at: :desc,
        id: :desc,
        title: :desc,
        body: :desc
    }
  end
end
