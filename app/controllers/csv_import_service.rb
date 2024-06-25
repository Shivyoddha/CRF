class CsvImportService
  require 'csv'

  def call(file)
    opened_file = File.open(file)
    options = { headers: true , col_sep: ';'}
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
    options = { headers: true, quote_char: "'", col_sep: ';' }
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
    ##export all fields of user, not foreign key fields..except created at and updated at, with default delimeter ie ,
    ##alt solns , col_sep: ';' in options
    opened_file = File.open(file)
    options = { headers: true, col_sep: ';'}

    CSV.foreach(opened_file, **options) do |row|
      puts "Row: #{row.inspect}"
      full_name = row['Firstname'].to_s.strip
      name_parts = full_name.split(' ')
      firstname = name_parts.shift
      lastname = name_parts.join(' ')

      user_hash = {
        email: row['Email'],
        password: '123456', # Set a default password here
        encrypted_password: '', # Devise will handle this
        reset_password_token: row['Reset Password Token'],
        reset_password_sent_at: row['Reset Password Sent At'],
        remember_created_at: row['Remember Created At'],
        department: row['Department'],
        course: row['Course'],
        orgname: row['Orgname'],
        orgaddress: row['Orgaddress'],
        profession: row['Profession'],
        rollno: row['Rollno'],
        contact: row['Contact'],
        lastname: lastname.presence || row['Lastname'], # Use the split lastname or fallback to the column
        role: row['Role'],
        admin_role: row['Admin Role'],
        chairman_role: row['Chairman Role'],
        slotbooker: row['Slotbooker'],
        firstname: firstname,
        status: row['Status'],
        developer: row['Developer'].present? ? row['Developer'] == 'true' : false,
        announcementadmin: row['Announcementadmin'].present? ? row['Announcementadmin'] == 'true' : false,
        training_slotbooker: row['Training Slotbooker']
      }

      puts "User Hash: #{user_hash.inspect}"

      # Find the user by email or initialize a new user
      user = User.find_or_initialize_by(email: user_hash[:email])

      # Update user attributes
      user.assign_attributes(user_hash)

      # Devise will handle password encryption
      user.encrypted_password = Devise::Encryptor.digest(User, user_hash[:password])

      # Save the user
      user.save!
    end
  end

  def call_faculty(file, col_sep: ';')
    opened_file = File.open(file)
    options = { headers: true }
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
    options = { headers: true, quote_char: "'" , col_sep: ';'}
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
