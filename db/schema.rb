# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_28_081401) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "advance_molecular_rheometers", force: :cascade do |t|
    t.integer "sample"
    t.float "size"
    t.string "nature"
    t.float "temperature"
    t.float "current"
    t.string "shear_type"
    t.float "shear_rate"
    t.string "sweeps"
    t.string "analysis"
    t.string "toxicity"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "debit"
    t.time "slottime"
    t.date "slotdate"
    t.string "stype"
    t.integer "user_id"
    t.index ["user_id"], name: "index_advance_molecular_rheometers_on_user_id"
  end

  create_table "atomic_force_microscopes", force: :cascade do |t|
    t.integer "sample"
    t.string "stype"
    t.string "technique"
    t.float "scan_rate"
    t.float "x"
    t.float "y"
    t.string "description"
    t.string "toxicity"
    t.string "compatability"
    t.string "carcinogenic"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "debit"
    t.time "slottime"
    t.date "slotdate"
  end

  create_table "ball_mailings", force: :cascade do |t|
    t.integer "sample"
    t.string "feed"
    t.string "btype"
    t.string "grind"
    t.string "specify"
    t.float "size"
    t.float "grinding"
    t.float "speed"
    t.string "hardness"
    t.string "toxicity"
    t.string "compatibility"
    t.string "more"
    t.string "status"
    t.date "slotdate"
    t.time "slottime"
    t.string "debit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_ball_mailings_on_user_id"
  end

  create_table "bets", force: :cascade do |t|
    t.string "sample"
    t.string "degassing"
    t.string "analysis"
    t.string "incompatibe"
    t.string "toxicity"
    t.string "disposal"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cell_imagings", force: :cascade do |t|
    t.string "sample"
    t.string "stype"
    t.string "plate"
    t.string "expected_wavelenght"
    t.string "assay_type"
    t.string "detection"
    t.string "image_filter"
    t.string "image_mode"
    t.string "toxicity"
    t.string "compatibility"
    t.string "hazard"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "status"
    t.text "feature"
    t.text "resolution"
    t.text "location"
    t.text "application"
    t.text "facilities"
  end

  create_table "faculties", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "department"
    t.string "email"
  end

  create_table "frictions", force: :cascade do |t|
    t.integer "sample"
    t.string "material"
    t.string "pstype"
    t.string "tool"
    t.string "toolnom"
    t.float "rspeed"
    t.float "wspeed"
    t.float "otforce"
    t.float "wtforce"
    t.string "measurement"
    t.float "depth"
    t.float "ptforce"
    t.string "more"
    t.string "status"
    t.date "slotdate"
    t.time "slottime"
    t.string "debit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "temp"
    t.integer "user_id"
    t.index ["user_id"], name: "index_frictions_on_user_id"
  end

  create_table "gaits", force: :cascade do |t|
    t.string "subject"
    t.string "measurement"
    t.integer "trials"
    t.string "output_format"
    t.string "force_plate"
    t.string "clinical_trial"
    t.string "physician"
    t.string "more"
    t.string "status"
    t.date "slotdate"
    t.time "slottime"
    t.string "debit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_gaits_on_user_id"
  end

  create_table "glows", force: :cascade do |t|
    t.integer "sample"
    t.string "elemental"
    t.string "coated"
    t.string "coated_ele"
    t.string "substarte"
    t.string "specification"
    t.string "more"
    t.string "status"
    t.date "slotdate"
    t.time "slottime"
    t.string "debit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_glows_on_user_id"
  end

  create_table "grindings", force: :cascade do |t|
    t.integer "sample"
    t.float "diameter"
    t.string "mould"
    t.string "grit"
    t.string "diamond"
    t.string "suspension"
    t.string "lapping"
    t.string "more"
    t.string "status"
    t.date "slotdate"
    t.time "slottime"
    t.string "debit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_grindings_on_user_id"
  end

  create_table "hr_fesem_cs", force: :cascade do |t|
    t.integer "sample"
    t.string "composition"
    t.string "stype"
    t.string "sphase"
    t.string "measurement"
    t.string "eds_required"
    t.string "toxic"
    t.string "conducting"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "debit"
    t.time "slottime"
    t.date "slotdate"
    t.integer "user_id"
    t.index ["user_id"], name: "index_hr_fesem_cs_on_user_id"
  end

  create_table "hr_fesem_js", force: :cascade do |t|
    t.string "sample"
    t.string "composition"
    t.string "stype"
    t.string "sphase"
    t.string "measurement"
    t.string "eds_required"
    t.string "toxic"
    t.string "conducting"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "status"
    t.string "slottime"
    t.string "slotdate"
    t.string "debit"
    t.index ["user_id"], name: "index_hr_fesem_js_on_user_id"
  end

  create_table "hrlcms", force: :cascade do |t|
    t.integer "sample"
    t.string "nature_sample"
    t.string "category"
    t.string "sample_type"
    t.string "solvent"
    t.string "analysis"
    t.float "sample_volume"
    t.string "sample_concentration"
    t.string "sample_salts"
    t.string "sample_contains"
    t.string "storage"
    t.string "testing_required"
    t.string "incompatible"
    t.string "toxicity"
    t.string "disposal"
    t.string "health"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "debit"
    t.time "slottime"
    t.date "slotdate"
    t.integer "user_id"
    t.index ["user_id"], name: "index_hrlcms_on_user_id"
  end

  create_table "icp_ms", force: :cascade do |t|
    t.integer "sample"
    t.string "composition"
    t.string "sample_phase"
    t.string "nature"
    t.string "concentration"
    t.string "testing"
    t.string "toxicity"
    t.string "compatibility"
    t.string "hazard"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "debit"
    t.time "slottime"
    t.date "slotdate"
    t.string "acid"
    t.string "storage_condition"
    t.string "temp"
    t.integer "user_id"
    t.index ["user_id"], name: "index_icp_ms_on_user_id"
  end

  create_table "integrated_multi_role_testers", force: :cascade do |t|
    t.string "sample"
    t.string "measurement"
    t.string "type"
    t.string "loading"
    t.string "temperature"
    t.string "analysis"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ion_chromotographies", force: :cascade do |t|
    t.integer "sample"
    t.string "nature"
    t.string "solvent"
    t.float "volume"
    t.float "concentration"
    t.string "eluent"
    t.string "analysis"
    t.string "elements"
    t.string "column"
    t.float "flow_rate"
    t.float "temperature"
    t.string "detector"
    t.string "toxicity"
    t.string "hazards"
    t.string "disposal"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "debit"
    t.time "slottime"
    t.date "slotdate"
    t.string "hazard_yes"
    t.string "disposal_yes"
    t.integer "user_id"
    t.index ["user_id"], name: "index_ion_chromotographies_on_user_id"
  end

  create_table "low_fatigues", force: :cascade do |t|
    t.integer "sample"
    t.string "sc1"
    t.string "st1"
    t.string "tt1"
    t.string "tf1"
    t.string "sc2"
    t.string "st2"
    t.string "tt2"
    t.string "tf2"
    t.string "sc3"
    t.string "st3"
    t.string "tt3"
    t.string "tf3"
    t.string "sc4"
    t.string "st4"
    t.string "tt4"
    t.string "tf4"
    t.string "sc5"
    t.string "st5"
    t.string "tt5"
    t.string "tf5"
    t.string "more"
    t.time "slottime"
    t.date "slotdate"
    t.string "status"
    t.string "debit"
    t.string "m1"
    t.string "m2"
    t.string "m3"
    t.string "m4"
    t.string "m5"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_low_fatigues_on_user_id"
  end

  create_table "multi_impact_testers", force: :cascade do |t|
    t.integer "sample"
    t.string "stype"
    t.integer "size"
    t.string "measuerment"
    t.float "drop_range"
    t.float "drop_velocity"
    t.float "drop_temp"
    t.string "drop_shape"
    t.float "shpb_lenght"
    t.float "shpb_temp"
    t.float "bullet_velocity"
    t.float "bullet_shape"
    t.float "bird_velocity"
    t.string "bird_shape"
    t.string "more"
    t.string "status"
    t.date "slotdate"
    t.time "slottime"
    t.string "debit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_multi_impact_testers_on_user_id"
  end

  create_table "nameps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "raman_microscopes", force: :cascade do |t|
    t.string "sample"
    t.string "measurement"
    t.string "stype"
    t.string "description"
    t.string "toxicity"
    t.string "Compatability"
    t.string "carcinogenic"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scratch_indentations", force: :cascade do |t|
    t.string "sample"
    t.string "type"
    t.string "measurement"
    t.string "stroke"
    t.string "number_indentation"
    t.string "constant_load"
    t.string "increment_load"
    t.string "progressive_load"
    t.string "temperature"
    t.string "analysis"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tga_fttrs", force: :cascade do |t|
    t.string "sample"
    t.string "measurement"
    t.string "stype"
    t.string "description"
    t.string "nature"
    t.string "min_temp"
    t.string "max_temp"
    t.string "scan_rate"
    t.string "atmosphere"
    t.string "hazard"
    t.string "compatability"
    t.string "carcinogenic"
    t.string "explosive"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "three_d_non_contacts", force: :cascade do |t|
    t.string "sample"
    t.string "scant"
    t.string "range"
    t.string "stepinterval"
    t.string "incompatible"
    t.string "toxicity"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tribometers", force: :cascade do |t|
    t.integer "sample"
    t.string "measurement"
    t.string "stype"
    t.float "temp_req"
    t.float "loading"
    t.string "indenter"
    t.float "stroke"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "debit"
    t.time "slottime"
    t.date "slotdate"
    t.integer "user_id"
    t.index ["user_id"], name: "index_tribometers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "department"
    t.string "course"
    t.string "orgname"
    t.string "orgaddress"
    t.binary "collegeid"
    t.string "profession"
    t.string "rollno"
    t.string "contact"
    t.string "lastname"
    t.string "role"
    t.boolean "admin_role"
    t.boolean "chairman_role"
    t.string "name"
    t.string "slotbooker"
    t.string "firstname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "uv_vis_nirs", force: :cascade do |t|
    t.string "sample"
    t.string "srange"
    t.string "erange"
    t.string "measurement"
    t.string "composition"
    t.string "toxicity"
    t.string "sampletype"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "xrds", force: :cascade do |t|
    t.integer "sample"
    t.string "measurement"
    t.string "composition"
    t.string "stype"
    t.float "mind"
    t.float "maxd"
    t.binary "reference"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "debit"
    t.integer "user_id"
    t.string "status"
    t.time "slottime"
    t.date "slotdate"
    t.index ["user_id"], name: "index_xrds_on_user_id"
  end

  create_table "zeta_potential_sizes", force: :cascade do |t|
    t.string "sample"
    t.string "type"
    t.string "toxicity"
    t.string "element"
    t.string "solvent"
    t.string "refractive_index"
    t.string "viscosity"
    t.string "solute"
    t.string "angle"
    t.string "analysis_type"
    t.string "analysis_temperature"
    t.string "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "advance_molecular_rheometers", "users"
  add_foreign_key "ball_mailings", "users"
  add_foreign_key "frictions", "users"
  add_foreign_key "gaits", "users"
  add_foreign_key "glows", "users"
  add_foreign_key "grindings", "users"
  add_foreign_key "hr_fesem_cs", "users"
  add_foreign_key "hr_fesem_js", "users"
  add_foreign_key "hrlcms", "users"
  add_foreign_key "icp_ms", "users"
  add_foreign_key "ion_chromotographies", "users"
  add_foreign_key "low_fatigues", "users"
  add_foreign_key "multi_impact_testers", "users"
  add_foreign_key "tribometers", "users"
  add_foreign_key "xrds", "users"
end
