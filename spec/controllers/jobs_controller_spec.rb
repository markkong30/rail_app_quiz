require 'rails_helper'

RSpec.describe JobsController, type: :controller do
render_views

describe 'POST /jobs' do 
  it 'creates a new job object' do
    post :create, params: { 
      job: {
        job_title: 'programmer'
      }
    }

    assert_equal Job.count, 1
    
    assert_equal response.body, ({
      job: { 
        id: 1,
        url: nil, 
        employer_name: nil, 
        employer_description: nil, 
        job_title: "programmer", 
        job_description: nil, 
        year_of_experience: nil, 
        education_requirement: nil, 
        industry: nil, 
        base_salary: nil, 
        employment_type_id: nil, 
        created_at: Job.first.created_at, 
        updated_at: Job.first.updated_at
      }
    }.to_json)
  end
end

describe 'GET /jobs' do
  it 'gets all jobs objects' do
    job_1 = Job.create(job_title: 'job#1')
    job_2 = Job.create(job_title: 'job#2')
    
    get :index

    assert_equal response.body, ({
      jobs: [
        { 
        id: 1,
        url: nil, 
        employer_name: nil, 
        employer_description: nil, 
        job_title: "job#1", 
        job_description: nil, 
        year_of_experience: nil, 
        education_requirement: nil, 
        industry: nil, 
        base_salary: nil, 
        employment_type_id: nil, 
        created_at: job_1.created_at, 
        updated_at: job_1.updated_at
      },
      { 
        id: 2,
        url: nil, 
        employer_name: nil, 
        employer_description: nil, 
        job_title: "job#2", 
        job_description: nil, 
        year_of_experience: nil, 
        education_requirement: nil, 
        industry: nil, 
        base_salary: nil, 
        employment_type_id: nil, 
        created_at: job_2.created_at, 
        updated_at: job_2.updated_at
      },
    ]
    }.to_json)
    end
  end

  describe 'GET /show/:id' do
    it 'shows all job objects' do
      job = Job.create(job_title: 'job')
      get :show, params: { id: job.id }

      assert_equal response.body, ({
        job: {
          id: job.id,
          url: nil, 
          employer_name: nil, 
          employer_description: nil, 
          job_title: "job", 
          job_description: nil, 
          year_of_experience: nil, 
          education_requirement: nil, 
          industry: nil, 
          base_salary: nil, 
          employment_type_id: nil, 
          created_at: job.created_at, 
          updated_at: job.updated_at
        }
      }.to_json)
    end
  end

  describe 'GET /show/:id' do
    it 'render error message with unknown id' do
      job = Job.create(job_title: 'job')
      get :show, params: { id: -1 }

      #expect(response).to render_template(:error)
      expect(response.body).to include("Task Not Found")
    end
  end
  
end
