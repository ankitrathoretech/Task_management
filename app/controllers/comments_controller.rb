class CommentsController < ApplicationController
	before_action :set_project
	before_action :set_comment, only: [:edit. :update, :destroy]

  def new
		@comment = Comment.new
	end

	def create
		@comment = @projects.comments.build(comment_params)
		@comment.user = current_user

		if @comment.save
      redirect_to @project, notice: "Comment created successfully."
    else
      render :new
    end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
      redirect_to @project, notice: "Comment updated successfully."
    else
      render :edit
    end
	end
		
	def destroy
		@comment.destroy
		redirect_to @project, notice: "Comment deleted successfully."
	end

	private

	def comment_params
		params.expect(comment: [:content])
	end

	def set_project
    @project = Project.find(params[:project_id])
  end

  def set_comment
		@comment = @project.comments.find(params[:id])
	end
end
