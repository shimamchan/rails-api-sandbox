require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  # initialize test data 
  let(:user) { create(:user) }
  let!(:todos) { create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /todos
  describe 'GET /todos' do
    before { get '/todos', params: {}, headers: headers }
  end

  # Test suite for GET /todos/:id
  describe 'GET /todos/:id' do
    before { get "/todos/#{todo_id}", params: {}, headers: headers }
  end

  # Test suite for POST /todos
  describe 'POST /todos' do
    # valid payload
    let(:valid_attributes) do
      { title: 'Learn Elm', created_by: user.id_to_s }.to_json
    end

    context 'when the request is valid' do
      before { post '/todos', params: valid_attributes, headers: headers }
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) {{ title: nil }.to_json}
      before { post '/todos', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /todos/:id
  describe 'PUT /todos/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/todos/#{todo_id}", params: valid_attributes, headers: headers }
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /todos/:id' do
    before { delete "/todos/#{todo_id}", params: {}, headers: headers }
  end
end