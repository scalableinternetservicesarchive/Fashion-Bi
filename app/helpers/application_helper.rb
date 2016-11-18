module ApplicationHelper
  # used to check if current path
  def cp(path, classes)
    current_page?(path) ? "active " + classes : classes
  end
end
