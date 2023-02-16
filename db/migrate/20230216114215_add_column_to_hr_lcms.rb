class AddColumnToHrLcms < ActiveRecord::Migration[7.0]
  def change
    add_column :hr_lcms, :sample, :string
    add_column :hr_lcms, :nsample, :string
    add_column :hr_lcms, :category, :string
    add_column :hr_lcms, :solvent, :string
    add_column :hr_lcms, :analysis, :string
    add_column :hr_lcms, :sampleph, :string
    add_column :hr_lcms, :samplevol, :string
    add_column :hr_lcms, :sanpleconc, :string
    add_column :hr_lcms, :samplesalts, :string
    add_column :hr_lcms, :samplecontain, :string
    add_column :hr_lcms, :storage, :string
    add_column :hr_lcms, :testing, :string
    add_column :hr_lcms, :incompitable, :string
    add_column :hr_lcms, :toxicity, :string
    add_column :hr_lcms, :disposal, :string
    add_column :hr_lcms, :health, :string
    add_column :hr_lcms, :more, :string
  end
end
