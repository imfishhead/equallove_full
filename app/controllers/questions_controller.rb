class QuestionsController < ApplicationController
  def show
  	@question = Question.find(params[:id])
  	@category = @question.category.is_main? ? @question.category : @question.category.parent

  	redirect_to category_path(@category) unless @question.on?

  	render layout: "post"
  end
end
