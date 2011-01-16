class Admin::Blog::PostsController < Admin::BaseController

  crudify :blog_post,
          :title_attribute => :title,
          :order => 'published_at DESC'

  before_filter :find_all_categories,
                :only => [:new, :edit, :create, :update]
  
  before_filter :set_author, :only => [:create]
                

protected
  def find_all_categories
    @blog_categories = BlogCategory.find(:all)
  end
  
  
  def set_author
    params[:blog_post][:user_id] = current_user.id
  end
end
