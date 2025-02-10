class ProjectsController < ApplicationController
	before_action :find_project, only: %i[show edit update destroy]
    
	def index
		@projects = Project.all
	end

	def show
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params.merge(user_id: current_user.id))
		if @project.save!
			redirect_to @project
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @project.update(project_params.merge(user_id: current_user.id))
			redirect_to @project
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	private

	def project_params
		params.require(:project).permit(:title, :details, :status)
	end

	def find_project
		@project = Project.find_by(id: params[:id])
	end
end
