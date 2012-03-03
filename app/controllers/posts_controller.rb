class PostsController < InheritedResources::Base
  def index
    @posts = Post.where(:publish => true)
  end
end
