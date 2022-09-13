# frozen_string_literal: true

require 'csv'
# class UserExport
class CsvExport
  def initialize(records, attributes)
    @records = records
    @attributes = attributes
  end

  def to_csv
    CSV.generate(headers: true) do |csv|
      csv << @attributes
      @records.all.each do |record|
        csv << @attributes.map { |attr| record.send(attr) }
      end
    end
  end
end
