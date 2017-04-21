json.extract! course, :id, :name, :professor, :location, :weekdays, :time, :created_at, :updated_at
json.url course_url(course, format: :json)
