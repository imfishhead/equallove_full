class QuestionsController < ApplicationController
  def show
  	@question = Question.find(params[:id])
  	@category = @question.category.is_main? ? @question.category : @question.category.parent

  	render layout: "post"
  end
end
