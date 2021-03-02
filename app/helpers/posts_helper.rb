module PostsHelper
  def which_path_input_page
    if action_name == 'new'|| action_name == 'create' || action_name == 'confirm'
      confirm_posts_path
    elsif action_name == 'edit' || action_name == 'update'
      confirm_post_path
    end
  end
  def which_path_confirm_page
    unless @post.id?
      posts_path
    else
      post_path
    end
  end
  def which_method
    @post.id ? 'patch' : 'post'
  end
end
