module ApplicationHelper


  def user_content(&block)
    capture(&block) if current_user
  end

  def logout
    link_to log_out_path do 
    content_tag(:i, "Logout", class: "icon-user")
    end
  end

  def login
    link_to log_in_path do 
    content_tag(:i, "Login", class: "icon-user")
    end
  end
end
