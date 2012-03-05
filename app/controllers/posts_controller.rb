class PostsController < InheritedResources::Base
  def index
    @posts = Post.where(:publish => true)
    if @posts.nil?
    	"No Posts"
    else
    	@posts
    end
  end
end
