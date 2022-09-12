# frozen_string_literal: true

require 'csv'
module ExportService
  # class UserExport
  class CampExport
    def initialize(data)
      @data = data
    end

    def to_csv
      attributes = %w[id camp_title camp_type locations applicant_registration_time parent_registration_time created_at]
      CSV.generate(headers: true) do |csv|
        csv << attributes
        @data.all.each do |user|
          csv << attributes.map { |attr| user.send(attr) }
        end
      end
    end
  end
end
