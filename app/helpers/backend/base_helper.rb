module Backend::BaseHelper
  def edit_button(path)
    link_to '編輯', path, class:'btn btn-success btn-xs'
  end

  def delete_button(path)
    link_to '刪除', path, method: :delete, class:'btn btn-danger btn-xs', data:{confirm:'確定嗎?'}
  end
end
