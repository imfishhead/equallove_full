class VideosController < ApplicationController
  def show
  	@video = Video.find(params[:id])
  	@category = @video.category.is_main? ? @video.category : @video.category.parent

  	redirect_to category_path(@category) unless @video.on?

  	render layout: "post"
  end
end
