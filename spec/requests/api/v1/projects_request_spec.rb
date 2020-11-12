require 'rails_helper'

RSpec.describe 'Api::V1::Projects', type: :request do
  describe 'POST /projects' do
    context 'required params are not present' do
      it 'returns with the appropriate error message and status code' do
        project_params = { project: { name: 'new project' } }

        post '/api/v1/projects', params: project_params

        parsed_response_body = JSON.parse(@response.body)

        expect(@response.status).to eq(400)
        expect(parsed_response_body['errors']).to eq('Required params not present')
      end
    end

    context 'required params are present' do
      context 'Project params has valid data' do
        it 'returns the created idea info and the appropriate status code' do
          project_params = { project: { name: 'new project', status: 'planned', owner_id: 'f4587606-4504-453c-8e7b-fe6029847d41' } }

          expect { post '/api/v1/projects', params: project_params }.to change { Project.count }.by(1)

          parsed_response_body = JSON.parse(@response.body)

          expect(@response.status).to eq(201)
          expect(parsed_response_body['data']['attributes']).to eq(
            'name' => 'new project',
            'owner_id' => 'f4587606-4504-453c-8e7b-fe6029847d41',
            'status' => 'planned',
            'progress' => 0.0
          )
        end
      end

      context 'Project params has invalid data' do
        it 'returns the appropriate error message and status code' do
          project_params = { project: { name: '', status: 'planned', owner_id: 'f4587606-4504-453c-8e7b-fe6029847d41' } }

          expect { post '/api/v1/projects', params: project_params }.to change { Project.count }.by(0)

          parsed_response_body = JSON.parse(@response.body)

          expect(@response.status).to eq(422)
          expect(parsed_response_body['errors']).to eq(
            'name' => ["can't be blank"]
          )
        end
      end
    end
  end
end
