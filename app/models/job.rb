# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  start_date  :datetime
#  finish_date :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  store_id    :integer
#  worker_id   :integer
#  employer_id :integer
#  state       :string
#

class Job < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true

  belongs_to :store
  belongs_to :worker
  belongs_to :employer

  before_create :set_worker_id, on: :create


  protected
    def set_worker_id
      self.employer_id = Employer.find_by(id: self.employer_id).id
    end
end
