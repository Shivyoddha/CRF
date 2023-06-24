class CsvImportService
  require 'csv'

  def call(file)
    opened_file = File.open(file)
    options = { headers: true, col_sep: ';' }
    CSV.foreach(opened_file, **options) do |row|

      # map the CSV columns to your database columns
      user_hash = {}
      user_hash[:name] = row['Name']
      user_hash[:status] = row['Calibrate']
      user_hash[:created_at] = row['Created At']
      user_hash[:updated_at] = row['Updated At']

      Equiplist.find_or_create_by!(user_hash)
      # for performance, you could create a separate job to import each user
      # CsvImportJob.perform_later(user_hash)
    end
  end

  def call_announce(file)
    opened_file = File.open(file)
    options = { headers: true, col_sep: ';', quote_char: "'" }
    CSV.foreach(opened_file, **options) do |row|

      # map the CSV columns to your database columns
      user_hash = {}
      user_hash[:text] = row['Text']
      user_hash[:created_on] = row['Created On']
      user_hash[:created_at] = row['Created At']
      user_hash[:updated_at] = row['Updated At']
      user_hash[:heading] = row['Heading']

      Announcement.find_or_create_by!(user_hash)
      # for performance, you could create a separate job to import each user
      # CsvImportJob.perform_later(user_hash)
    end
  end

  def call_feedback(file)
    opened_file = File.open(file)
    options = { headers: true, col_sep: ';'}
    CSV.foreach(opened_file, **options) do |row|

      # map the CSV columns to your database columns
      user_hash = {}
      user_hash[:username] = row['Username']
      user_hash[:email] = row['Email']
      user_hash[:feedback] = row['Feedback']
      user_hash[:date] = row['Date']
      user_hash[:created_at] = row['Created At']
      user_hash[:updated_at] = row['Updated At']

      Feedback.find_or_create_by!(user_hash)
      # for performance, you could create a separate job to import each user
      # CsvImportJob.perform_later(user_hash)
    end
  end

  def call_user(file)
    opened_file = File.open(file)
    options = { headers: true, col_sep: ';', quote_char: "'"  }
    CSV.foreach(opened_file, **options) do |row|
      # map the CSV columns to your database columns
      user_hash = {}

      user_hash[:email] = row['Email']
      # user_hash[:password] = row['Password']
      user_hash[:password_confirmation] = row['Password Confirmation']
      user_hash[:reset_password_token] = row['Reset password token']
      user_hash[:reset_password_sent_at] = row['Reset Password Sent At']
      user_hash[:remember_created_at] = row['Remember Created At']
      user_hash[:created_at] = row['Created At']
      user_hash[:updated_at] = row['Updated At']
      user_hash[:department] = row['Department']
      user_hash[:course] = row['Course']
      user_hash[:orgname] = row['Orgname']
      user_hash[:orgaddress] = row['Orgaddress']
      user_hash[:collegeid] = row['Collegeid']
      user_hash[:profession] = row['Profession']
      user_hash[:rollno] = row['Rollno']
      user_hash[:contact] = row['Contact']
      user_hash[:lastname] = row['Lastname']
      user_hash[:role] = row['Role']
      user_hash[:admin_role] = row['Admin Role']
      user_hash[:chairman_role] = row['Chairman Role']
      user_hash[:slotbooker] = row['Slotbooker']
      user_hash[:firstname] = row['Firstname']
      user_hash[:faculty_id] = row['Faculty Id']
      user_hash[:status] = row['Status']

      # Set a temporary password for the imported user
      # t.string "encrypted_password", default: "", null: false
      # t.string "reset_password_token"
      #User.find_or_create_by!(user_hash)
      #user = User.create(user_hash)
    #  user = User.find_or_create_by!(email: user_hash[:email], encrypted_password: user_hash[:password])

      user = User.find_or_initialize_by(email: user_hash[:email])
        user.password = user_hash[:password]
        # Assign any other attributes from user_hash if necessary
        user.save!
      # if user.new_record?
      #   user.password = user_hash[:password]
      #   user.save!
      # end
      #   user.assign_attributes(user_hash)
        # user.password = user_hash[:password]
        # user.password_confirmation = user_hash[:password]
        # user.save

      # for performance, you could create a separate job to import each user
      # CsvImportJob.perform_later(user_hash)
    end
  end

  def call_faculty(file)
    opened_file = File.open(file)
    options = { headers: true, col_sep: ';'}
    CSV.foreach(opened_file, **options) do |row|
      # map the CSV columns to your database columns

      user_hash = {}
      user_hash[:created_at] = row['Created At']
      user_hash[:updated_at] = row['Updated At']
      user_hash[:name] = row['Name']
      user_hash[:department] = row['Department']
      user_hash[:email] = row['Email']
      faculty  = Faculty.find_or_create_by!(user_hash)

      #but getting respective users of the faculty is left

      # for performance, you could create a separate job to import each user
      # CsvImportJob.perform_later(user_hash)
    end
  end

  def call_xrd(file)
    opened_file = File.open(file)
    options = { headers: true, col_sep: ';', quote_char: "'" }
    CSV.foreach(opened_file, **options) do |row|
      # map the CSV columns to your database columns
      user_id = row['Id [User]']
  user = User.find_by(id: user_id)
  if user.nil?
      # User not found, skip this row
      next
    end

    xrds = Xrd.new(user: user)
      xrds = user.xrds.build
      user_hash = {}
      user_hash[:sample] = row['Sample']
      user_hash[:measurement] = row['Measurement']
      user_hash[:composition] = row['Composition']
      user_hash[:stype] = row['Stype']
      user_hash[:mind] = row['Mind']
      user_hash[:maxd] = row['Maxd']
      user_hash[:reference] = row['Reference']
      user_hash[:more] = row['More']
      user_hash[:created_at] = row['Created At']
      user_hash[:updated_at] = row['Updated At']
      user_hash[:debit] = row['Debit']
      # user_hash[:user_id] = row['User Id']
      user_hash[:status] = row['Status']
      user_hash[:slottime] = row['Slottime']
      user_hash[:slotdate] = row['Slotdate']
      user_hash[:amount] = row['Amount']
      xrds.attributes = user_hash
      # user.save
      xrds.save!
    end
  end


end
