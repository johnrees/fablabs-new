class EventDatetimeValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if value <= record.starts_at
      record.errors[attribute] << "Must be after the starting time"
    end
  end

end
