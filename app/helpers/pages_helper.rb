module PagesHelper
  def in_progress(stage)
    "active" if Setting.progress.to_i >= stage.to_i 
  end
end
