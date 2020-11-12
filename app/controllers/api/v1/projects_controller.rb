class Api::V1::ProjectsController < ActionController::API
  def create
    if mandatory_project_params_present?
      project = Project.new(project_params)

      if project.save
        render json: ProjectSerializer.new(project).serializable_hash, status: :created
      else
        render json: {errors: project.errors}, status: :unprocessable_entity
      end
    else
      render json: { errors: 'Required params not present' }, status: :bad_request
    end
  end

  private

    def project_params
      params.require(:project).permit(:name, :owner_id, :status, :progress)
    end

    def mandatory_project_params_present?
      required_project_params = %w[name owner_id status]
      project_params_keys = project_params.keys

      required_project_params.all? { |required_param| project_params_keys.include?(required_param) }
    end
end

