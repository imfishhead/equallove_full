class VideosController < ApplicationController
  def show
  	@video = Video.find(params[:id])
  	@category = @video.category.is_main? ? @video.category : @video.category.parent

  	render layout: "post"
  end
end
