namespace :import do
  desc "Deletes all existing MacBarfly data and imports new data from csv files in given directory"
  require 'csv'
  IMPORT_DIR = "/Users/rachelcollingridge/Downloads/barfly_data/"

  task import_migration_files: :environment do
    @destroyed_at = DateTime.now #update all destroyed_at records with same timestamp
    # import_model Product
    # import_model Person
    import_model LineItem
    # LineItem.create!(:person => Person.first, :product => Product.first, :purchased_on => Date.today, :quantity => 4, :cost => 1.5)
  end

  def import_model(klass)
    puts "import"
    init_model klass

    CSV.foreach("#{IMPORT_DIR}#{klass.name}.csv", import_options) do |row|
      row_hash = translate_csv_field_names(row.to_hash, klass, @destroyed_at)
      klass.send :create!, row_hash unless row_hash[:migration_id] == "NULL"
    end
    puts "Created #{klass.all.size} #{klass.name} records"
  end

  def translate_csv_field_names(row_hash, klass, destroyed_at = DateTime.now)
    row_hash.keys.each do |key|
      row_hash[key.titleize.parameterize.underscore.to_sym] = row_hash.delete key
    end
    byebug
    case klass.name
    when LineItem.to_s
      puts "yup"
      row_hash.delete :total_cost
      row_hash.delete :last_modified_date
      row_hash[:purchased_on] = row_hash.delete :purchase_date
      row_hash[:person] = Person.find(row_hash[:person_key])
      row_hash.delete :person_key
      row_hash[:product] = Product.find(row_hash[:product_key])
      row_hash.delete :product_key
    when Person.to_s
      row_hash[:last_name] = row_hash.delete :surname
    end

    #modify generic
    row_hash[:migration_id] = row_hash.delete :id
    row_hash[:destroyed_at] = row_hash.delete :is_deleted
    row_hash[:destroyed_at] = row_hash[:destroyed_at] == "TRUE" ? destroyed_at : nil

    row_hash
  end

  def import_options
    @import_options ||= {:headers => true, :converters => :numeric}
  end

  def init_model(klass)
    klass.send :delete_all
    klass.send :reset_pk_sequence
  end
end
