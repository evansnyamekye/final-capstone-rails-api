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

  path '/api/v1/places/{id}' do
    put 'Updates a place' do
      tags 'Places'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
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

      response '200', 'place updated' do
        let(:id) { Place.create(description: 'foo', location: 'bar', rate: 1, user_id: 1, address: 'baz').id }
        let(:place) { { description: 'foo', location: 'bar', rate: 1, user_id: 1, address: 'baz' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { Place.create(description: 'foo', location: 'bar', rate: 1, user_id: 1, address: 'baz').id }
        let(:place) { { description: 'foo', location: 'bar' } }
        run_test!
      end
    end
  end

  path '/api/v1/places/{id}' do
    delete 'Deletes a place' do
      tags 'Places'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'place deleted' do
        let(:id) { Place.create(description: 'foo', location: 'bar', rate: 1, user_id: 1, address: 'baz').id }
        run_test!
      end

      response '404', 'place not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/places' do
    get 'Retrieves all places' do
      tags 'Places'
      produces 'application/json'

      response '200', 'places found' do
        schema type: :array,
          items: {
            type: :object,
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
          }

        run_test!
      end
    end
  end
end

describe 'Reservations API' do
  path '/api/v1/users/{user_id}/reservations' do
    get 'Retrieves all reservations' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string

      response '200', 'reservations found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              start_date: { type: :string },
              end_date: { type: :string },
              price: { type: :number },
              place_id: { type: :number }
            },
            required: [ 'id', 'start_date', 'end_date', 'price', 'place_id' ]
          }

        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/reservations/{id}' do
    get 'Retrieves a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string

      response '200', 'reservation found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            start_date: { type: :string },
            end_date: { type: :string },
            price: { type: :number },
            place_id: { type: :number }
          },
          required: [ 'id', 'start_date', 'end_date', 'price', 'place_id' ]

        let(:id) { Reservation.create(start_date: '2021-01-01', end_date: '2021-01-02', price: 1, place_id: 1).id }
        let(:user_id) { 1 }
        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        let(:user_id) { 1 }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/reservations' do
    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          start_date: { type: :string },
          end_date: { type: :string },
          price: { type: :number },
          place_id: { type: :number }
        },
        required: [ 'start_date', 'end_date', 'price', 'place_id' ]
      }
    end
  end

  path '/api/v1/users/{user_id}/reservations/{id}' do
    put 'Updates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          start_date: { type: :string },
          end_date: { type: :string },
          price: { type: :number },
          place_id: { type: :number }
        },
        required: [ 'start_date', 'end_date', 'price', 'place_id' ]
      }

      response '200', 'reservation updated' do
        let(:id) { Reservation.create(start_date: '2021-01-01', end_date: '2021-01-02', price: 1, place_id: 1).id }
        let(:user_id) { 1 }
        let(:reservation) { { start_date: '2021-01-01', end_date: '2021-01-02', price: 1, place_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { Reservation.create(start_date: '2021-01-01', end_date: '2021-01-02', price: 1, place_id: 1).id }
        let(:user_id) { 1 }
        let(:reservation) { { start_date: '2021-01-01', end_date: '2021-01-02' } }
        run_test!
      end
    end

    path '/api/v1/users/{user_id}/reservations/{id}' do
      delete 'Deletes a reservation' do
        tags 'Reservations'
        produces 'application/json'
        parameter name: :user_id, in: :path, type: :string
        parameter name: :id, in: :path, type: :string

        response '204', 'reservation deleted' do
          let(:id) { Reservation.create(start_date: '2021-01-01', end_date: '2021-01-02', price: 1, place_id: 1).id }
          let(:user_id) { 1 }
          run_test!
        end

        response '404', 'reservation not found' do
          let(:id) { 'invalid' }
          let(:user_id) { 1 }
          run_test!
        end
      end
    end
  end
end