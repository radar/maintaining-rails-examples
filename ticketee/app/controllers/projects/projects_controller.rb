module Projects
  class ProjectsController < ApplicationController
    include Dry::Monads[:result]
    include Ticketee::Deps[create_project: "projects.create", repo: :project_repo]

    def index
      @projects = repo.all
    end

    def show
      @project = repo.by_id(params[:id])
    end

    def new
      @project = Projects::Project.new
    end

    def create
      case create_project.(project_params)
        in Success(project)
          flash[:notice] = "Project has been created."
          redirect_to project

        in Failure(result)
          @project = Projects::Project.new(project_params)
          @errors = result.errors
          flash[:alert] = "Project could not be created."
          render :new
      end
    end

    private

    def project_params
      params.require(:project).permit(:name).to_h.symbolize_keys
    end
  end
end
