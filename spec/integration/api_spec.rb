require 'swagger_helper'

describe 'Places API' do
  path '/api/v1/places' do
    post 'Creates a place' do
      tags 'Places'
      consumes 'application/json'
      parameter name: :place, in: :body, schema: {
        type: :object,
        properties: {
          description: { type: :string },
          photo: { type: :string },
          location: { type: :string },
          rate: { type: :number },
          user_id: { type: :number },
          address: { type: :string }
        },
        required: [ 'description', 'location', 'rate', 'user_id', 'address' ]
      }

      response '201', 'place created' do
        let(:place) { { description: 'foo', location: 'bar', rate: 1, user_id: 1, address: 'baz' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:place) { { description: 'foo', location: 'bar' } }
        run_test!
      end
    end
  end

  path '/api/v1/places/{id}' do
    get 'Retrieves a place' do
      tags 'Places'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'place found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            description: { type: :string },
            photo: { type: :string },
            location: { type: :string },
            rate: { type: :number },
            user_id: { type: :number },
            address: { type: :string }
          },
          required: [ 'id', 'description', 'location', 'rate', 'user_id', 'address' ]

        let(:id) { Place.create(description: 'foo', location: 'bar', rate: 1, user_id: 1, address: 'baz').id }
        run_test!
      end

      response '404', 'place not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end