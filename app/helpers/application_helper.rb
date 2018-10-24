module ApplicationHelper
  def has_asset?(path)
    Rails.application.assets.find_asset(path) != nil
  end

  def profile_pic_tag(path, options = {})
    if has_asset?(path)
    	image_tag path, options
    else
    	image_tag "profile_pics/default.png", options
    end
  end
end
