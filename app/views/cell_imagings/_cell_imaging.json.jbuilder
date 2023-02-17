json.extract! cell_imaging, :id, :sample, :stype, :plate, :expected_wavelenght, :assay_type, :detection, :image_filter, :image_mode, :toxicity, :compatibility, :hazard, :more, :created_at, :updated_at
json.url cell_imaging_url(cell_imaging, format: :json)
